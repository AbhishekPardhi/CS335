	.file	"acha.c"
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
	subq	$16, %rsp
	movb	$1, -1(%rbp)
	cmpb	$0, -1(%rbp)
	je	.L2
	movb	$0, -1(%rbp)
	jmp	.L3
.L2:
	movb	$1, -1(%rbp)
.L3:
	movzbl	-1(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	ret
	