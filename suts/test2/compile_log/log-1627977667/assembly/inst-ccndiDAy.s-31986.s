	.file	"conftest.c"
	.text
.Ltext0:
	.p2align 4,,15
	.type	e, @function
e:
.LFB23:
	.file 1 "conftest.c"
	.loc 1 20 0
	.cfi_startproc
.LVL0:
	.loc 1 21 0
	movslq	%esi, %rsi
	movq	(%rdi,%rsi,8), %rax
	.loc 1 22 0
	ret
	.cfi_endproc
.LFE23:
	.size	e, .-e
	.p2align 4,,15
	.type	f.constprop.0, @function
f.constprop.0:
.LFB26:
	.loc 1 23 0
	.cfi_startproc
.LVL1:
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	.loc 1 23 0
	movq	%rdx, 48(%rsp)
.LBB4:
.LBB5:
	.loc 1 21 0
	movslq	48(%rsp), %rcx
.LBE5:
.LBE4:
	.loc 1 27 0
	leaq	32(%rsp), %rdx
	.loc 1 23 0
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
.LVL2:
	.loc 1 27 0
	leaq	96(%rsp), %rax
	movl	$16, (%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rax, 8(%rsp)
.LBB7:
.LBB6:
	.loc 1 21 0
	movq	(%rsi,%rcx,8), %rax
.LVL3:
.LBE6:
.LBE7:
	.loc 1 31 0
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L8

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $1514489702, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L8:

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $3000117819, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.cfi_restore_state
	call	__stack_chk_fail@PLT
.LVL4:
	.cfi_endproc
.LFE26:
	.size	f.constprop.0, .-f.constprop.0
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
.LFB25:
	.loc 1 55 0
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	.loc 1 56 0
	movq	argv(%rip), %rsi
	leaq	e(%rip), %rdi
	xorl	%edx, %edx
	xorl	%eax, %eax
	call	f.constprop.0
.LVL5:
	movq	argv(%rip), %rsi
	movl	$1, %edx

/* --- trampoline on after_cmp start --- */ 

movq %rdx, tmpquadone(%rip) 
movq %rcx, tmpquadtwo(%rip) 
leaq funcinptr(%rip), %rdx 
movq $1, (%rdx)
movq $'q', 8(%rdx)
movq (%rsi), %rcx 
movq %rcx, 16(%rdx)
movq $0, 24(%rdx)
movq %rax, %rcx 
movq %rcx, 32(%rdx)
movq $0, 40(%rdx)
push (%rdx) 
movq tmpquadone(%rip), %rdx 
movq tmpquadtwo(%rip), %rcx 
movq $1, cmpPassed(%rip) 
call _storeDataFn 

/* --- trampoline on after_cmp end - */ 

	cmpq	(%rsi), %rax
	je	.L13

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $4103066422, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

.L9:

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $2051533211, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.loc 1 59 0
	movl	%edx, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L13:

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $989106131, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.cfi_restore_state
	.loc 1 56 0 discriminator 2
	leaq	e(%rip), %rdi
	xorl	%eax, %eax
	call	f.constprop.0
.LVL6:
	movq	argv(%rip), %rdx

/* --- trampoline on after_cmp start --- */ 

movq %rcx, tmpquadone(%rip) 
movq %rbx, tmpquadtwo(%rip) 
leaq funcinptr(%rip), %rcx 
movq $2, (%rcx)
movq $'q', 8(%rcx)
movq %rax, %rbx 
movq %rbx, 16(%rcx)
movq $0, 24(%rcx)
movq 8(%rdx), %rbx 
movq %rbx, 32(%rcx)
movq $0, 40(%rcx)
push (%rcx) 
movq tmpquadone(%rip), %rcx 
movq tmpquadtwo(%rip), %rbx 
movq $1, cmpPassed(%rip) 
call _storeDataFn 

/* --- trampoline on after_cmp end - */ 

	cmpq	%rax, 8(%rdx)
	setne	%al
	movzbl	%al, %edx
	jmp	.L9
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.comm	argv,8,8
	.comm	argc,4,4
	.comm	xlc6_cc_array,4,4
	.comm	osf4_cc_array,4,4
	.comm	rcsopen,8,8
	.text
.Letext0:
	.file 2 "<built-in>"
	.file 3 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stdarg.h"
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 8 "/usr/include/stdio.h"
	.file 9 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x5c4
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF69
	.byte	0xc
	.long	.LASF70
	.long	.LASF71
	.long	.Ldebug_ranges0+0x30
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF6
	.byte	0x3
	.byte	0x28
	.long	0x34
	.uleb128 0x3
	.long	.LASF72
	.long	0x3d
	.uleb128 0x4
	.long	0x54
	.long	0x4d
	.uleb128 0x5
	.long	0x4d
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF4
	.uleb128 0x7
	.long	.LASF17
	.byte	0x18
	.byte	0x2
	.byte	0
	.long	0x91
	.uleb128 0x8
	.long	.LASF0
	.byte	0x2
	.byte	0
	.long	0x91
	.byte	0
	.uleb128 0x8
	.long	.LASF1
	.byte	0x2
	.byte	0
	.long	0x91
	.byte	0x4
	.uleb128 0x8
	.long	.LASF2
	.byte	0x2
	.byte	0
	.long	0x98
	.byte	0x8
	.uleb128 0x8
	.long	.LASF3
	.byte	0x2
	.byte	0
	.long	0x98
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF5
	.uleb128 0x9
	.byte	0x8
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0x63
	.long	0x29
	.uleb128 0x2
	.long	.LASF8
	.byte	0x4
	.byte	0xd8
	.long	0x4d
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF9
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.long	.LASF10
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF11
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF12
	.uleb128 0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF13
	.uleb128 0x2
	.long	.LASF14
	.byte	0x5
	.byte	0x8c
	.long	0xd3
	.uleb128 0x2
	.long	.LASF15
	.byte	0x5
	.byte	0x8d
	.long	0xd3
	.uleb128 0xb
	.byte	0x8
	.long	0xf6
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF16
	.uleb128 0xc
	.long	0xf6
	.uleb128 0x7
	.long	.LASF18
	.byte	0xd8
	.byte	0x6
	.byte	0xf5
	.long	0x282
	.uleb128 0x8
	.long	.LASF19
	.byte	0x6
	.byte	0xf6
	.long	0xcc
	.byte	0
	.uleb128 0x8
	.long	.LASF20
	.byte	0x6
	.byte	0xfb
	.long	0xf0
	.byte	0x8
	.uleb128 0x8
	.long	.LASF21
	.byte	0x6
	.byte	0xfc
	.long	0xf0
	.byte	0x10
	.uleb128 0x8
	.long	.LASF22
	.byte	0x6
	.byte	0xfd
	.long	0xf0
	.byte	0x18
	.uleb128 0x8
	.long	.LASF23
	.byte	0x6
	.byte	0xfe
	.long	0xf0
	.byte	0x20
	.uleb128 0x8
	.long	.LASF24
	.byte	0x6
	.byte	0xff
	.long	0xf0
	.byte	0x28
	.uleb128 0xd
	.long	.LASF25
	.byte	0x6
	.value	0x100
	.long	0xf0
	.byte	0x30
	.uleb128 0xd
	.long	.LASF26
	.byte	0x6
	.value	0x101
	.long	0xf0
	.byte	0x38
	.uleb128 0xd
	.long	.LASF27
	.byte	0x6
	.value	0x102
	.long	0xf0
	.byte	0x40
	.uleb128 0xd
	.long	.LASF28
	.byte	0x6
	.value	0x104
	.long	0xf0
	.byte	0x48
	.uleb128 0xd
	.long	.LASF29
	.byte	0x6
	.value	0x105
	.long	0xf0
	.byte	0x50
	.uleb128 0xd
	.long	.LASF30
	.byte	0x6
	.value	0x106
	.long	0xf0
	.byte	0x58
	.uleb128 0xd
	.long	.LASF31
	.byte	0x6
	.value	0x108
	.long	0x2c5
	.byte	0x60
	.uleb128 0xd
	.long	.LASF32
	.byte	0x6
	.value	0x10a
	.long	0x2cb
	.byte	0x68
	.uleb128 0xd
	.long	.LASF33
	.byte	0x6
	.value	0x10c
	.long	0xcc
	.byte	0x70
	.uleb128 0xd
	.long	.LASF34
	.byte	0x6
	.value	0x110
	.long	0xcc
	.byte	0x74
	.uleb128 0xd
	.long	.LASF35
	.byte	0x6
	.value	0x112
	.long	0xda
	.byte	0x78
	.uleb128 0xd
	.long	.LASF36
	.byte	0x6
	.value	0x116
	.long	0xb7
	.byte	0x80
	.uleb128 0xd
	.long	.LASF37
	.byte	0x6
	.value	0x117
	.long	0xbe
	.byte	0x82
	.uleb128 0xd
	.long	.LASF38
	.byte	0x6
	.value	0x118
	.long	0x2d1
	.byte	0x83
	.uleb128 0xd
	.long	.LASF39
	.byte	0x6
	.value	0x11c
	.long	0x2e1
	.byte	0x88
	.uleb128 0xd
	.long	.LASF40
	.byte	0x6
	.value	0x125
	.long	0xe5
	.byte	0x90
	.uleb128 0xd
	.long	.LASF41
	.byte	0x6
	.value	0x12d
	.long	0x98
	.byte	0x98
	.uleb128 0xd
	.long	.LASF42
	.byte	0x6
	.value	0x12e
	.long	0x98
	.byte	0xa0
	.uleb128 0xd
	.long	.LASF43
	.byte	0x6
	.value	0x12f
	.long	0x98
	.byte	0xa8
	.uleb128 0xd
	.long	.LASF44
	.byte	0x6
	.value	0x130
	.long	0x98
	.byte	0xb0
	.uleb128 0xd
	.long	.LASF45
	.byte	0x6
	.value	0x132
	.long	0xa5
	.byte	0xb8
	.uleb128 0xd
	.long	.LASF46
	.byte	0x6
	.value	0x133
	.long	0xcc
	.byte	0xc0
	.uleb128 0xd
	.long	.LASF47
	.byte	0x6
	.value	0x135
	.long	0x2e7
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF48
	.byte	0x7
	.byte	0x7
	.long	0x102
	.uleb128 0xe
	.long	.LASF73
	.byte	0x6
	.byte	0x9a
	.uleb128 0x7
	.long	.LASF49
	.byte	0x18
	.byte	0x6
	.byte	0xa0
	.long	0x2c5
	.uleb128 0x8
	.long	.LASF50
	.byte	0x6
	.byte	0xa1
	.long	0x2c5
	.byte	0
	.uleb128 0x8
	.long	.LASF51
	.byte	0x6
	.byte	0xa2
	.long	0x2cb
	.byte	0x8
	.uleb128 0x8
	.long	.LASF52
	.byte	0x6
	.byte	0xa6
	.long	0xcc
	.byte	0x10
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x294
	.uleb128 0xb
	.byte	0x8
	.long	0x102
	.uleb128 0x4
	.long	0xf6
	.long	0x2e1
	.uleb128 0x5
	.long	0x4d
	.byte	0
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x28d
	.uleb128 0x4
	.long	0xf6
	.long	0x2f7
	.uleb128 0x5
	.long	0x4d
	.byte	0x13
	.byte	0
	.uleb128 0xf
	.long	.LASF61
	.uleb128 0x10
	.long	.LASF53
	.byte	0x6
	.value	0x13f
	.long	0x2f7
	.uleb128 0x10
	.long	.LASF54
	.byte	0x6
	.value	0x140
	.long	0x2f7
	.uleb128 0x10
	.long	.LASF55
	.byte	0x6
	.value	0x141
	.long	0x2f7
	.uleb128 0xb
	.byte	0x8
	.long	0xfd
	.uleb128 0xc
	.long	0x320
	.uleb128 0x11
	.long	.LASF56
	.byte	0x8
	.byte	0x87
	.long	0x2cb
	.uleb128 0x11
	.long	.LASF57
	.byte	0x8
	.byte	0x88
	.long	0x2cb
	.uleb128 0x11
	.long	.LASF58
	.byte	0x8
	.byte	0x89
	.long	0x2cb
	.uleb128 0x11
	.long	.LASF59
	.byte	0x9
	.byte	0x1a
	.long	0xcc
	.uleb128 0x4
	.long	0x326
	.long	0x362
	.uleb128 0x12
	.byte	0
	.uleb128 0xc
	.long	0x357
	.uleb128 0x11
	.long	.LASF60
	.byte	0x9
	.byte	0x1b
	.long	0x362
	.uleb128 0x13
	.string	"buf"
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.long	0x389
	.uleb128 0x14
	.string	"x"
	.byte	0x1
	.byte	0xf
	.long	0xcc
	.byte	0
	.byte	0
	.uleb128 0x15
	.long	0x3a2
	.long	0x3a2
	.uleb128 0x16
	.long	0x3a8
	.uleb128 0x16
	.long	0x3ae
	.uleb128 0x16
	.long	0xcc
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x282
	.uleb128 0xb
	.byte	0x8
	.long	0x372
	.uleb128 0xb
	.byte	0x8
	.long	0x3b4
	.uleb128 0xf
	.long	.LASF62
	.uleb128 0x17
	.long	.LASF63
	.byte	0x1
	.byte	0x10
	.long	0x3ce
	.uleb128 0x9
	.byte	0x3
	.quad	rcsopen
	.uleb128 0xb
	.byte	0x8
	.long	0x389
	.uleb128 0x4
	.long	0xcc
	.long	0x3e4
	.uleb128 0x5
	.long	0x4d
	.byte	0
	.byte	0
	.uleb128 0x17
	.long	.LASF64
	.byte	0x1
	.byte	0x28
	.long	0x3d4
	.uleb128 0x9
	.byte	0x3
	.quad	osf4_cc_array
	.uleb128 0x17
	.long	.LASF65
	.byte	0x1
	.byte	0x2d
	.long	0x3d4
	.uleb128 0x9
	.byte	0x3
	.quad	xlc6_cc_array
	.uleb128 0x6
	.byte	0x8
	.byte	0x4
	.long	.LASF66
	.uleb128 0x17
	.long	.LASF67
	.byte	0x1
	.byte	0x33
	.long	0xcc
	.uleb128 0x9
	.byte	0x3
	.quad	argc
	.uleb128 0x17
	.long	.LASF68
	.byte	0x1
	.byte	0x34
	.long	0x43f
	.uleb128 0x9
	.byte	0x3
	.quad	argv
	.uleb128 0xb
	.byte	0x8
	.long	0xf0
	.uleb128 0x18
	.long	.LASF74
	.byte	0x1
	.byte	0x36
	.long	0xcc
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.long	0x4a6
	.uleb128 0x19
	.quad	.LVL5
	.long	0x53f
	.long	0x48a
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	e
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x51
	.uleb128 0x1
	.byte	0x30
	.byte	0
	.uleb128 0x1b
	.quad	.LVL6
	.long	0x53f
	.uleb128 0x1a
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	e
	.byte	0
	.byte	0
	.uleb128 0x1c
	.string	"f"
	.byte	0x1
	.byte	0x17
	.long	0xf0
	.byte	0x1
	.long	0x4da
	.uleb128 0x1d
	.string	"g"
	.byte	0x1
	.byte	0x17
	.long	0x4ee
	.uleb128 0x1d
	.string	"p"
	.byte	0x1
	.byte	0x17
	.long	0x43f
	.uleb128 0x1e
	.uleb128 0x1f
	.string	"s"
	.byte	0x1
	.byte	0x19
	.long	0xf0
	.uleb128 0x1f
	.string	"v"
	.byte	0x1
	.byte	0x1a
	.long	0x9a
	.byte	0
	.uleb128 0x15
	.long	0xf0
	.long	0x4ee
	.uleb128 0x16
	.long	0x43f
	.uleb128 0x16
	.long	0xcc
	.byte	0
	.uleb128 0xb
	.byte	0x8
	.long	0x4da
	.uleb128 0x20
	.string	"e"
	.byte	0x1
	.byte	0x11
	.long	0xf0
	.byte	0x1
	.long	0x515
	.uleb128 0x1d
	.string	"p"
	.byte	0x1
	.byte	0x12
	.long	0x43f
	.uleb128 0x1d
	.string	"i"
	.byte	0x1
	.byte	0x13
	.long	0xcc
	.byte	0
	.uleb128 0x21
	.long	0x4f4
	.quad	.LFB23
	.quad	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.long	0x53f
	.uleb128 0x22
	.long	0x502
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x22
	.long	0x50b
	.uleb128 0x1
	.byte	0x54
	.byte	0
	.uleb128 0x21
	.long	0x4a6
	.quad	.LFB26
	.quad	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.long	0x5be
	.uleb128 0x23
	.long	0x4b4
	.long	.LLST0
	.uleb128 0x23
	.long	0x4bd
	.long	.LLST1
	.uleb128 0x24
	.long	0x4c7
	.uleb128 0x25
	.long	0x4d0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.uleb128 0x22
	.long	0x4b4
	.uleb128 0xa
	.byte	0x3
	.quad	e
	.byte	0x9f
	.uleb128 0x26
	.long	0x4f4
	.quad	.LBB4
	.long	.Ldebug_ranges0+0
	.byte	0x1
	.byte	0x1c
	.long	0x5b0
	.uleb128 0x27
	.long	0x50b
	.uleb128 0x23
	.long	0x502
	.long	.LLST2
	.byte	0
	.uleb128 0x28
	.quad	.LVL4
	.long	0x5be
	.byte	0
	.uleb128 0x29
	.long	.LASF75
	.long	.LASF75
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
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
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x26
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
	.uleb128 0x27
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x29
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
	.quad	.LVL4-1
	.value	0x1
	.byte	0x55
	.quad	.LVL4-1
	.quad	.LFE26
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x55
	.byte	0x9f
	.quad	0
	.quad	0
.LLST1:
	.quad	.LVL1
	.quad	.LVL4-1
	.value	0x1
	.byte	0x54
	.quad	.LVL4-1
	.quad	.LFE26
	.value	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.quad	0
	.quad	0
.LLST2:
	.quad	.LVL2
	.quad	.LVL3
	.value	0x1
	.byte	0x54
	.quad	0
	.quad	0
	.section	.debug_aranges,"",@progbits
	.long	0x3c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	.LFB25
	.quad	.LFE25-.LFB25
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LBB4
	.quad	.LBE4
	.quad	.LBB7
	.quad	.LBE7
	.quad	0
	.quad	0
	.quad	.Ltext0
	.quad	.Letext0
	.quad	.LFB25
	.quad	.LFE25
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF27:
	.string	"_IO_buf_end"
.LASF35:
	.string	"_old_offset"
.LASF66:
	.string	"double"
.LASF59:
	.string	"sys_nerr"
.LASF30:
	.string	"_IO_save_end"
.LASF12:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF40:
	.string	"_offset"
.LASF24:
	.string	"_IO_write_ptr"
.LASF19:
	.string	"_flags"
.LASF26:
	.string	"_IO_buf_base"
.LASF7:
	.string	"va_list"
.LASF17:
	.string	"__va_list_tag"
.LASF31:
	.string	"_markers"
.LASF21:
	.string	"_IO_read_end"
.LASF65:
	.string	"xlc6_cc_array"
.LASF63:
	.string	"rcsopen"
.LASF64:
	.string	"osf4_cc_array"
.LASF70:
	.string	"conftest.c"
.LASF58:
	.string	"stderr"
.LASF71:
	.string	"/home/ubuntu/research/sjyfuzz/suts/test2"
.LASF39:
	.string	"_lock"
.LASF13:
	.string	"long int"
.LASF1:
	.string	"fp_offset"
.LASF36:
	.string	"_cur_column"
.LASF55:
	.string	"_IO_2_1_stderr_"
.LASF61:
	.string	"_IO_FILE_plus"
.LASF0:
	.string	"gp_offset"
.LASF68:
	.string	"argv"
.LASF51:
	.string	"_sbuf"
.LASF18:
	.string	"_IO_FILE"
.LASF9:
	.string	"unsigned char"
.LASF67:
	.string	"argc"
.LASF11:
	.string	"signed char"
.LASF53:
	.string	"_IO_2_1_stdin_"
.LASF38:
	.string	"_shortbuf"
.LASF5:
	.string	"unsigned int"
.LASF49:
	.string	"_IO_marker"
.LASF69:
	.string	"GNU C11 7.5.0 -mtune=generic -march=x86-64 -g -g -O2 -O3 -funroll-loops -fstack-protector-strong"
.LASF23:
	.string	"_IO_write_base"
.LASF47:
	.string	"_unused2"
.LASF75:
	.string	"__stack_chk_fail"
.LASF20:
	.string	"_IO_read_ptr"
.LASF52:
	.string	"_pos"
.LASF10:
	.string	"short unsigned int"
.LASF3:
	.string	"reg_save_area"
.LASF16:
	.string	"char"
.LASF74:
	.string	"main"
.LASF50:
	.string	"_next"
.LASF41:
	.string	"__pad1"
.LASF42:
	.string	"__pad2"
.LASF43:
	.string	"__pad3"
.LASF44:
	.string	"__pad4"
.LASF45:
	.string	"__pad5"
.LASF4:
	.string	"long unsigned int"
.LASF72:
	.string	"__builtin_va_list"
.LASF25:
	.string	"_IO_write_end"
.LASF15:
	.string	"__off64_t"
.LASF2:
	.string	"overflow_arg_area"
.LASF14:
	.string	"__off_t"
.LASF32:
	.string	"_chain"
.LASF29:
	.string	"_IO_backup_base"
.LASF56:
	.string	"stdin"
.LASF34:
	.string	"_flags2"
.LASF46:
	.string	"_mode"
.LASF22:
	.string	"_IO_read_base"
.LASF6:
	.string	"__gnuc_va_list"
.LASF37:
	.string	"_vtable_offset"
.LASF28:
	.string	"_IO_save_base"
.LASF60:
	.string	"sys_errlist"
.LASF62:
	.string	"stat"
.LASF33:
	.string	"_fileno"
.LASF48:
	.string	"FILE"
.LASF57:
	.string	"stdout"
.LASF54:
	.string	"_IO_2_1_stdout_"
.LASF73:
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

