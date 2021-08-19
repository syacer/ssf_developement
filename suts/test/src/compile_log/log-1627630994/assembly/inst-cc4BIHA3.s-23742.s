	.file	"conftest.cpp"
	.text
.Ltext0:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"w"
.LC1:
	.string	"conftest.out"
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
call malloc@PLT
  movq %rax, shmptr_edge(%rip)  
  movq $1048576,  %rdi 
call malloc@PLT
  movq %rax, shmptr_cmp(%rip)  
  movq $64,  %rdi 
call malloc@PLT
  movq %rax, shmptr_gcnt(%rip)  
runSUT:
  movq tmpquadrax(%rip), %rax
  movq tmpquadrsi(%rip), %rsi

/* --- trampoline on server end --- */ 
.LFB30:
	.file 1 "conftest.cpp"
	.loc 1 14 0
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	.loc 1 15 0
	leaq	.LC0(%rip), %rsi
	leaq	.LC1(%rip), %rdi
	call	fopen@PLT
.LVL0:
	.loc 1 16 0
	movq	%rax, %rdi
	.loc 1 15 0
	movq	%rax, %rbx
.LVL1:
	.loc 1 16 0
	call	ferror@PLT
.LVL2:
	testl	%eax, %eax
	movl	$1, %edx
	jne	.L2

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $3003278947, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.loc 1 16 0 is_stmt 0 discriminator 2
	movq	%rbx, %rdi
	call	fclose@PLT
.LVL3:
	testl	%eax, %eax
	setne	%dl
.L2:

/* --- trampoline on edge start --- */ 
pushq %rax 
movq $1197868236, %rax 
movq %rax, edgeId(%rip) 
popq %rax 
call _storeEdge 

/* --- trampoline on edge end --- */ 

	.loc 1 16 0 discriminator 6
	movzbl	%dl, %eax
	.loc 1 20 0 is_stmt 1 discriminator 6
	popq	%rbx
	.cfi_def_cfa_offset 8
.LVL4:
	ret
	.cfi_endproc
.LFE30:
	.size	main, .-main
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/7/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/libio.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/stdio.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x3c3
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF59
	.byte	0x4
	.long	.LASF60
	.long	.LASF61
	.long	.Ldebug_ranges0+0
	.quad	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF7
	.byte	0x2
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
	.byte	0x3
	.byte	0x8c
	.long	0x65
	.uleb128 0x2
	.long	.LASF9
	.byte	0x3
	.byte	0x8d
	.long	0x65
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0x8a
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x7
	.long	0x8a
	.uleb128 0x8
	.long	.LASF41
	.byte	0xd8
	.byte	0x4
	.byte	0xf5
	.long	0x216
	.uleb128 0x9
	.long	.LASF11
	.byte	0x4
	.byte	0xf6
	.long	0x5e
	.byte	0
	.uleb128 0x9
	.long	.LASF12
	.byte	0x4
	.byte	0xfb
	.long	0x84
	.byte	0x8
	.uleb128 0x9
	.long	.LASF13
	.byte	0x4
	.byte	0xfc
	.long	0x84
	.byte	0x10
	.uleb128 0x9
	.long	.LASF14
	.byte	0x4
	.byte	0xfd
	.long	0x84
	.byte	0x18
	.uleb128 0x9
	.long	.LASF15
	.byte	0x4
	.byte	0xfe
	.long	0x84
	.byte	0x20
	.uleb128 0x9
	.long	.LASF16
	.byte	0x4
	.byte	0xff
	.long	0x84
	.byte	0x28
	.uleb128 0xa
	.long	.LASF17
	.byte	0x4
	.value	0x100
	.long	0x84
	.byte	0x30
	.uleb128 0xa
	.long	.LASF18
	.byte	0x4
	.value	0x101
	.long	0x84
	.byte	0x38
	.uleb128 0xa
	.long	.LASF19
	.byte	0x4
	.value	0x102
	.long	0x84
	.byte	0x40
	.uleb128 0xa
	.long	.LASF20
	.byte	0x4
	.value	0x104
	.long	0x84
	.byte	0x48
	.uleb128 0xa
	.long	.LASF21
	.byte	0x4
	.value	0x105
	.long	0x84
	.byte	0x50
	.uleb128 0xa
	.long	.LASF22
	.byte	0x4
	.value	0x106
	.long	0x84
	.byte	0x58
	.uleb128 0xa
	.long	.LASF23
	.byte	0x4
	.value	0x108
	.long	0x259
	.byte	0x60
	.uleb128 0xa
	.long	.LASF24
	.byte	0x4
	.value	0x10a
	.long	0x25f
	.byte	0x68
	.uleb128 0xa
	.long	.LASF25
	.byte	0x4
	.value	0x10c
	.long	0x5e
	.byte	0x70
	.uleb128 0xa
	.long	.LASF26
	.byte	0x4
	.value	0x110
	.long	0x5e
	.byte	0x74
	.uleb128 0xa
	.long	.LASF27
	.byte	0x4
	.value	0x112
	.long	0x6c
	.byte	0x78
	.uleb128 0xa
	.long	.LASF28
	.byte	0x4
	.value	0x116
	.long	0x42
	.byte	0x80
	.uleb128 0xa
	.long	.LASF29
	.byte	0x4
	.value	0x117
	.long	0x50
	.byte	0x82
	.uleb128 0xa
	.long	.LASF30
	.byte	0x4
	.value	0x118
	.long	0x265
	.byte	0x83
	.uleb128 0xa
	.long	.LASF31
	.byte	0x4
	.value	0x11c
	.long	0x275
	.byte	0x88
	.uleb128 0xa
	.long	.LASF32
	.byte	0x4
	.value	0x125
	.long	0x77
	.byte	0x90
	.uleb128 0xa
	.long	.LASF33
	.byte	0x4
	.value	0x12d
	.long	0x82
	.byte	0x98
	.uleb128 0xa
	.long	.LASF34
	.byte	0x4
	.value	0x12e
	.long	0x82
	.byte	0xa0
	.uleb128 0xa
	.long	.LASF35
	.byte	0x4
	.value	0x12f
	.long	0x82
	.byte	0xa8
	.uleb128 0xa
	.long	.LASF36
	.byte	0x4
	.value	0x130
	.long	0x82
	.byte	0xb0
	.uleb128 0xa
	.long	.LASF37
	.byte	0x4
	.value	0x132
	.long	0x29
	.byte	0xb8
	.uleb128 0xa
	.long	.LASF38
	.byte	0x4
	.value	0x133
	.long	0x5e
	.byte	0xc0
	.uleb128 0xa
	.long	.LASF39
	.byte	0x4
	.value	0x135
	.long	0x27b
	.byte	0xc4
	.byte	0
	.uleb128 0x2
	.long	.LASF40
	.byte	0x5
	.byte	0x7
	.long	0x96
	.uleb128 0xb
	.long	.LASF62
	.byte	0x4
	.byte	0x9a
	.uleb128 0x8
	.long	.LASF42
	.byte	0x18
	.byte	0x4
	.byte	0xa0
	.long	0x259
	.uleb128 0x9
	.long	.LASF43
	.byte	0x4
	.byte	0xa1
	.long	0x259
	.byte	0
	.uleb128 0x9
	.long	.LASF44
	.byte	0x4
	.byte	0xa2
	.long	0x25f
	.byte	0x8
	.uleb128 0x9
	.long	.LASF45
	.byte	0x4
	.byte	0xa6
	.long	0x5e
	.byte	0x10
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x228
	.uleb128 0x6
	.byte	0x8
	.long	0x96
	.uleb128 0xc
	.long	0x8a
	.long	0x275
	.uleb128 0xd
	.long	0x34
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x221
	.uleb128 0xc
	.long	0x8a
	.long	0x28b
	.uleb128 0xd
	.long	0x34
	.byte	0x13
	.byte	0
	.uleb128 0xe
	.long	.LASF63
	.uleb128 0xf
	.long	.LASF46
	.byte	0x4
	.value	0x13f
	.long	0x28b
	.uleb128 0xf
	.long	.LASF47
	.byte	0x4
	.value	0x140
	.long	0x28b
	.uleb128 0xf
	.long	.LASF48
	.byte	0x4
	.value	0x141
	.long	0x28b
	.uleb128 0x6
	.byte	0x8
	.long	0x91
	.uleb128 0x7
	.long	0x2b4
	.uleb128 0x10
	.long	.LASF49
	.byte	0x6
	.byte	0x87
	.long	0x25f
	.uleb128 0x10
	.long	.LASF50
	.byte	0x6
	.byte	0x88
	.long	0x25f
	.uleb128 0x10
	.long	.LASF51
	.byte	0x6
	.byte	0x89
	.long	0x25f
	.uleb128 0x10
	.long	.LASF52
	.byte	0x7
	.byte	0x1a
	.long	0x5e
	.uleb128 0xc
	.long	0x2ba
	.long	0x2f6
	.uleb128 0x11
	.byte	0
	.uleb128 0x10
	.long	.LASF53
	.byte	0x7
	.byte	0x1b
	.long	0x2eb
	.uleb128 0x10
	.long	.LASF54
	.byte	0x7
	.byte	0x1e
	.long	0x5e
	.uleb128 0x10
	.long	.LASF55
	.byte	0x7
	.byte	0x1f
	.long	0x2eb
	.uleb128 0x12
	.long	.LASF64
	.byte	0x1
	.byte	0xd
	.long	0x5e
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.long	0x39e
	.uleb128 0x13
	.string	"f"
	.byte	0x1
	.byte	0xf
	.long	0x39e
	.long	.LLST0
	.uleb128 0x14
	.quad	.LVL0
	.long	0x3a4
	.long	0x371
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x9
	.byte	0x3
	.quad	.LC1
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x54
	.uleb128 0x9
	.byte	0x3
	.quad	.LC0
	.byte	0
	.uleb128 0x14
	.quad	.LVL2
	.long	0x3af
	.long	0x389
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.uleb128 0x16
	.quad	.LVL3
	.long	0x3bb
	.uleb128 0x15
	.uleb128 0x1
	.byte	0x55
	.uleb128 0x2
	.byte	0x73
	.sleb128 0
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x216
	.uleb128 0x17
	.long	.LASF56
	.long	.LASF56
	.byte	0x6
	.byte	0xe8
	.uleb128 0x18
	.long	.LASF57
	.long	.LASF57
	.byte	0x6
	.value	0x2f9
	.uleb128 0x17
	.long	.LASF58
	.long	.LASF58
	.byte	0x6
	.byte	0xc7
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
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0x18
	.uleb128 0x2111
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x5
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.quad	.LVL1
	.quad	.LVL2-1
	.value	0x1
	.byte	0x50
	.quad	.LVL2-1
	.quad	.LVL4
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
	.quad	.LFB30
	.quad	.LFE30-.LFB30
	.quad	0
	.quad	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.quad	.LFB30
	.quad	.LFE30
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF19:
	.string	"_IO_buf_end"
.LASF56:
	.string	"fopen"
.LASF27:
	.string	"_old_offset"
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
	.string	"_sys_errlist"
.LASF51:
	.string	"stderr"
.LASF31:
	.string	"_lock"
.LASF6:
	.string	"long int"
.LASF28:
	.string	"_cur_column"
.LASF48:
	.string	"_IO_2_1_stderr_"
.LASF63:
	.string	"_IO_FILE_plus"
.LASF45:
	.string	"_pos"
.LASF54:
	.string	"_sys_nerr"
.LASF44:
	.string	"_sbuf"
.LASF41:
	.string	"_IO_FILE"
.LASF58:
	.string	"fclose"
.LASF1:
	.string	"unsigned char"
.LASF4:
	.string	"signed char"
.LASF57:
	.string	"ferror"
.LASF46:
	.string	"_IO_2_1_stdin_"
.LASF3:
	.string	"unsigned int"
.LASF42:
	.string	"_IO_marker"
.LASF30:
	.string	"_shortbuf"
.LASF15:
	.string	"_IO_write_base"
.LASF39:
	.string	"_unused2"
.LASF12:
	.string	"_IO_read_ptr"
.LASF2:
	.string	"short unsigned int"
.LASF10:
	.string	"char"
.LASF64:
	.string	"main"
.LASF60:
	.string	"conftest.cpp"
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
.LASF43:
	.string	"_next"
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
.LASF61:
	.string	"/home/ubuntu/research/sjyfuzz/suts/test/src"
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
.LASF59:
	.string	"GNU C++14 7.5.0 -mtune=generic -march=x86-64 -g -O3 -funroll-loops -fstack-protector-strong"
.LASF50:
	.string	"stdout"
.LASF47:
	.string	"_IO_2_1_stdout_"
.LASF62:
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
  .asciz "debug message: \n " 

/* --- END --- */

