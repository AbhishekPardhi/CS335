	.text
	.section	.rodata
.LC0:
	.string	"%d\n"
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
	subq	$16, %rsp
	#  i{1} = 5
	movq $5,%rbx
	movq -24(%rsp), %rcx
	movq %rbx ,%rcx
	movq %rbx, -24(%rsp)
	#  j{2} = 0
	movq $0,%rbx
	movq -32(%rsp), %rdx
	movq %rbx ,%rdx
	movq %rbx, -32(%rsp)
	# t1 = j{2} + i{1}
	add %rdx,%rcx
	#  k{3} = t1
	movq -40(%rsp), %rbx
	movq %rcx ,%rbx
	movq %rcx, -40(%rsp)
	# t2 = j{2} + i{1}
	movq -24(%rsp), %rcx
	add %rdx,%rcx
	# t3 = j{2} + i{1}
	movq -24(%rsp), %rsi
	add %rdx,%rsi
	# t4 = j{2} + i{1}
	movq -24(%rsp), %rdi
	add %rdx,%rdi
	# t5 = j{2} + i{1}
	movq -24(%rsp), %r8
	add %rdx,%r8
	# t6 = j{2} + i{1}
	movq -24(%rsp), %r9
	add %rdx,%r9
	# t7 = j{2} + i{1}
	movq -24(%rsp), %r10
	add %rdx,%r10
	# t8 = j{2} + i{1}
	movq -24(%rsp), %r11
	add %rdx,%r11
	# t9 = j{2} + i{1}
	movq -24(%rsp), %r12
	add %rdx,%r12
	# t10 = j{2} + i{1}
	movq -24(%rsp), %r13
	add %rdx,%r13
	# t11 = j{2} + i{1}
	movq -24(%rsp), %r14
	add %rdx,%r14
	# t12 = j{2} + i{1}
	movq -24(%rsp), %r15
	add %rdx,%r15
	# t13 = j{2} + i{1}
	movq %rcx, 0(%rsp)
	movq -24(%rsp), %rcx
	add %rdx,%rcx
	# t14 = j{2} + i{1}
	movq %rsi, 8(%rsp)
	movq -24(%rsp), %rsi
	add %rdx,%rsi
	# t15 = j{2} + i{1}
	movq %rdi, 16(%rsp)
	movq -24(%rsp), %rdi
	add %rdx,%rdi
	# t16 = t15 + t14
	add %rdi,%rsi
	# t17 = t16 + t13
	add %rsi,%rcx
	# t18 = t17 + t12
	add %rcx,%r15
	# t19 = t18 + t11
	add %r15,%r14
	# t20 = t19 + t10
	add %r14,%r13
	# t21 = t20 + t9
	add %r13,%r12
	# t22 = t21 + t8
	add %r12,%r11
	# t23 = t22 + t7
	add %r11,%r10
	# t24 = t23 + t6
	add %r10,%r9
	# t25 = t24 + t5
	add %r9,%r8
	# t26 = t25 + t4
	movq 16(%rsp), %rcx
	add %r8,%rcx
	# t27 = t26 + t3
	movq 8(%rsp), %rsi
	add %rcx,%rsi
	# t28 = t27 + t2
	movq 0(%rsp), %rcx
	add %rsi,%rcx
	#  k{3} = t28
	movq %rcx ,%rbx
	movq %rcx, -40(%rsp)
	#  t30 = k{3}
	movq %rbx ,%rcx
	# t31 = 1 + k{3}
	movq $1,%rsi
	add %rsi,%rbx
	#  k{3} = t31
	movq -40(%rsp), %rsi
	movq %rbx ,%rsi
	movq %rbx, -40(%rsp)

	movq	%rbx, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.1 20230201"
	.section	.note.GNU-stack,"",@progbits
