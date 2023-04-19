	.file	"test.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
fibonacci:
	pushq	%rbp
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	movq	%rsp, %rbp
	subq	$56, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rbx
	movq	$1, %r10
	cmp 	%rbx, %r10
	setge	%al
	movzx	%al, %rax
	movq	%rax, -16(%rbp)
	cmp 	$0, -16(%rbp)
	je  	.L7
	movq	-8(%rbp), %rax
	addq	$56, %rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	popq	%rbp
	retq
.L7:
	movq	-8(%rbp), %r11
	movq	$1, %r12
	subq	%r12, %r11
	movq	%r11, -24(%rbp)
	movq	-24(%rbp), %r13
	movq	%r13, %rdi
	call	fibonacci
	movq	%rax, -32(%rbp)
	movq	-8(%rbp), %r14
	movq	$2, %r15
	subq	%r15, %r14
	movq	%r14, -40(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fibonacci
	movq	%rax, -48(%rbp)
	movq	-32(%rbp), %rbx
	movq	-48(%rbp), %r10
	addq	%rbx, %r10
	movq	%r10, -56(%rbp)
	movq	-56(%rbp), %rax
	addq	$56, %rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	popq	%rbp
	retq
main:
	pushq	%rbp
	pushq	%rbx
	pushq	%r12
	pushq	%r13
	pushq	%r14
	pushq	%r15
	movq	%rsp, %rbp
	subq	$24, %rsp
	movq	%rdi, -8(%rbp)
	movq	$10, %r11
	movq	%r11, -16(%rbp)
	movq	-16(%rbp), %r12
	movq	%r12, %rdi
	call	fibonacci
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movq	$0, %rax
	call	printf@PLT
	addq	$24, %rsp
	popq	%r15
	popq	%r14
	popq	%r13
	popq	%r12
	popq	%rbx
	popq	%rbp
	movq	$60, %rax
	syscall
	retq
