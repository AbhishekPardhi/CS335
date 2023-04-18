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
	movq	$3, -8(%rbp)
	movq	-8(%rbp), %rbx
	movq	$2, %rcx
	addq	%rbx,%rcx
	movq	%rcx, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	$5, %rsi
	cmp 	%rdx, %rsi
	sete	%al
	movzx	%al, %rax
	movq	%rax, -24(%rbp)
	cmp	$0, -24(%rbp)
	je	.L12
	movq	$10, -8(%rbp)
	jmp	.L13
.L12:
	movq	$20, -8(%rbp)
.L13:
	movq	-8(%rbp), %rdi
	movq	%rdi, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movq	$0, %rax
	call	printf@PLT
	leave
	ret
