	.file	"acha.c"
	.text
	.section	.rodata
.LC0:
	.string	"%d"
.LC3:
	.string	"abhishekok"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movq	$2, -4(%rbp)
	movq	-4(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rdi
	movq	$0, %rax
	call	printf@PLT
	leave
	ret
