	.file	"test.java"
	.text
	.section	.rodata
.LC0:
	.string	"acha"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	leaq	.LC0(%rip), %rdi
	movq	$0, %rax
	call	printf@PLT
	addq	$16, %rsp
	popq	%rbp
	movq	$0, %rax
	syscall
	retq
