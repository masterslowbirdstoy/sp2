	.file	"test.c"
	.text
	.section	.rodata
.LC0:
	.string	"Sum of positive values: %d\n"
.LC1:
	.string	"Sum of negative values: %d\n"
.LC2:
	.string	"7th bit of negative sum: %c\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$80, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$-1, -64(%rbp)
	movl	$1, -60(%rbp)
	movl	$-1, -56(%rbp)
	movl	$1, -52(%rbp)
	movl	$-1, -48(%rbp)
	movl	$1, -44(%rbp)
	movl	$-1, -40(%rbp)
	movl	$1, -36(%rbp)
	movl	$-1, -32(%rbp)
	movl	$1, -28(%rbp)
	movl	$-1, -24(%rbp)
	movl	$2, -20(%rbp)
	movl	$0, -68(%rbp)
	jmp	.L2
.L5:
	movl	-68(%rbp), %eax
	cltq
	movl	-64(%rbp,%rax,4), %eax
	testl	%eax, %eax
	jle	.L3
	movl	-68(%rbp), %eax
	cltq
	movl	-64(%rbp,%rax,4), %eax
	addl	%eax, -72(%rbp)
	jmp	.L4
.L3:
	movl	-68(%rbp), %eax
	cltq
	movl	-64(%rbp,%rax,4), %eax
	addl	%eax, -76(%rbp)
.L4:
	addl	$1, -68(%rbp)
.L2:
	cmpl	$11, -68(%rbp)
	jle	.L5
	movl	-72(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-76(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-76(%rbp), %eax
	andl	$128, %eax
	testl	%eax, %eax
	je	.L6
	movl	$49, %eax
	jmp	.L7
.L6:
	movl	$48, %eax
.L7:
	movl	%eax, %esi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L9
	call	__stack_chk_fail@PLT
.L9:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 10.2.0"
	.section	.note.GNU-stack,"",@progbits
