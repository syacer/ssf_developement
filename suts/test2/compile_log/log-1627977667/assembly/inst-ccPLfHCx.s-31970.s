	.file	"conftest.c"
	.text
.Ltext0:
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:

/* --- trampoline on server start --- */ 
  movq %rax, tmpquadrax(%rip)
  movq %rdi, tmpquadrdi(%rip) 
  movq %rsi, tmpquadrsi(%rip) 
  call __afl_setup_first
  cmpb $127, %al 
  jne runSUT
  leaq .serverSetupError(%rip), %rdi 
  xorq %rax, %rax 
call printf@PLT
  movq $1048576,  %rdi 
  xorq %rax, %rax 
call malloc@PLT
  movq %rax, shmptr_edge(%rip)  
  movq $1048576,  %rdi 
  xorq %rax, %rax 
call malloc@PLT
  movq %rax, shmptr_cmp(%rip)  
  movq $8,  %rdi 
  xorq %rax, %rax 
call malloc@PLT
  movq %rax, shmptr_gcnt(%rip)  
runSUT:
  movq tmpquadrax(%rip), %rax
  movq tmpquadrsi(%rip), %rsi
  movq tmpquadrdi(%rip), %rdi

/* --- trampoline on server end --- */ 
.LFB0:
	.file 1 "conftest.c"
	.loc 1 14 0
	.cfi_startproc
	.loc 1 21 0
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4a
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF0
	.byte	0xc
	.long	.LASF1
	.long	.LASF2
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF3
	.byte	0x1
	.byte	0xd
	.long	0x46
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB0
	.quad	.LFE0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.string	"GNU C11 7.5.0 -mtune=generic -march=x86-64 -g -O3 -funroll-loops -fstack-protector-strong"
.LASF2:
	.string	"/home/ubuntu/research/sjyfuzz/suts/test2"
.LASF1:
	.string	"conftest.c"
.LASF3:
	.string	"main"
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits

/* --- trampoline on edge start --- */ 


.align 8 

.section .text.startup 
_storeEdge:
  pushq %rax 
  pushq %rbx 
  pushq %rcx 
  pushq %rdx 
  cmpq $1, cmpPassed(%rip)  
  jne _caledgehash     
  movq $0, cmpPassed(%rip)  
  movq edgeCnt(%rip), %rax 
  shl $3, %rax 
  cmpq shmSize2(%rip), %rax 
  ja _shm2Full             
  movq edgehash(%rip), %rbx 
  movq shmptr_edge(%rip), %rdx 
  leaq 0(%rax, %rdx,1), %rcx 
  movq %rbx, (%rcx) 
  addq $1, edgeCnt(%rip) 
_caledgehash: 
  movq edgehash(%rip), %rdx 
  movq %rdx, %rax 
  salq $5, %rax 
  addq %rax, %rdx 
  movq edgeId(%rip), %rax 
  addq %rdx, %rax 
  movq %rax, edgehash(%rip) 
  movq $0xFFFFFFFF, %rax 
  andq %rax, edgehash(%rip) 
  popq %rdx 
  popq %rcx 
  popq %rbx 
  popq %rax 
  ret 
_shm2Full:                
  movq $15, %rax 
  popq %rdx 
  popq %rcx 
  popq %rbx 
  popq %rax 
call _exit@PLT

/* --- trampoline on storeDataFn start --- */ 

.align 8 

.section .text.startup
.extern printf
.extern exit
_storeDataFn: 
  push %rbp 
  movq %rsp, %rbp 
  push %rax 
  push %rbx 
  push %r8 
  push %r9 
  push %r10 
  movq shmptr_gcnt(%rip), %rax 
  movq (%rax), %rax 
  shl $3, %rax 
  addq $48, %rax 
  cmpq shmSize(%rip), %rax
  jae _shmFull
  cmpq $0, shmptr_cmp(%rip)
  je _shmUninitialize
  movq $0, %rbx 
  subq $48, %rax 
  shr $3, %rax 
_storeloop: 
  movq %rax, %r10 
  shl $3, %r10    
  addq shmptr_cmp(%rip), %r10 
  movq %rbx, %r9 
  shl $3, %r9 
  lea funcinptr(%rip), %r8 
  addq  %r8, %r9 
  movq (%r9), %r8 
  movq %r8, (%r10) 
  cmpq $0, %rbx 
  jnz  _no_get_cmpid 
  movq %r8, cmpid(%rip) 
_no_get_cmpid: 
  inc %rax 
  inc %rbx 
  cmpq $6, %rbx 
  jne _storeloop 
  movq shmptr_gcnt(%rip), %rbx 
  movq %rax, (%rbx) 
  movq cmpid(%rip), %rax 
  shl $4, %rax 
  movq %rax, %rbx 
  addq $8,   %rbx
  cmpq $1400000 ,%rbx
  jae _cmpdictFull 
  leaq cmpid_dict(%rip), %rbx
  addq %rbx, %rax 
  cmpq $0, (%rax) 
  jz   _insert_entry 
  movq $0, %r8 
_remove_repeated_cycle: 
  movq %r8, %r9 
  movq %r9, %r10
  shl $2, %r9 
  add %r10, %r9 
  add %r10, %r9 
  movq shmptr_gcnt(%rip), %r10 
  movq (%r10), %r10
  subq (%rax), %r10 
  cmpq (%rax), %r10
  ja  _no_remove_cycle
  cmpq %r9, %r10  
  jbe _remove_cycle   
  movq %r8, %r9
  addq $1, %r9 
  movq %r9, %r10
  shl $2, %r9 
  add %r10, %r9 
  add %r10, %r9 
  movq shmptr_gcnt(%rip), %r10 
  movq (%r10), %r10
  subq %r9, %r10 
  shl $3, %r10 
  movq shmptr_cmp(%rip) , %r9 
  addq %r10, %r9
  movq (%r9), %rbx 
  movq %r8, %r9
  addq $1, %r9 
  movq %r9, %r10
  shl $2, %r9 
  add %r10, %r9 
  add %r10, %r9 
  movq (%rax), %r10 
  subq %r9, %r10 
  shl $3, %r10 
  movq shmptr_cmp(%rip) , %r9 
  addq %r10, %r9
  cmpq (%r9), %rbx 
  jnz _no_remove_cycle 
  inc %r8 
  jmp _remove_repeated_cycle 
_remove_cycle: 
  movq %rdx, tmpquadone(%rip) 
  movq (%rax), %rdx 
  movq shmptr_gcnt(%rip), %rax 
  movq %rdx, (%rax) 
  movl %edx, %eax 
  shr  $32, %rdx 
  movq  $6, %r8  
  div  %r8 
  movl %eax, edgeCnt(%rip) 
  movq tmpquadone(%rip), %rdx 
  jmp _skipstoredata 
_no_remove_cycle: 
 movq shmptr_gcnt(%rip), %rbx 
 movq (%rbx), %rbx 
 movq %rbx, (%rax) 
 jmp _skipstoredata 
_insert_entry:
  movq shmptr_gcnt(%rip), %rbx 
  movq (%rbx), %rbx 
  movq %rbx, (%rax)
_skipstoredata: 
  pop %r10 
  pop %r9 
  pop %r8 
  pop %rbx 
  pop %rax 
  movq %rbp, %rsp     
  pop %rbp
  ret $8
_shmFull: 
  movq $15, %rax 
call _exit@PLT
_cmpdictFull: 
  movq $14, %rax 
call _exit@PLT
_shmUninitialize: 
  movq %rbp, %rsp     
  pop %rbp
  xorq %rax, %rax
  ret $8
/* --- trampoline on storeDataFn end --- */ 


/* --- Server Initialization (64-BIT) --- */

.code64
.align 8

  lahf
  seto  %al
.section .text.startup
.align 8
__afl_setup_first:

  /* Save everything that is not yet saved and that may be touched by
     getenv() and several other libcalls we'll be relying on. */

  leaq -360(%rsp), %rsp

  movq %rax,   0(%rsp)
  movq %rcx,   8(%rsp)
  movq %rdi,  16(%rsp)
  movq %rsi,  32(%rsp)
  movq %r8,   40(%rsp)
  movq %r9,   48(%rsp)
  movq %r10,  56(%rsp)
  movq %r11,  64(%rsp)

  movq %xmm0,  96(%rsp)
  movq %xmm1,  112(%rsp)
  movq %xmm2,  128(%rsp)
  movq %xmm3,  144(%rsp)
  movq %xmm4,  160(%rsp)
  movq %xmm5,  176(%rsp)
  movq %xmm6,  192(%rsp)
  movq %xmm7,  208(%rsp)
  movq %xmm8,  224(%rsp)
  movq %xmm9,  240(%rsp)
  movq %xmm10, 256(%rsp)
  movq %xmm11, 272(%rsp)
  movq %xmm12, 288(%rsp)
  movq %xmm13, 304(%rsp)
  movq %xmm14, 320(%rsp)
  movq %xmm15, 336(%rsp)
  movq %rdx,   352(%rsp)

  /* Map SHM, jumping to __afl_setup_abort if something goes wrong. */

  /* The 64-bit ABI requires 16-byte stack alignment. We'll keep the
     original stack ptr in the callee-saved r12. */

  pushq %r12
  movq  %rsp, %r12
  subq  $16, %rsp
  andq  $0xfffffffffffffff0, %rsp

 /*The below code segment initialize edgehash, funcinptr, and cmpPassed memory*/
 /*to signature bits, for Intel Pin to find thier addresses */

 movq $0xdead1, edgehash(%rip) 
 movq $0xdead2, funcinptr(%rip) 
 movq $0xdead3, cmpPassed(%rip) 
  movq $1048576, shmSize(%rip)
  movq $1048576, shmSize2(%rip)

 /* map shared memory to store gCnt variable. */

  leaq .SHM_ENV_GCNT(%rip), %rdi
call getenv@PLT

  testq %rax, %rax
  je    __afl_setup_abort

  movq  %rax, %rdi
call atoi@PLT

  xorq %rdx, %rdx   /* shmat flags    */
  xorq %rsi, %rsi   /* requested addr */
  movq %rax, %rdi   /* SHM ID         */
call shmat@PLT

  cmpq $-1, %rax
  je   __afl_setup_abort

  /* Store the address of the SHM region. */

  movq %rax, shmptr_gcnt(%rip)

  leaq .SHM_ENV_CMP(%rip), %rdi
call getenv@PLT

  testq %rax, %rax
  je    __afl_setup_abort

  movq  %rax, %rdi
call atoi@PLT

  xorq %rdx, %rdx   /* shmat flags    */
  xorq %rsi, %rsi   /* requested addr */
  movq %rax, %rdi   /* SHM ID         */
call shmat@PLT

  cmpq $-1, %rax
  je   __afl_setup_abort

  /* Store the address of the SHM region. */

  movq %rax, shmptr_cmp(%rip)

  leaq .SHM_ENV_EDGE(%rip), %rdi
call getenv@PLT

  testq %rax, %rax
  je    __afl_setup_abort

  movq  %rax, %rdi
call atoi@PLT

  xorq %rdx, %rdx   /* shmat flags    */
  xorq %rsi, %rsi   /* requested addr */
  movq %rax, %rdi   /* SHM ID         */
call shmat@PLT

  cmpq $-1, %rax
  je   __afl_setup_abort

  /* Store the address of the SHM region. */

  movq %rax, shmptr_edge(%rip)
__afl_forkserver:

  /* Enter the fork server mode to avoid the overhead of execve() calls. We
     push rdx (area ptr) twice to keep stack alignment neat. */
  /* Phone home and tell the parent that we're OK. (Note that signals with
     no SA_RESTART will mess it up). If this fails, assume that the fd is
     closed because we were execve()d from an instrumented binary, or because
     the parent doesn't want to use the fork server. */

  movq $4, %rdx               /* length    */
  leaq __afl_temp(%rip), %rsi /* data      */
  movq $(196 + 1), %rdi       /* file desc */
call write@PLT

  cmpq $4, %rax
  jne  __afl_fork_resume

__afl_fork_wait_loop:

  /* Wait for parent by reading from the pipe. Abort if read fails. */

  movq $4, %rdx               /* length    */
  leaq __afl_temp(%rip), %rsi /* data      */
  movq $196, %rdi             /* file desc */
call read@PLT
  cmpq $4, %rax
  jne  __afl_die

  /* Once woken up, create a clone of our process. This is an excellent use
     case for syscall(__NR_clone, 0, CLONE_PARENT), but glibc boneheadedly
     caches getpid() results and offers no way to update the value, breaking
     abort(), raise(), and a bunch of other things :-( */

call fork@PLT
  cmpq $0, %rax
  jl   __afl_die
  je   __afl_fork_resume

  /* In parent process: write PID to pipe, then wait for child. */

  movl %eax, __afl_fork_pid(%rip)

  movq $4, %rdx                   /* length    */
  leaq __afl_fork_pid(%rip), %rsi /* data      */
  movq $(196 + 1), %rdi             /* file desc */
call write@PLT

  movq $0, %rdx                   /* no flags  */
  leaq __afl_temp(%rip), %rsi     /* status    */
  movq __afl_fork_pid(%rip), %rdi /* PID       */
call waitpid@PLT
  cmpq $0, %rax
  jle  __afl_die

  /* Relay wait status to pipe, then loop back. */

  movq $4, %rdx               /* length    */
  leaq __afl_temp(%rip), %rsi /* data      */
  movq $(196 + 1), %rdi         /* file desc */
call write@PLT

  jmp  __afl_fork_wait_loop


__afl_die:

  leaq .serverDied(%rip), %rdi 
  xorq %rax, %rax 
call printf@PLT
  xorq %rax, %rax
call _exit@PLT

__afl_setup_abort:

  movq %r12, %rsp
  popq %r12

  movq  0(%rsp), %rax
  movq  8(%rsp), %rcx
  movq 16(%rsp), %rdi
  movq 32(%rsp), %rsi
  movq 40(%rsp), %r8
  movq 48(%rsp), %r9
  movq 56(%rsp), %r10
  movq 64(%rsp), %r11

  movq  96(%rsp), %xmm0
  movq 112(%rsp), %xmm1
  movq 128(%rsp), %xmm2
  movq 144(%rsp), %xmm3
  movq 160(%rsp), %xmm4
  movq 176(%rsp), %xmm5
  movq 192(%rsp), %xmm6
  movq 208(%rsp), %xmm7
  movq 224(%rsp), %xmm8
  movq 240(%rsp), %xmm9
  movq 256(%rsp), %xmm10
  movq 272(%rsp), %xmm11
  movq 288(%rsp), %xmm12
  movq 304(%rsp), %xmm13
  movq 320(%rsp), %xmm14
  movq 336(%rsp), %xmm15

  movq 352(%rsp), %rdx
  leaq 360(%rsp), %rsp
  movb $127, %al 
  ret
__afl_fork_resume:

  /* In child process: close fds, resume execution. */

  movq $196, %rdi
call close@PLT

  movq $(196 + 1), %rdi
call close@PLT

 /*  Continue execution */

  movq %r12, %rsp
  popq %r12

  movq  0(%rsp), %rax
  movq  8(%rsp), %rcx
  movq 16(%rsp), %rdi
  movq 32(%rsp), %rsi
  movq 40(%rsp), %r8
  movq 48(%rsp), %r9
  movq 56(%rsp), %r10
  movq 64(%rsp), %r11

  movq  96(%rsp), %xmm0
  movq 112(%rsp), %xmm1
  movq 128(%rsp), %xmm2
  movq 144(%rsp), %xmm3
  movq 160(%rsp), %xmm4
  movq 176(%rsp), %xmm5
  movq 192(%rsp), %xmm6
  movq 208(%rsp), %xmm7
  movq 224(%rsp), %xmm8
  movq 240(%rsp), %xmm9
  movq 256(%rsp), %xmm10
  movq 272(%rsp), %xmm11
  movq 288(%rsp), %xmm12
  movq 304(%rsp), %xmm13
  movq 320(%rsp), %xmm14
  movq 336(%rsp), %xmm15
  movq 352(%rsp), %rdx
  leaq 360(%rsp), %rsp
  movb $0, %al 
  ret
  .comm   edgehash          8
  .comm   edgeId,           8
  .comm   shmSize,          4
  .comm   shmSize2,         4
  .comm   tmpquadone,       8
  .comm   tmpquadtwo,       8
  .comm   tmpquadrax,       8
  .comm   tmpquadrdi,       8
  .comm   tmpquadrsi,       8
  .comm   shmptr_cmp,      8
  .comm   shmptr_edge,     8
  .comm   shmptr_gcnt,     8
  .comm   cmpid,            8
  .comm   edgeCnt,       8
  .comm   cmpPassed,       8
  .comm   instswitch,      8
  .comm   funcinptr,       48
  .comm    cmpid_dict,     1400000
  .lcomm   __afl_fork_pid, 4
  .lcomm   __afl_temp,     4

.SHM_ENV_CMP:
  .asciz "SHM_ENV_CMP"
.SHM_ENV_EDGE: 
  .asciz "SHM_ENV_EDGE"
.SHM_ENV_GCNT:
  .asciz "SHM_ENV_GCNT"
.serverSetupError: 
  .asciz " Server Setup Error, continue runnig without server \n " 
.serverDied: 
  .asciz " Server is dead \n " 
.debug:  
  .asciz "debug message: %lu \n " 

/* --- END --- */

