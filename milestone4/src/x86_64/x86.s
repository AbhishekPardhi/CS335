	.file	"test.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	%rdi, -8(%rbp)
	movq	$2, %rbx
	movq	$8, %rcx
	imulq	%rbx, %rcx
	movq	%rcx, -64(%rbp)
	movq	$3, %rdx
	movq	-64(%rbp), %rsi
	movq	%rdx, -56(%rbp,%rsi,1)
	movq	-64(%rbp), %r8
	movq	-56(%rbp,%r8,1), %rdi
	movq	%rdi, -72(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movq	$0, %rax
	call	printf@PLT
	leave
	ret
