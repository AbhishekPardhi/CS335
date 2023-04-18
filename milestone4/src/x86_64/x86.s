	.file	"test.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
something:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-8(%rbp), %rbx
	movq	-16(%rbp), %rcx
	addq	%rbx,%rcx
	movq	%rcx, -24(%rbp)
	movq	-24(%rbp), %rax
	popq	%rbp
	ret
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	$12, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	%rdx, -24(%rbp)
	movq	$5, -32(%rbp)
	movq	-32(%rbp), %rsi
	movq	%rsi, -40(%rbp)
	movq	-40(%rbp), %rdi
	movq	-24(%rbp), %r8
	imulq	%rdi,%r8
	movq	%r8, -48(%rbp)
	movq	-24(%rbp), %r9
	movq	-48(%rbp), %r10
	addq	%r9,%r10
	movq	%r10, -56(%rbp)
	movq	-56(%rbp), %r11
	movq	%r11, -64(%rbp)
	movq	-24(%rbp), %r12
	movq	-64(%rbp), %r13
	movq	%r13, %rsi
	movq	%r12, %rdi
	call	something
	movq	%rax, -64(%rbp)
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movq	$0, %rax
	call	printf@PLT
	leave
	ret
