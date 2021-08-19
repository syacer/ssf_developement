/*
   american fuzzy lop - wrapper for GNU as
   ---------------------------------------

   Written and maintained by Michal Zalewski <lcamtuf@google.com>

   Copyright 2013, 2014, 2015 Google Inc. All rights reserved.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at:

     http://www.apache.org/licenses/LICENSE-2.0

   The sole purpose of this wrapper is to preprocess assembly files generated
   by GCC / clang and inject the instrumentation bits included from afl-as.h. It
   is automatically invoked by the toolchain when compiling programs using
   afl-gcc / afl-clang.

   Note that it's an explicit non-goal to instrument hand-written assembly,
   be it in separate .s files or in __asm__ blocks. The only aspiration this
   utility has right now is to be able to skip them gracefully and allow the
   compilation process to continue.

   That said, see experimental/clang_asm_normalize/ for a solution that may
   allow clang users to make things work even with hand-crafted assembly. Just
   note that there is no equivalent for GCC.

 */

#include "config.h"
#include "types.h"
#include "debug.h"
#include "alloc-inl.h"
#include <time.h>
#include "as_wrap.h"

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>
#include <fcntl.h>

#include <sys/wait.h>
#include <sys/time.h>
#include <sys/stat.h>
#include <unistd.h>


static u8* log_dir;
static u8* sfiles;
static u8** as_params;          /* Parameters passed to the real 'as'   */

static u8*  input_file;         /* Originally specified input file      */
static u8*  modified_file;      /* Instrumented file for the real 'as'  */

static u8   just_version;       /* Just show version?                   */

static u32  as_par_cnt = 1;     /* Number of params to 'as'             */

static u32 nextEdgeNumber() {
  
  static u32 value = LFSRSTARTNUM;

  uint32_t bit = (value >> 0) ^ (value >> 10) ^ (value >> 11) ^ (value >> 12) ^
    (value >> 14) ^ (value >> 15) ^ (value >> 17) ^ (value >> 19) ^ (value >> 20) ^
    (value >> 22) ^ (value >> 24) ^ (value >> 26) ^ (value >> 28) ^ (value >> 31);
  value = (value >> 1) | (bit << 31);
  
  
  if (value == LFSRSTARTNUM) WARNF("LFSR sequence is full \n");
  
  return value;
}

/* Examine and modify parameters to pass to 'as'. Note that the file name
   is always the last parameter passed by GCC, so we exploit this property
   to keep the code simple. */



static void edit_params(int argc, char** argv) {
  
  u8 *pwd = (u8*)getenv("PWD");
  sfiles = (u8*)malloc(FILENAME_MAX);
  u32 i;

  char dirname[50];
  u32 t = (u32)time(NULL);
  
  
  struct stat st;

  if (stat("compile_log", &st) == -1) {
    mkdir("compile_log", 0777);
  }

  sprintf(dirname, "/compile_log/log-%u", t);

  log_dir = strcat(pwd, dirname);
  log_dir = strcat(log_dir, "");
 
  strcpy(sfiles, log_dir);
  
  mkdir(sfiles, 0777);

  strcat(sfiles, "/assembly");

  mkdir(sfiles, 0777);

  as_params = ck_alloc((argc + 32) * sizeof(u8*));

  as_params[0] =  (u8*)"as";

  as_params[argc] = 0;

  for (i = 1; i < argc - 1; i++) {
    if (!strcmp(argv[i], "--32")) FATAL("Unsupport for 32-bit binaries");
    as_params[as_par_cnt++] = argv[i];
  }

  input_file = argv[argc - 1];

  if (input_file[0] == '-') {

    if (!strcmp(input_file + 1, "-version")) {
      just_version = 1;
      modified_file = input_file;
      goto wrap_things_up;
    }

    if (input_file[1]) FATAL("Incorrect use (not called through compile_wrap?)");
      else input_file = NULL;

  }
  
  char name[FILENAME_MAX];
  char* lastbackslash = strrchr(input_file, '/');
  char* lastdot = strrchr(input_file, '.');
  
  memcpy(name, lastbackslash + 1, lastdot - lastbackslash + 1);
  modified_file = alloc_printf("%s/inst-%s-%u.s", sfiles, name, getpid());


wrap_things_up:

  as_params[as_par_cnt++] = modified_file;
  as_params[as_par_cnt]   = NULL;

}

static void 
amendoprandName(
  char* instLine, 
  int il, 
  int ir,
  char* op, 
  u32 *byteH
) {
 
 char subStr[MAX_LINE]; 

 memset(subStr,0, MAX_LINE);
 memcpy(subStr, instLine + il, ir - il + 1);
 if (subStr[0] == '$' || strstr(subStr, "(")) {
   // op is an imm number or memory addressing
   memcpy(op, subStr, ir - il + 1);
 }
 else if (subStr[1] == 'r' && isalpha(subStr[2])) {
   // rax, rbx, rcx, rdx, rsi, rdi, rbp, rsp
   memcpy(op, subStr, ir - il + 1);
 }
 else if (subStr[1] == 'r' && !isalpha(subStr[2])) {
  if (isalpha(subStr[ir - il])) {
     // r8w, r8b, r9w, r9b .....
    memcpy(op, subStr, ir - il);
  }
  else {
     // r8, r9 ....
    memcpy(op, subStr, ir - il + 1);
  }
 }
 else if (subStr[1] == 'e') {
  // eax, ebx, ecx, edx, esi, edi, ebp ,esp
  subStr[1] = 'r';
  memcpy(op, subStr, ir - il + 1);
 }
 else if (strstr(subStr, "l") || strstr(subStr, "h")) {
   op[0] = '%';
   op[1] = 'r';
   memcpy(op+2, subStr + 1, ir - il);
   if (op[2] >= 'a' && op[2] <= 'd' 
       && (op[3] == 'l' || op[3] == 'h')) {
     // al, ah, bl, bh, cl, ch, dl, dh
     op[3] = 'x';
     *byteH = strstr(subStr, "l") ? 2 : 1;
   }
   else {
     // sil, dil, bpl, spl
     op[4] = 0;
   }
 }
 else {
  // ax, bx, cx dx, si, di, bp, sp
  op[0] = '%';
  op[1] = 'r';
  memcpy(op+2, subStr + 1, ir - il);
 }
}

static void regSelect(char* reg1, char* reg2, char* tmpReg1, char* tmpReg2) {
  char regChoice[4][5]  = { "%rdx", "%rcx", "%rbx", "%rax"};
  for (int i = 0; i < 4; i++) {
    if (strstr(reg1, regChoice[i])) {
      strcpy(regChoice[i], "    ");
    }
  }
  for (int i = 0; i < 4; i++) {
    if (strstr(reg2, regChoice[i])) {
      strcpy(regChoice[i], "    ");
    }
  }
  
  for (int i = 0; i < 4; i++) {
    if (strcmp(regChoice[i], "    ")) {
      strcpy(tmpReg1, regChoice[i]);
      strcpy(regChoice[i], "    ");
      break;
    }
  }
  for (int i = 0; i < 4; i++) {
    if (strcmp(regChoice[i], "    ")) {
      strcpy(tmpReg2, regChoice[i]);
      strcpy(regChoice[i], "    ");
      break;
    }
  }
}
static void add_instrumentation(void) {

  static u8 line[MAX_LINE];

  FILE* inf;
  FILE* outf;
  s32 outfd;
  u32 tmpCmpid = 0;
  u32 gid = 0;
  char gcntBuf[FILENAME_MAX] = {0};
  char jmpTableFile[FILENAME_MAX] = {0};
  u32 lcnt = 0;
  char suffix[] = {'$', '\'', 'z', '\'', 0};
  char op1[MAX_LINE];
  u32 byteHOp1 = 0;
  char op2[MAX_LINE];
  u32 byteHOp2 = 0;
  u32 edgeId;
  u32 jumpNext = 0;
  
  strcat(gcntBuf,"gcnt.log");
  
  strcat(jmpTableFile, JUMP_TABLE_FILE_NAME);
  
  FILE* inf2 = fopen(gcntBuf, "r");
  FILE* inf3 = fopen(jmpTableFile, "a");
  if (inf3 == NULL) {
    FATAL("Unable to create jmpTableFile %s  with errorno: %d\n", jmpTableFile, errno);
  }

  if (inf2) {
    while (1) {
      char c = fgetc(inf2);
      if (feof(inf2)) {
        break;
      }
      lcnt++;
      gid = gid * 10 + atoi(&c);
    }
    fclose(inf2);
    remove(gcntBuf);
  }
  
  if (gid > MAX_CMP_STORAGE) {
    FATAL("Number of cmp nodes beyond the maximum capability program exit!\n");
  }

  inf = fopen(input_file, "r");
  if (!inf) PFATAL("Unable to read '%s'", input_file);

  outfd = open(modified_file, O_WRONLY | O_EXCL | O_CREAT, 0777);

  if (outfd < 0) PFATAL("Unable to write to '%s'", modified_file);
  
  outf = fdopen(outfd, "w");

  if (!outf) PFATAL("fdopen() failed");  
  
  while (fgets(line, MAX_LINE, inf)) {
    
    if (strncmp(line, "\tcmp",4) != 0) {
      fprintf(outf, "%s", line);
    }

    if (strncmp(line, "main:",5) == 0) {
      fprintf(outf, "%s", trampoline_server);
    }
   
    edgeId = nextEdgeNumber();

    if (strstr(line, ":") && line[0] == '.' && isdigit(line[2])) {
     fprintf(outf, trampoline_edge, edgeId);
     // printf(trampoline_edge, edgeId);
    }

    if (line[0] == '\t' && line[1] == 'j' && line[2] != 'm') {
      fprintf(outf, trampoline_edge, edgeId);
     // printf(trampoline_edge, edgeId);
    }


//jmp_type_id: JE/JZ: 1; JNE/JNZ: 2; JB/JNAE: 3; JNB/JAE: 4
//JBE/JNA: 5; JA/JNBE: 6; JL/JNGE: 7; JGE/JNL: 8; JLE/JNG 9;
//JG/JNLE: 10; unknowns: 11; js: 12; jns: 13;
    if (jumpNext == 1 && strncmp(line, "\tj", 2) == 0) {
      jumpNext = 0;
      
      char* lastptr = strchr(line + 1, '\t') - 1;
      char* firstptr = (line+1);
      size_t size = lastptr - firstptr + 1;
      int typeNum = 11;

      if (size == 2) {
        if (*(firstptr + 1) == 'e' || *(firstptr + 1) == 'z') {
          typeNum = 1;
        }

        if (*(firstptr + 1) == 'b'){
          typeNum = 3;
        }

        if (*(firstptr + 1) == 'a'){
          typeNum = 6;
        }

        if (*(firstptr + 1) == 'l'){
          typeNum = 7;
        }
  
        if (*(firstptr + 1) == 'g') {
          typeNum = 10;
        }
        
        if (*(firstptr + 1) == 's'){
          typeNum = 12;
        }
      }
      if (size == 3) {
        if (*(firstptr + 1) == 'n') {
          if (*(firstptr + 2) == 'e' || *(firstptr + 2) == 'z') {
            typeNum = 2;
          }
  
          if (*(firstptr + 2) == 'b'){
            typeNum = 4;
          }
  
          if (*(firstptr + 2) == 'a'){
            typeNum = 5;
          }
  
          if (*(firstptr + 1) == 'l'){
            typeNum = 8;
          }
    
          if (*(firstptr + 1) == 'g') {
            typeNum = 9;
          }
          
          if (*(firstptr + 1) == 's'){
            typeNum = 13;
          }
        }
        if (*(firstptr + 1) == 'a' && *(firstptr + 2) == 'e') {
            typeNum = 4;
        }
        
        if (*(firstptr + 1) == 'b' && *(firstptr + 2) == 'e') {
            typeNum = 5;
        }
        
        if (*(firstptr + 1) == 'g' && *(firstptr + 2) == 'e') {
            typeNum = 8;
        }
        
        if (*(firstptr + 1) == 'l' && *(firstptr + 2) == 'e') {
            typeNum = 9;
        }
      }

      if (size == 4) {
      
        if (*(firstptr + 1) == 'a' && *(firstptr + 2) == 'n' 
            && *(firstptr + 3) == 'e') {
            typeNum = 3;
        }

        if (*(firstptr + 1) == 'n' && *(firstptr + 2) == 'b' 
            && *(firstptr + 3) == 'e') {
            typeNum = 6;
        }
        
        if (*(firstptr + 1) == 'n' && *(firstptr + 2) == 'g' 
            && *(firstptr + 3) == 'e') {
            typeNum = 7;
        }

        if (*(firstptr + 1) == 'n' && *(firstptr + 2) == 'l' 
            && *(firstptr + 3) == 'e') {
            typeNum = 10;
        }
      }
      
      fprintf(inf3, "%u %d %s", tmpCmpid, typeNum, line + 1);
    }

    if (strncmp(line, "\tcmp",4) == 0) {

      jumpNext = 1;
      suffix[2]= line[4];
      ++gid;
      tmpCmpid = gid;
      memset(op1, 0, MAX_LINE);
      memset(op2, 0, MAX_LINE);
      int i1l = 6;
      int i1r = 0;
      
      u8  addressOnSecond= 0;
      
      u8* loc = strstr(line, "(");
      if (loc != NULL) {
        while (loc - line > 0) {
          if (*loc == ',') {
            i1r = (u8*)strchr(line, ',') - line - 1;
            addressOnSecond = 1;
            break;
          }
          loc--;
        }
        if (addressOnSecond == 0) {
          i1r = (u8*)strrchr(line, ',') - line - 1;
        }
      }
      else {
         i1r = (u8*)strchr(line, ',') - line - 1;
      }
      amendoprandName(line, i1l, i1r, op1, &byteHOp1);

      int i2l = i1r + 3;
      int i2r = (u8*)strrchr(line, '\n') - line - 1;
      amendoprandName(line, i2l, i2r, op2, &byteHOp2);     
      
      char tmpReg1[5];
      char tmpReg2[5];
      
      regSelect(op1, op2, tmpReg1, tmpReg2);
     
      fprintf(outf, trampoline_cmp, tmpReg1, tmpReg2, tmpReg1,
          '$', gid, tmpReg1, suffix, tmpReg1, op1, tmpReg2, tmpReg2, tmpReg1, '$', byteHOp1, 
          tmpReg1, op2, tmpReg2, tmpReg2, tmpReg1, '$', byteHOp2, tmpReg1, tmpReg1, tmpReg1, tmpReg2);

 /*     printf(trampoline_cmp, tmpReg1, tmpReg2, tmpReg1,
          '$', gid, tmpReg1, suffix, tmpReg1, op1, tmpReg2, tmpReg2, tmpReg1, '$', byteHOp1, 
          tmpReg1, op2, tmpReg2, tmpReg2, tmpReg1, '$', byteHOp2, tmpReg1, tmpReg1, tmpReg1, tmpReg2);
*/      
      fprintf(outf, "%s", line);
    }
  }

  fprintf(outf, "%s", trampoline_storeEdge);
  fprintf(outf, "%s",trampoline_storeDataFn);
  fprintf(outf, "%s", trampoline_server_initialization);
  inf2 = fopen(gcntBuf, "w+");
  fprintf(inf2, "%d", gid);
  fclose(inf2);
  fclose(inf3);
  fclose(outf);
}

/* Main entry point */

int main(int argc, char** argv) {

  s32 pid;
  int status;
  
  if (argc < 2) {
    SAYF("\n Do not run this program directly.\n");
    exit(1);

  }

  edit_params(argc, argv);

  if (!just_version) add_instrumentation();

  if (!(pid = fork())) {
    execvp(as_params[0], (char**)as_params);
    FATAL("Oops, failed to execute '%s' - check your PATH", as_params[0]);

  }

  if (pid < 0) PFATAL("fork() failed");

  if (waitpid(pid, &status, 0) <= 0) PFATAL("waitpid() failed");

  exit(WEXITSTATUS(status));

}

