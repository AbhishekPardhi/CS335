Function:
	push rbp
	mov rbp, rsp
	mov rdi, [ebp + 8]
	mov 0[rbp], rdi
	mov rsi, [ebp + 16]
	mov -8[rbp], rsi
	mov rdx, [ebp + 24]
	mov -16[rbp], rdx
	add rdi, rsi
	mov rax, rdi
	mov rdx, rax
	mov rdx, rax
	mov rdx, rsi
