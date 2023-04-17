MyClass-MyClass:
	push rbp
	mov rbp, rsp
	mov rdi, [ebp + 8]
	mov rsi, [ebp + 16]
	mov rdx, [ebp + 24]
	pop rbp
	ret
	push rbp
	mov rbp, rsp
	mov rcx, [ebp + 32]
	pop rbp
	ret
ExampleExpression-something:
	push rbp
	mov rbp, rsp
	mov rdi, [ebp + 8]
	mov rsi, [ebp + 16]
	mov rdx, [ebp + 24]
	pop rbp
	ret
ExampleExpression-main:
	push rbp
	mov rbp, rsp
	mov rdi, [ebp + 8]
	mov rsi, [ebp + 16]
	mov rdx, 45
	mov rsi, 1
	mov rdi, t19
	call ExampleExpression-something
	pop rbp
	ret
