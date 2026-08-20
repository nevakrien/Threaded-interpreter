	.file	"indirect.c"
	.text
	.globl	indirect_run                    # -- Begin function indirect_run
	.p2align	4
	.type	indirect_run,@function
indirect_run:                           # @indirect_run
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	(%rdi), %rax
	movq	(%rax), %rax
	jmpq	*(%rax)
	.p2align	4
.Ltmp0:                                 # Block address taken
.LBB0_1:                                # =>This Inner Loop Header: Depth=1
	#APP
	.globl	forth_indirect_push
forth_indirect_push:

	#NO_APP
	movq	(%rbx), %rax
	leaq	8(%rax), %rcx
	movq	%rcx, (%rbx)
	movq	8(%rax), %rcx
	movq	520(%rbx), %rdx
	leaq	8(%rdx), %rsi
	movq	%rsi, 520(%rbx)
	movq	%rcx, (%rdx)
	addq	$16, %rax
	movq	%rax, (%rbx)
	movq	(%rax), %rax
	jmpq	*(%rax)
	.p2align	4
.Ltmp1:                                 # Block address taken
.LBB0_2:                                # =>This Inner Loop Header: Depth=1
	#APP
	.globl	forth_indirect_add
forth_indirect_add:

	#NO_APP
	movq	520(%rbx), %rax
	leaq	-8(%rax), %rcx
	movq	-16(%rax), %rdx
	addq	-8(%rax), %rdx
	movq	%rcx, 520(%rbx)
	movq	%rdx, -16(%rax)
	movq	(%rbx), %rax
	addq	$8, %rax
	movq	%rax, (%rbx)
	movq	(%rax), %rax
	jmpq	*(%rax)
	.p2align	4
.Ltmp2:                                 # Block address taken
.LBB0_3:                                # =>This Inner Loop Header: Depth=1
	#APP
	.globl	forth_indirect_sub
forth_indirect_sub:

	#NO_APP
	movq	520(%rbx), %rax
	leaq	-8(%rax), %rcx
	movq	-16(%rax), %rdx
	subq	-8(%rax), %rdx
	movq	%rcx, 520(%rbx)
	movq	%rdx, -16(%rax)
	movq	(%rbx), %rax
	addq	$8, %rax
	movq	%rax, (%rbx)
	movq	(%rax), %rax
	jmpq	*(%rax)
	.p2align	4
.Ltmp3:                                 # Block address taken
.LBB0_4:                                # =>This Inner Loop Header: Depth=1
	#APP
	.globl	forth_indirect_mul
forth_indirect_mul:

	#NO_APP
	movq	520(%rbx), %rax
	leaq	-8(%rax), %rcx
	movq	-16(%rax), %rdx
	imulq	-8(%rax), %rdx
	movq	%rcx, 520(%rbx)
	movq	%rdx, -16(%rax)
	movq	(%rbx), %rax
	addq	$8, %rax
	movq	%rax, (%rbx)
	movq	(%rax), %rax
	jmpq	*(%rax)
	.p2align	4
.Ltmp4:                                 # Block address taken
.LBB0_5:                                # =>This Inner Loop Header: Depth=1
	#APP
	.globl	forth_indirect_dup
forth_indirect_dup:

	#NO_APP
	movq	520(%rbx), %rax
	movq	-8(%rax), %rcx
	leaq	8(%rax), %rdx
	movq	%rdx, 520(%rbx)
	movq	%rcx, (%rax)
	movq	(%rbx), %rax
	addq	$8, %rax
	movq	%rax, (%rbx)
	movq	(%rax), %rax
	jmpq	*(%rax)
	.p2align	4
.Ltmp5:                                 # Block address taken
.LBB0_6:                                # =>This Inner Loop Header: Depth=1
	#APP
	.globl	forth_indirect_print
forth_indirect_print:

	#NO_APP
	movq	520(%rbx), %rax
	leaq	-8(%rax), %rcx
	movq	%rcx, 520(%rbx)
	movq	-8(%rax), %rsi
	leaq	.L.str(%rip), %rdi
	xorl	%eax, %eax
	callq	printf@PLT
	movq	(%rbx), %rax
	addq	$8, %rax
	movq	%rax, (%rbx)
	movq	(%rax), %rax
	jmpq	*(%rax)
.Ltmp6:                                 # Block address taken
.LBB0_7:
	#APP
	.globl	forth_indirect_halt
forth_indirect_halt:

	#NO_APP
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end0:
	.size	indirect_run, .Lfunc_end0-indirect_run
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%ld\n"
	.size	.L.str, 5

	.ident	"Ubuntu clang version 20.1.8 (++20250804090239+87f0227cb601-1~exp1~20250804210352.139)"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym indirect_run
