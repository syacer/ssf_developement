
#ifndef _HAVE_AFL_AS_H
#define _HAVE_AFL_AS_H

#include "config.h"
#include "types.h"
#include "stdlib.h"



#define CALL_L64(str)   "call " str "@PLT\n"

/*

  "  leaq .debug(%rip), %rdi \n"
  "  movq shmptr_cmp(%rip), %rsi \n"
  "  movq (%rsi), %rsi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("printf")
  
  "  leaq .debug(%rip), %rdi \n"
  "  movq shmptr_edge(%rip), %rsi \n"
  "  movq (%rsi), %rsi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("printf")

  "  leaq .debug(%rip), %rdi \n"
  "  movq shmptr_gcnt(%rip), %rsi \n"
  "  movq (%rsi), %rsi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("printf")
*/

static const u8* trampoline_server = 
  "\n"
  "/* --- trampoline on server start --- */ \n"
  
  "  movq %rax, tmpquadrax(%rip)\n"
  "  movq %rdi, tmpquadrdi(%rip) \n"
  "  movq %rsi, tmpquadrsi(%rip) \n"
  "  call __afl_setup_first\n"
  "  cmpb $127, %al \n"
  "  jne runSUT\n"
  "  leaq .serverSetupError(%rip), %rdi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("printf")
 
  "  movq $"MAP_SIZE_STR",  %rdi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("malloc")
  "  movq %rax, shmptr_edge(%rip)  \n"
  
  "  movq $"MAP_SIZE_STR",  %rdi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("malloc")
  "  movq %rax, shmptr_cmp(%rip)  \n"

  "  movq $8,  %rdi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("malloc")
  "  movq %rax, shmptr_gcnt(%rip)  \n"

/*
  "  leaq .debug(%rip), %rdi \n"
  "  movq shmptr_cmp(%rip), %rsi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("printf")
  
  "  leaq .debug(%rip), %rdi \n"
  "  movq shmptr_edge(%rip), %rsi \n"
  "  movq shmptr_gcnt(%rip), %rsi \n"
  "  movq (%rsi), %rsi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("printf")

  "  leaq .debug(%rip), %rdi \n"
  "  movq shmptr_gcnt(%rip), %rsi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("printf")
*/

  "runSUT:\n"
  "  movq tmpquadrax(%rip), %rax\n"
  "  movq tmpquadrsi(%rip), %rsi\n"
  "  movq tmpquadrdi(%rip), %rdi\n"

  "\n"
  "/* --- trampoline on server end --- */ \n";


/************************************
 * instrument before cmp instruction
 ************************************/

static const u8* trampoline_cmp = 
  "\n"
  "/* --- trampoline on after_cmp start --- */ \n"
  "\n"
  
  "movq %s, tmpquadone(%rip) \n"
  "movq %s, tmpquadtwo(%rip) \n"
  "leaq funcinptr(%rip), %s \n"
  "movq %c%llu, (%s)\n"
  "movq %s, 8(%s)\n"
  "movq %s, %s \n"
  "movq %s, 16(%s)\n"
  "movq %c%llu, 24(%s)\n"
  "movq %s, %s \n"
  "movq %s, 32(%s)\n"
  "movq %c%llu, 40(%s)\n"
  "push (%s) \n"
  "movq tmpquadone(%rip), %s \n"
  "movq tmpquadtwo(%rip), %s \n"
  "movq $1, cmpPassed(%rip) \n"
  "call _storeDataFn \n"

  "\n"
  "/* --- trampoline on after_cmp end - */ \n"
  "\n";

static const u8* trampoline_edge = 
  "\n"
  "/* --- trampoline on edge start --- */ \n"
  
  "pushq %rax \n"
  "movq $%llu, %rax \n"
  "movq %rax, edgeId(%rip) \n"
  "popq %rax \n"
  "call _storeEdge \n"
  "\n"
  "/* --- trampoline on edge end --- */ \n"
  "\n";


/* trampoline_storeEdge
 * assign a unique ID.
 * check if flag cmp_passed is enabled
 * if enabled:
 * 1. disable cmp_passed
 * 2. log id
 * ****/

static const u8* trampoline_storeEdge =
  "\n"
  "/* --- trampoline on edge start --- */ \n"
  "\n"
 
 
  "\n"
  ".align 8 \n"
  "\n"

 ".section .text.startup \n"
 "_storeEdge:\n"
 
 "  pushq %rax \n"
 "  pushq %rbx \n"
 "  pushq %rcx \n"
 "  pushq %rdx \n"

 "  cmpq $1, cmpPassed(%rip)  \n"
 "  jne _caledgehash     \n"
 "  movq $0, cmpPassed(%rip)  \n"
 "  movq edgeCnt(%rip), %rax \n"
 "  shl $3, %rax \n"
 "  cmpq shmSize2(%rip), %rax \n"
 "  ja _shm2Full             \n"

 "  movq edgehash(%rip), %rbx \n"
 "  movq shmptr_edge(%rip), %rdx \n"
 "  leaq 0(%rax, %rdx,1), %rcx \n"
 "  movq %rbx, (%rcx) \n"
 "  addq $1, edgeCnt(%rip) \n"
 "_caledgehash: \n"
/*****************************************
 * edgehash = edgehash * 33 + edgeId;
 * edgehash = edgehash % PATH_MAP_SIZE-1;
 * ***************************************/
 "  movq edgehash(%rip), %rdx \n"
 "  movq %rdx, %rax \n"
 "  salq $5, %rax \n"
 "  addq %rax, %rdx \n"
 "  movq edgeId(%rip), %rax \n"
 "  addq %rdx, %rax \n"
 "  movq %rax, edgehash(%rip) \n"
 "  movq $"PATH_MAP_SIZE_STR", %rax \n"
 "  andq %rax, edgehash(%rip) \n"

 "  popq %rdx \n"
 "  popq %rcx \n"
 "  popq %rbx \n"
 "  popq %rax \n"
 "  ret \n"
 "_shm2Full:                \n"
 "  movq $15, %rax \n"
 "  popq %rdx \n"
 "  popq %rcx \n"
 "  popq %rbx \n"
 "  popq %rax \n"
 CALL_L64("_exit");



static const u8* trampoline_storeDataFn = 
  

"\n"
  "/* --- trampoline on storeDataFn start --- */ \n"
  "\n"
  ".align 8 \n"
  "\n"
   ".section .text.startup\n"
     ".extern printf\n"
     ".extern exit\n"

  "_storeDataFn: \n"
  "  push %rbp \n"
  "  movq %rsp, %rbp \n"
  
  "  push %rax \n"
  "  push %rbx \n"
  "  push %r8 \n"
  "  push %r9 \n"
  "  push %r10 \n"

  "  movq shmptr_gcnt(%rip), %rax \n"
  "  movq (%rax), %rax \n"
  "  shl $3, %rax \n"
  "  addq $48, %rax \n"
  "  cmpq shmSize(%rip), %rax\n"
  "  jae _shmFull\n"
  "  cmpq $0, shmptr_cmp(%rip)\n"
  "  je _shmUninitialize\n"
  "  movq $0, %rbx \n"
  "  subq $48, %rax \n"
  "  shr $3, %rax \n"
  "_storeloop: \n"
  "  movq %rax, %r10 \n"
  "  shl $3, %r10    \n"
  "  addq shmptr_cmp(%rip), %r10 \n"
  "  movq %rbx, %r9 \n"
  "  shl $3, %r9 \n"
  "  lea funcinptr(%rip), %r8 \n"
  "  addq  %r8, %r9 \n"
  "  movq (%r9), %r8 \n"
  "  movq %r8, (%r10) \n"
  "  cmpq $0, %rbx \n"
  "  jnz  _no_get_cmpid \n"
  "  movq %r8, cmpid(%rip) \n"
  "_no_get_cmpid: \n"
  "  inc %rax \n"
  "  inc %rbx \n"
  "  cmpq $6, %rbx \n"
  "  jne _storeloop \n"
  "  movq shmptr_gcnt(%rip), %rbx \n"
  "  movq %rax, (%rbx) \n"
  
/*********************************************************
 *
 * The following is the 
 * assembly implementation of the removeRepeatedCycles
 *
 * void removeRepeatedCycle(uint64_t cmpid) {
 * 
 *   int notDelete = 0;
 * 
 *   auto it = cmpidMap.find(cmpid);
 *     
 *   if (it != cmpidMap.end()) {
 *    
 *     uint64_t pos = it->second;
 *     
 *     if (*shmptr_gcnt - pos > pos)
 *       notDelete = 1;
 *     
 *     for ( uint64_t i = 0; i * 6 < *shmptr_gcnt - pos ; i++) {
 *       
 *       if (*(shmptr_cmp + *(shmptr_gcnt) - (i + 1) * 6) 
 *           != *(shmptr_cmp + (pos - (i + 1) * 6))) {
 *         
 *         notDelete = 1;
 *         break;
 *       }
 *     }
 *     *shmptr_gcnt = notDelete == 1 ? *shmptr_gcnt : pos;
 *     cmpidMap[cmpid] = notDelete == 1 ? *shmptr_gcnt : pos;
      *edgeCnt = notDelete == 1 ? *edgeCnt : pos / 6;
 *   }
 *   else {
 *     cmpidMap.insert({cmpid, *shmptr_gcnt});
 *   }
 * 
 *   printf("%lu \n", *shmptr_gcnt);
 * 
 * }
 * *******************************************************/

  "  movq cmpid(%rip), %rax \n"
  
  "  shl $4, %rax \n"        
  "  movq %rax, %rbx \n"
  "  addq $8,   %rbx\n"
  "  cmpq $" CMP_DICT_SIZE_STR " ,%rbx\n"  
  "  jae _cmpdictFull \n"
  "  leaq cmpid_dict(%rip), %rbx\n"
  "  addq %rbx, %rax \n"  //%rax: the (key) address of cmpid  (%rax) is the value(pos)
  "  cmpq $0, (%rax) \n"    //if no position generated in prior runs, insert one
  "  jz   _insert_entry \n" 
  "  movq $0, %r8 \n"      //%r8 is i

  "_remove_repeated_cycle: \n"

  "  movq %r8, %r9 \n"
  "  movq %r9, %r10\n"
  "  shl $2, %r9 \n"
  "  add %r10, %r9 \n"
  "  add %r10, %r9 \n"
  "  movq shmptr_gcnt(%rip), %r10 \n"
  "  movq (%r10), %r10\n"
  "  subq (%rax), %r10 \n"
  "  cmpq (%rax), %r10\n"
  "  ja  _no_remove_cycle\n"
  "  cmpq %r9, %r10  \n" 
  "  jbe _remove_cycle   \n"               //i*6 < *shmptr_gcnt - pos
 
  "  movq %r8, %r9\n"
  "  addq $1, %r9 \n"
  "  movq %r9, %r10\n"
  "  shl $2, %r9 \n"
  "  add %r10, %r9 \n"
  "  add %r10, %r9 \n"
  "  movq shmptr_gcnt(%rip), %r10 \n"
  "  movq (%r10), %r10\n"
  "  subq %r9, %r10 \n"  //%r10 = *(shmptr_gcnt) - (i+1)*6
  "  shl $3, %r10 \n"
  "  movq shmptr_cmp(%rip) , %r9 \n"
  "  addq %r10, %r9\n"
  "  movq (%r9), %rbx \n"   // %rbx, LHS of the predicate

  "  movq %r8, %r9\n"
  "  addq $1, %r9 \n"
  "  movq %r9, %r10\n"
  "  shl $2, %r9 \n"
  "  add %r10, %r9 \n"
  "  add %r10, %r9 \n"
  "  movq (%rax), %r10 \n"
  "  subq %r9, %r10 \n"  //%r10 = pos - (i+1)*6
  "  shl $3, %r10 \n"
  "  movq shmptr_cmp(%rip) , %r9 \n"
  "  addq %r10, %r9\n"
  
  "  cmpq (%r9), %rbx \n"
  "  jnz _no_remove_cycle \n"
  
  "  inc %r8 \n"
  "  jmp _remove_repeated_cycle \n"
  
  "_remove_cycle: \n"
  "  movq %rdx, tmpquadone(%rip) \n"
  "  movq (%rax), %rdx \n"
  "  movq shmptr_gcnt(%rip), %rax \n"
  "  movq %rdx, (%rax) \n"
  "  movl %edx, %eax \n"
  "  shr  $32, %rdx \n"
  "  movq  $6, %r8  \n"
  "  div  %r8 \n"
  "  movl %eax, edgeCnt(%rip) \n"
  "  movq tmpquadone(%rip), %rdx \n"
  "  jmp _skipstoredata \n"

  "_no_remove_cycle: \n"
  " movq shmptr_gcnt(%rip), %rbx \n"
  " movq (%rbx), %rbx \n"
  " movq %rbx, (%rax) \n"
  " jmp _skipstoredata \n"
  
  "_insert_entry:\n"
  "  movq shmptr_gcnt(%rip), %rbx \n"
  "  movq (%rbx), %rbx \n"
  "  movq %rbx, (%rax)\n"
  
  "_skipstoredata: \n"
  "  pop %r10 \n"
  "  pop %r9 \n"
  "  pop %r8 \n"
  "  pop %rbx \n"
  "  pop %rax \n"

  "  movq %rbp, %rsp     \n"
  "  pop %rbp\n"
  "  ret $8\n"
  "_shmFull: \n"
  "  movq $15, %rax \n"
  CALL_L64("_exit")
  "_cmpdictFull: \n"
  "  movq $14, %rax \n"
  CALL_L64("_exit")
  "_shmUninitialize: \n"
  "  movq %rbp, %rsp     \n"
  "  pop %rbp\n"
  "  xorq %rax, %rax\n"
  "  ret $8\n"
  "/* --- trampoline on storeDataFn end --- */ \n"
  "\n";


static const u8* trampoline_server_initialization = 

  "\n"
  "/* --- Server Initialization (64-BIT) --- */\n"
  "\n"
  
  ".code64\n"
  ".align 8\n"
  "\n"

  "  lahf\n"
  "  seto  %al\n"
  ".section .text.startup\n"
  ".align 8\n"
  "__afl_setup_first:\n"

  "\n"
  "  /* Save everything that is not yet saved and that may be touched by\n"
  "     getenv() and several other libcalls we'll be relying on. */\n"
  "\n"
  "  leaq -360(%rsp), %rsp\n"
  "\n"
  "  movq %rax,   0(%rsp)\n"
  "  movq %rcx,   8(%rsp)\n"
  "  movq %rdi,  16(%rsp)\n"
  "  movq %rsi,  32(%rsp)\n"
  "  movq %r8,   40(%rsp)\n"
  "  movq %r9,   48(%rsp)\n"
  "  movq %r10,  56(%rsp)\n"
  "  movq %r11,  64(%rsp)\n"
  "\n"
  "  movq %xmm0,  96(%rsp)\n"
  "  movq %xmm1,  112(%rsp)\n"
  "  movq %xmm2,  128(%rsp)\n"
  "  movq %xmm3,  144(%rsp)\n"
  "  movq %xmm4,  160(%rsp)\n"
  "  movq %xmm5,  176(%rsp)\n"
  "  movq %xmm6,  192(%rsp)\n"
  "  movq %xmm7,  208(%rsp)\n"
  "  movq %xmm8,  224(%rsp)\n"
  "  movq %xmm9,  240(%rsp)\n"
  "  movq %xmm10, 256(%rsp)\n"
  "  movq %xmm11, 272(%rsp)\n"
  "  movq %xmm12, 288(%rsp)\n"
  "  movq %xmm13, 304(%rsp)\n"
  "  movq %xmm14, 320(%rsp)\n"
  "  movq %xmm15, 336(%rsp)\n"
  "  movq %rdx,   352(%rsp)\n"
  
  "\n"
  "  /* Map SHM, jumping to __afl_setup_abort if something goes wrong. */\n"
  "\n"
  "  /* The 64-bit ABI requires 16-byte stack alignment. We'll keep the\n"
  "     original stack ptr in the callee-saved r12. */\n"
  "\n"
  "  pushq %r12\n"
  "  movq  %rsp, %r12\n"
  "  subq  $16, %rsp\n"
  "  andq  $0xfffffffffffffff0, %rsp\n"
  

  "\n"
  " /*The below code segment initialize edgehash, funcinptr, and cmpPassed memory*/\n"
  " /*to signature bits, for Intel Pin to find thier addresses */\n"
  "\n"
  " movq $0xdead1, edgehash(%rip) \n"
  " movq $0xdead2, funcinptr(%rip) \n"
  " movq $0xdead3, cmpPassed(%rip) \n"


  "  movq $"MAP_SIZE_STR", shmSize(%rip)\n"
  "  movq $"MAP_SIZE_STR", shmSize2(%rip)\n"
  "\n"

  " /* map shared memory to store gCnt variable. */\n"
  "\n"
  "  leaq .SHM_ENV_GCNT(%rip), %rdi\n"
  CALL_L64("getenv")
  "\n"
  "  testq %rax, %rax\n"
  "  je    __afl_setup_abort\n"

  "\n"
  "  movq  %rax, %rdi\n"
  CALL_L64("atoi")
  "\n"
  "  xorq %rdx, %rdx   /* shmat flags    */\n"
  "  xorq %rsi, %rsi   /* requested addr */\n"
  "  movq %rax, %rdi   /* SHM ID         */\n"
  CALL_L64("shmat")
  "\n"
  "  cmpq $-1, %rax\n"
  "  je   __afl_setup_abort\n"

  "\n"
  "  /* Store the address of the SHM region. */\n"
  "\n"
  "  movq %rax, shmptr_gcnt(%rip)\n"
  
  "\n"
  "  leaq .SHM_ENV_CMP(%rip), %rdi\n"
  CALL_L64("getenv")
  "\n"
  "  testq %rax, %rax\n"

  "  je    __afl_setup_abort\n"
  "\n"
  "  movq  %rax, %rdi\n"
  CALL_L64("atoi")
  "\n"
  "  xorq %rdx, %rdx   /* shmat flags    */\n"
  "  xorq %rsi, %rsi   /* requested addr */\n"
  "  movq %rax, %rdi   /* SHM ID         */\n"
  CALL_L64("shmat")
  "\n"
  "  cmpq $-1, %rax\n"
  "  je   __afl_setup_abort\n"
  "\n"
  "  /* Store the address of the SHM region. */\n"
  "\n"
  "  movq %rax, shmptr_cmp(%rip)\n"

  "\n"
  "  leaq .SHM_ENV_EDGE(%rip), %rdi\n"
  CALL_L64("getenv")
  "\n"
  "  testq %rax, %rax\n"
  "  je    __afl_setup_abort\n"
  "\n"
  "  movq  %rax, %rdi\n"
  CALL_L64("atoi")
  "\n"
  "  xorq %rdx, %rdx   /* shmat flags    */\n"
  "  xorq %rsi, %rsi   /* requested addr */\n"
  "  movq %rax, %rdi   /* SHM ID         */\n"
  CALL_L64("shmat")
  "\n"
  "  cmpq $-1, %rax\n"
  "  je   __afl_setup_abort\n"
  "\n"
  "  /* Store the address of the SHM region. */\n"
  "\n"
  "  movq %rax, shmptr_edge(%rip)\n"

  "__afl_forkserver:\n"

  "\n"
  "  /* Enter the fork server mode to avoid the overhead of execve() calls. We\n"
  "     push rdx (area ptr) twice to keep stack alignment neat. */\n"
  "  /* Phone home and tell the parent that we're OK. (Note that signals with\n"
  "     no SA_RESTART will mess it up). If this fails, assume that the fd is\n"
  "     closed because we were execve()d from an instrumented binary, or because\n"
  "     the parent doesn't want to use the fork server. */\n"
  "\n"
  "  movq $4, %rdx               /* length    */\n"
  "  leaq __afl_temp(%rip), %rsi /* data      */\n"
  "  movq $" STRINGIFY((FORKSRV_FD + 1)) ", %rdi       /* file desc */\n"
  CALL_L64("write")
  "\n"
  "  cmpq $4, %rax\n"
  "  jne  __afl_fork_resume\n"
  "\n"
  "__afl_fork_wait_loop:\n"
  "\n"
  
  "  /* Wait for parent by reading from the pipe. Abort if read fails. */\n"
  "\n"
  "  movq $4, %rdx               /* length    */\n"
  "  leaq __afl_temp(%rip), %rsi /* data      */\n"
  "  movq $" STRINGIFY(FORKSRV_FD) ", %rdi             /* file desc */\n"
  CALL_L64("read")
  "  cmpq $4, %rax\n"
  "  jne  __afl_die\n"
  "\n"
  "  /* Once woken up, create a clone of our process. This is an excellent use\n"
  "     case for syscall(__NR_clone, 0, CLONE_PARENT), but glibc boneheadedly\n"
  "     caches getpid() results and offers no way to update the value, breaking\n"
  "     abort(), raise(), and a bunch of other things :-( */\n"
  "\n"
  
  CALL_L64("fork")
  "  cmpq $0, %rax\n"
  "  jl   __afl_die\n"
  "  je   __afl_fork_resume\n"
  "\n"
  
  "  /* In parent process: write PID to pipe, then wait for child. */\n"
  "\n"
  "  movl %eax, __afl_fork_pid(%rip)\n"
  "\n"
  "  movq $4, %rdx                   /* length    */\n"
  "  leaq __afl_fork_pid(%rip), %rsi /* data      */\n"
  "  movq $" STRINGIFY((FORKSRV_FD + 1)) ", %rdi             /* file desc */\n"
  CALL_L64("write")
  "\n"
  "  movq $0, %rdx                   /* no flags  */\n"
  "  leaq __afl_temp(%rip), %rsi     /* status    */\n"
  "  movq __afl_fork_pid(%rip), %rdi /* PID       */\n"
  CALL_L64("waitpid")
  "  cmpq $0, %rax\n"
  "  jle  __afl_die\n"

  "\n"
  "  /* Relay wait status to pipe, then loop back. */\n"
  "\n"
  "  movq $4, %rdx               /* length    */\n"
  "  leaq __afl_temp(%rip), %rsi /* data      */\n"
  "  movq $" STRINGIFY((FORKSRV_FD + 1)) ", %rdi         /* file desc */\n"
  CALL_L64("write")
  "\n"
  "  jmp  __afl_fork_wait_loop\n"
  "\n"

  "\n"
  "__afl_die:\n"
  "\n"

  "  leaq .serverDied(%rip), %rdi \n"
  "  xorq %rax, %rax \n"
  CALL_L64("printf")
  "  xorq %rax, %rax\n"
  CALL_L64("_exit")

  "\n"
  "__afl_setup_abort:\n"
  "\n"
  "  movq %r12, %rsp\n"
  "  popq %r12\n"
  "\n"
  "  movq  0(%rsp), %rax\n"
  "  movq  8(%rsp), %rcx\n"
  "  movq 16(%rsp), %rdi\n"
  "  movq 32(%rsp), %rsi\n"
  "  movq 40(%rsp), %r8\n"
  "  movq 48(%rsp), %r9\n"
  "  movq 56(%rsp), %r10\n"
  "  movq 64(%rsp), %r11\n"
  "\n"
  "  movq  96(%rsp), %xmm0\n"
  "  movq 112(%rsp), %xmm1\n"
  "  movq 128(%rsp), %xmm2\n"
  "  movq 144(%rsp), %xmm3\n"
  "  movq 160(%rsp), %xmm4\n"
  "  movq 176(%rsp), %xmm5\n"
  "  movq 192(%rsp), %xmm6\n"
  "  movq 208(%rsp), %xmm7\n"
  "  movq 224(%rsp), %xmm8\n"
  "  movq 240(%rsp), %xmm9\n"
  "  movq 256(%rsp), %xmm10\n"
  "  movq 272(%rsp), %xmm11\n"
  "  movq 288(%rsp), %xmm12\n"
  "  movq 304(%rsp), %xmm13\n"
  "  movq 320(%rsp), %xmm14\n"
  "  movq 336(%rsp), %xmm15\n"
  "\n"
  "  movq 352(%rsp), %rdx\n"
  "  leaq 360(%rsp), %rsp\n"
 
  "  movb $127, %al \n"
  "  ret\n"

  "__afl_fork_resume:\n"
  "\n"
  "  /* In child process: close fds, resume execution. */\n"
  "\n"
  "  movq $" STRINGIFY(FORKSRV_FD) ", %rdi\n"
  CALL_L64("close")
  "\n"
  "  movq $" STRINGIFY((FORKSRV_FD + 1)) ", %rdi\n"
  CALL_L64("close")
  
  "\n"
  " /*  Continue execution */\n"
  "\n"
  
  "  movq %r12, %rsp\n"
  "  popq %r12\n"
  "\n"
  "  movq  0(%rsp), %rax\n"
  "  movq  8(%rsp), %rcx\n"
  "  movq 16(%rsp), %rdi\n"
  "  movq 32(%rsp), %rsi\n"
  "  movq 40(%rsp), %r8\n"
  "  movq 48(%rsp), %r9\n"
  "  movq 56(%rsp), %r10\n"
  "  movq 64(%rsp), %r11\n"
  "\n"
  "  movq  96(%rsp), %xmm0\n"
  "  movq 112(%rsp), %xmm1\n"
  "  movq 128(%rsp), %xmm2\n"
  "  movq 144(%rsp), %xmm3\n"
  "  movq 160(%rsp), %xmm4\n"
  "  movq 176(%rsp), %xmm5\n"
  "  movq 192(%rsp), %xmm6\n"
  "  movq 208(%rsp), %xmm7\n"
  "  movq 224(%rsp), %xmm8\n"
  "  movq 240(%rsp), %xmm9\n"
  "  movq 256(%rsp), %xmm10\n"
  "  movq 272(%rsp), %xmm11\n"
  "  movq 288(%rsp), %xmm12\n"
  "  movq 304(%rsp), %xmm13\n"
  "  movq 320(%rsp), %xmm14\n"
  "  movq 336(%rsp), %xmm15\n"
  "  movq 352(%rsp), %rdx\n"
  "  leaq 360(%rsp), %rsp\n"

  "  movb $0, %al \n"
  "  ret\n"
  
  "  .comm   edgehash          8\n"
  "  .comm   edgeId,           8\n"
  "  .comm   shmSize,          4\n"
  "  .comm   shmSize2,         4\n"
  "  .comm   tmpquadone,       8\n"
  "  .comm   tmpquadtwo,       8\n"
  "  .comm   tmpquadrax,       8\n"
  "  .comm   tmpquadrdi,       8\n"
  "  .comm   tmpquadrsi,       8\n"
  "  .comm   shmptr_cmp,      8\n"
  "  .comm   shmptr_edge,     8\n"
  "  .comm   shmptr_gcnt,     8\n"
  "  .comm   cmpid,            8\n"
  "  .comm   edgeCnt,       8\n"
  "  .comm   cmpPassed,       8\n"

  "  .comm   instswitch,      8\n"
  "  .comm   funcinptr,       48\n"
  

  "  .comm    cmpid_dict,     " CMP_DICT_SIZE_STR "\n"
  "  .lcomm   __afl_fork_pid, 4\n"
  "  .lcomm   __afl_temp,     4\n"

  "\n"
  ".SHM_ENV_CMP:\n"
  "  .asciz \"SHM_ENV_CMP\"\n"
  ".SHM_ENV_EDGE: \n"
  "  .asciz \"SHM_ENV_EDGE\"\n"
  ".SHM_ENV_GCNT:\n"
  "  .asciz \"SHM_ENV_GCNT\"\n"
  ".serverSetupError: \n"
  "  .asciz \" Server Setup Error, continue runnig without server \\n \" \n"
  ".serverDied: \n"
  "  .asciz \" Server is dead \\n \" \n"
  ".debug:  \n"
  "  .asciz \"debug message: %lu \\n \" \n"
  "\n"

  "/* --- END --- */\n"
  "\n";

#endif /* !_HAVE_AFL_AS_H */
