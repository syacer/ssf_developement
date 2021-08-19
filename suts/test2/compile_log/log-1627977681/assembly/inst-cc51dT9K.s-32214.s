	.file	"test.c"
	.text
.Ltext0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"r"
.LC1:
	.string	"test.data"
.LC2:
	.string	"yes!"
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
.LFB23:
	.file 1 "test.c"
	.loc 1 3 0
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	.loc 1 5 0
	leaq	.LC0(%rip), %rsi
	.loc 1 3 0
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	.loc 1 5 0
	leaq	.LC1(%rip), %rdi
.LBB6:
.LBB7:
	.file 2 "/usr/include/x86_64-linux-gnu/bits/stdio2.h"
	.loc 2 104 0
	leaq	.LC2(%rip), %r12
.LBE7:
.LBE6:
	.loc 1 3 0
	subq	$80, %rsp
	.cfi_def_cfa_offset 112
	.loc 1 3 0
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rbx
	.loc 1 5 0
	call	fopen@PLT
.LVL0:
	movq	%rax, %rbp
.LVL1:
	.p2align 4,,10
	.p2align 3
.L2:

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $3525983024, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

.LBB9:
.LBB10:
	.loc 2 262 0
	movq	%rbp, %rdx
	movl	$64, %esi
	movq	%rbx, %rdi
	call	fgets@PLT
.LVL2:
.LBE10:
.LBE9:
	.loc 1 8 0
	testq	%rax, %rax
	je	.L8

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $3449196881, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.loc 1 10 0

/* --- trampoline on after_cmp start --- */ 

movq %rdx, tmpquadone(%rip) 
movq %rcx, tmpquadtwo(%rip) 
leaq funcinptr(%rip), %rdx 
movq $3, (%rdx)
movq $'b', 8(%rdx)
movq $97, %rcx 
movq %rcx, 16(%rdx)
movq $0, 24(%rdx)
movq 1(%rsp), %rcx 
movq %rcx, 32(%rdx)
movq $0, 40(%rdx)
push (%rdx) 
movq tmpquadone(%rip), %rdx 
movq tmpquadtwo(%rip), %rcx 
movq $1, cmpPassed(%rip) 
call _storeDataFn 

/* --- trampoline on after_cmp end - */ 

	cmpb	$97, 1(%rsp)
	jne	.L2

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $2578633258, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.loc 1 11 0

/* --- trampoline on after_cmp start --- */ 

movq %rdx, tmpquadone(%rip) 
movq %rcx, tmpquadtwo(%rip) 
leaq funcinptr(%rip), %rdx 
movq $4, (%rdx)
movq $'b', 8(%rdx)
movq $98, %rcx 
movq %rcx, 16(%rdx)
movq $0, 24(%rdx)
movq 2(%rsp), %rcx 
movq %rcx, 32(%rdx)
movq $0, 40(%rdx)
push (%rdx) 
movq tmpquadone(%rip), %rdx 
movq tmpquadtwo(%rip), %rcx 
movq $1, cmpPassed(%rip) 
call _storeDataFn 

/* --- trampoline on after_cmp end - */ 

	cmpb	$98, 2(%rsp)
	jne	.L2

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $3543554629, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.loc 1 12 0

/* --- trampoline on after_cmp start --- */ 

movq %rdx, tmpquadone(%rip) 
movq %rcx, tmpquadtwo(%rip) 
leaq funcinptr(%rip), %rdx 
movq $5, (%rdx)
movq $'b', 8(%rdx)
movq $99, %rcx 
movq %rcx, 16(%rdx)
movq $0, 24(%rdx)
movq 3(%rsp), %rcx 
movq %rcx, 32(%rdx)
movq $0, 40(%rdx)
push (%rdx) 
movq tmpquadone(%rip), %rdx 
movq tmpquadtwo(%rip), %rcx 
movq $1, cmpPassed(%rip) 
call _storeDataFn 

/* --- trampoline on after_cmp end - */ 

	cmpb	$99, 3(%rsp)
	jne	.L2

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $4201040712, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

.LVL3:
.LBB11:
.LBB8:
	.loc 2 104 0
	movq	%r12, %rdi
	call	puts@PLT
.LVL4:
	jmp	.L2
.LVL5:
	.p2align 4,,10
	.p2align 3
.L8:

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $3911165548, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

.LBE8:
.LBE11:
	.loc 1 19 0
	movq	72(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L9

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $3617881753, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
.LVL6:
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.LVL7:
.L9:

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $1691270435, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.cfi_restore_state
	call	__stack_chk_fail@PLT
.LVL8:
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.text
.Letext0:
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.file 9 "<built-in>"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x4c2
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF61
	.byte	0xc
	.long	.LASF62
	.long	.LASF63
	.long	.Ldebug_ranges0+0x30
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0xd8
	.long	0x34
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF0
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0x8c
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x4
	.byte	0x8d
	.long	0x65
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x8f
	.uleb128 0x7
	.long	0x84
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x8
	.long	0x8f
	.uleb128 0x9
	.long	.LASF41
	.byte	0xd8
	.byte	0x5
	.byte	0xf5
	.long	0x21b
	.uleb128 0xa
	.long	.LASF11
	.byte	0x5
	.byte	0xf6
	.long	0x5e
	.byte	0
	.uleb128 0xa
	.long	.LASF12
	.byte	0x5
	.byte	0xfb
	.long	0x84
	.byte	0x8
	.uleb128 0xa
	.long	.LASF13
	.byte	0x5
	.byte	0xfc
	.long	0x84
	.byte	0x10
	.uleb128 0xa
	.long	.LASF14
	.byte	0x5
	.byte	0xfd
	.long	0x84
	.byte	0x18
	.uleb128 0xa
	.long	.LASF15
	.byte	0x5
	.byte	0xfe
	.long	0x84
	.byte	0x20
	.uleb128 0xa
	.long	.LASF16
	.byte	0x5
	.byte	0xff
	.long	0x84
	.byte	0x28
	.uleb128 0xb
	.long	.LASF17
	.byte	0x5
	.value	0x100
	.long	0x84
	.byte	0x30
	.uleb128 0xb
	.long	.LASF18
	.byte	0x5
	.value	0x101
	.long	0x84
	.byte	0x38
	.uleb128 0xb
	.long	.LASF19
	.byte	0x5
	.value	0x102
	.long	0x84
	.byte	0x40
	.uleb128 0xb
	.long	.LASF20
	.byte	0x5
	.value	0x104
	.long	0x84
	.byte	0x48
	.uleb128 0xb
	.long	.LASF21
	.byte	0x5
	.value	0x105
	.long	0x84
	.byte	0x50
	.uleb128 0xb
	.long	.LASF22
	.byte	0x5
	.value	0x106
	.long	0x84
	.byte	0x58
	.uleb128 0xb
	.long	.LASF23
	.byte	0x5
	.value	0x108
	.long	0x25e
	.byte	0x60
	.uleb128 0xb
	.long	.LASF24
	.byte	0x5
	.value	0x10a
	.long	0x264
	.byte	0x68
	.uleb128 0xb
	.long	.LASF25
	.byte	0x5
	.value	0x10c
	.long	0x5e
	.byte	0x70
	.uleb128 0xb
	.long	.LASF26
	.byte	0x5
	.value	0x110
	.long	0x5e
	.byte	0x74
	.uleb128 0xb
	.long	.LASF27
	.byte	0x5
	.value	0x112
	.long	0x6c
	.byte	0x78
	.uleb128 0xb
	.long	.LASF28
	.byte	0x5
	.value	0x116
	.long	0x42
	.byte	0x80
	.uleb128 0xb
	.long	.LASF29
	.byte	0x5
	.value	0x117
	.long	0x50
	.byte	0x82
	.uleb128 0xb
	.long	.LASF30
	.byte	0x5
	.value	0x118
	.long	0x26a
	.byte	0x83
	.uleb128 0xb
	.long	.LASF31
	.byte	0x5
	.value	0x11c
	.long	0x27a
	.byte	0x88
	.uleb128 0xb
	.long	.LASF32
	.byte	0x5
	.value	0x125
	.long	0x77
	.byte	0x90
	.uleb128 0xb
	.long	.LASF33
	.byte	0x5
	.value	0x12d
	.long	0x82
	.byte	0x98
	.uleb128 0xb
	.long	.LASF34
	.byte	0x5
	.value	0x12e
	.long	0x82
	.byte	0xa0
	.uleb128 0xb
	.long	.LASF35
	.byte	0x5
	.value	0x12f
	.long	0x82
	.byte	0xa8
	.uleb128 0xb
	.long	.LASF36
	.byte	0x5
	.value	0x130
	.long	0x82
	.byte	0xb0
	.uleb128 0xb
	.long	.LASF37
	.byte	0x5
	.value	0x132
	.long	0x29
	.byte	0xb8
	.uleb128 0xb
	.long	.LASF38
	.byte	0x5
	.value	0x133
	.long	0x5e
	.byte	0xc0
	.uleb128 0xb
	.long	.LASF39
	.byte	0x5
	.value	0x135
	.long	0x280
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x6
	.byte	0x7
	.long	0x9b
	.uleb128 0xc
	.long	.LASF64
	.byte	0x5
	.byte	0x9a
	.uleb128 0x9
	.long	.LASF42
	.byte	0x18
	.byte	0x5
	.byte	0xa0
	.long	0x25e
	.uleb128 0xa
	.long	.LASF43
	.byte	0x5
	.byte	0xa1
	.long	0x25e
	.byte	0
	.uleb128 0xa
	.long	.LASF44
	.byte	0x5
	.byte	0xa2
	.long	0x264
	.byte	0x8
	.uleb128 0xa
	.long	.LASF45
	.byte	0x5
	.byte	0xa6
	.long	0x5e
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x22d
	.uleb128 0x6
	.byte	0x8
	.long	0x9b
	.uleb128 0xd
	.long	0x8f
	.long	0x27a
	.uleb128 0xe
	.long	0x34
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x226
	.uleb128 0xd
	.long	0x8f
	.long	0x290
	.uleb128 0xe
	.long	0x34
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF65
	.uleb128 0x10
	.long	.LASF46
	.byte	0x5
	.value	0x13f
	.long	0x290
	.uleb128 0x10
	.long	.LASF47
	.byte	0x5
	.value	0x140
	.long	0x290
	.uleb128 0x10
	.long	.LASF48
	.byte	0x5
	.value	0x141
	.long	0x290
	.uleb128 0x6
	.byte	0x8
	.long	0x96
	.uleb128 0x8
	.long	0x2b9
	.uleb128 0x7
	.long	0x2b9
	.uleb128 0x11
	.long	.LASF49
	.byte	0x7
	.byte	0x87
	.long	0x264
	.uleb128 0x11
	.long	.LASF50
	.byte	0x7
	.byte	0x88
	.long	0x264
	.uleb128 0x11
	.long	.LASF51
	.byte	0x7
	.byte	0x89
	.long	0x264
	.uleb128 0x11
	.long	.LASF52
	.byte	0x8
	.byte	0x1a
	.long	0x5e
	.uleb128 0xd
	.long	0x2bf
	.long	0x300
	.uleb128 0x12
	.byte	0
	.uleb128 0x8
	.long	0x2f5
	.uleb128 0x11
	.long	.LASF53
	.byte	0x8
	.byte	0x1b
	.long	0x300
	.uleb128 0x13
	.long	.LASF66
	.byte	0x1
	.byte	0x3
	.long	0x5e
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x41f
	.uleb128 0x14
	.string	"fl"
	.byte	0x1
	.byte	0x5
	.long	0x41f
	.long	.LLST0
	.uleb128 0x15
	.string	"buf"
	.byte	0x1
	.byte	0x6
	.long	0x42a
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x16
	.string	"cnt"
	.byte	0x1
	.byte	0x7
	.long	0x5e
	.uleb128 0x17
	.long	0x46c
	.quad	.LBB6
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0xe
	.long	0x38e
	.uleb128 0x18
	.long	0x47c
	.long	.LLST1
	.uleb128 0x19
	.quad	.LVL4
	.long	0x493
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x7c
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1b
	.long	0x43a
	.quad	.LBB9
	.quad	.LBE9-.LBB9
	.byte	0x1
	.byte	0x8
	.long	0x3e5
	.uleb128 0x18
	.long	0x460
	.long	.LLST2
	.uleb128 0x18
	.long	0x455
	.long	.LLST3
	.uleb128 0x18
	.long	0x44a
	.long	.LLST4
	.uleb128 0x19
	.quad	.LVL2
	.long	0x4a2
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x2
	.byte	0x8
	.byte	0x40
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x2
	.byte	0x76
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x1c
	.quad	.LVL0
	.long	0x4b1
	.long	0x411
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.uleb128 0x1d
	.quad	.LVL8
	.long	0x4bc
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x21b
	.uleb128 0x7
	.long	0x41f
	.uleb128 0xd
	.long	0x8f
	.long	0x43a
	.uleb128 0xe
	.long	0x34
	.byte	0x3f
	.byte	0
	.uleb128 0x1e
	.long	.LASF55
	.byte	0x2
	.byte	0xfc
	.long	0x84
	.byte	0x3
	.long	0x46c
	.uleb128 0x1f
	.string	"__s"
	.byte	0x2
	.byte	0xfc
	.long	0x8a
	.uleb128 0x1f
	.string	"__n"
	.byte	0x2
	.byte	0xfc
	.long	0x5e
	.uleb128 0x20
	.long	.LASF54
	.byte	0x2
	.byte	0xfc
	.long	0x425
	.byte	0
	.uleb128 0x1e
	.long	.LASF56
	.byte	0x2
	.byte	0x66
	.long	0x5e
	.byte	0x3
	.long	0x489
	.uleb128 0x20
	.long	.LASF57
	.byte	0x2
	.byte	0x66
	.long	0x2c4
	.uleb128 0x21
	.byte	0
	.uleb128 0x22
	.uleb128 0x8
	.byte	0x9e
	.uleb128 0x6
	.byte	0x79
	.byte	0x65
	.byte	0x73
	.byte	0x21
	.byte	0xa
	.byte	0
	.uleb128 0x23
	.long	.LASF58
	.long	.LASF59
	.byte	0x9
	.byte	0
	.long	.LASF58
	.uleb128 0x23
	.long	.LASF55
	.long	.LASF60
	.byte	0x2
	.byte	0xf2
	.long	.LASF55
	.uleb128 0x24
	.long	.LASF67
	.long	.LASF67
	.byte	0x7
	.byte	0xe8
	.uleb128 0x25
	.long	.LASF68
	.long	.LASF68
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
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
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x36
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL1
	.quad	.LVL6
	.value	0x1
	.byte	0x56
	.quad	.LVL7
	.quad	.LFE23
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL3
	.quad	.LVL5
	.value	0x6
	.byte	0xf2
	.long	.Ldebug_info0+1161
	.sleb128 0
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x56
	.quad	0
	.quad	0
.LLST3:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x3
	.byte	0x8
	.byte	0x40
	.byte	0x9f
	.quad	0
	.quad	0
.LLST4:
	.quad	.LVL1
	.quad	.LVL2
	.value	0x1
	.byte	0x53
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB6
	.quad	.LBE6
	.quad	.LBB11
	.quad	.LBE11
	.quad	0
	.quad	0
	.quad	.LFB23
	.quad	.LFE23
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF19:
	.string	"_IO_buf_end"
.LASF67:
	.string	"fopen"
.LASF27:
	.string	"_old_offset"
.LASF59:
	.string	"__builtin_puts"
.LASF52:
	.string	"sys_nerr"
.LASF22:
	.string	"_IO_save_end"
.LASF5:
	.string	"short int"
.LASF7:
	.string	"size_t"
.LASF32:
	.string	"_offset"
.LASF16:
	.string	"_IO_write_ptr"
.LASF11:
	.string	"_flags"
.LASF18:
	.string	"_IO_buf_base"
.LASF23:
	.string	"_markers"
.LASF13:
	.string	"_IO_read_end"
.LASF55:
	.string	"fgets"
.LASF51:
	.string	"stderr"
.LASF63:
	.string	"/home/ubuntu/research/sjyfuzz/suts/test2"
.LASF31:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF56:
	.string	"printf"
.LASF28:
	.string	"_cur_column"
.LASF48:
	.string	"_IO_2_1_stderr_"
.LASF65:
	.string	"_IO_FILE_plus"
.LASF45:
	.string	"_pos"
.LASF44:
	.string	"_sbuf"
.LASF41:
	.string	"_IO_FILE"
.LASF1:
	.string	"unsigned char"
.LASF62:
	.string	"test.c"
.LASF4:
	.string	"signed char"
.LASF46:
	.string	"_IO_2_1_stdin_"
.LASF30:
	.string	"_shortbuf"
.LASF3:
	.string	"unsigned int"
.LASF42:
	.string	"_IO_marker"
.LASF61:
	.string	"GNU C11 7.5.0 -mtune=generic -march=x86-64 -g -g -O2 -O3 -funroll-loops -fstack-protector-strong"
.LASF58:
	.string	"puts"
.LASF15:
	.string	"_IO_write_base"
.LASF39:
	.string	"_unused2"
.LASF68:
	.string	"__stack_chk_fail"
.LASF12:
	.string	"_IO_read_ptr"
.LASF2:
	.string	"short unsigned int"
.LASF10:
	.string	"char"
.LASF66:
	.string	"main"
.LASF43:
	.string	"_next"
.LASF33:
	.string	"__pad1"
.LASF34:
	.string	"__pad2"
.LASF35:
	.string	"__pad3"
.LASF36:
	.string	"__pad4"
.LASF37:
	.string	"__pad5"
.LASF60:
	.string	"__fgets_alias"
.LASF57:
	.string	"__fmt"
.LASF0:
	.string	"long unsigned int"
.LASF17:
	.string	"_IO_write_end"
.LASF9:
	.string	"__off64_t"
.LASF8:
	.string	"__off_t"
.LASF24:
	.string	"_chain"
.LASF21:
	.string	"_IO_backup_base"
.LASF49:
	.string	"stdin"
.LASF26:
	.string	"_flags2"
.LASF38:
	.string	"_mode"
.LASF14:
	.string	"_IO_read_base"
.LASF29:
	.string	"_vtable_offset"
.LASF20:
	.string	"_IO_save_base"
.LASF53:
	.string	"sys_errlist"
.LASF25:
	.string	"_fileno"
.LASF40:
	.string	"FILE"
.LASF54:
	.string	"__stream"
.LASF50:
	.string	"stdout"
.LASF47:
	.string	"_IO_2_1_stdout_"
.LASF64:
	.string	"_IO_lock_t"
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

