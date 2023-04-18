    .file    "test.c"
    .section    .rodata
.LC0:
    .string    "%d\n"
    .text
    .globl    main
sex:
    pushq    %rbp
    movq    %rsp, %rbp
    movq    %rdi, -4(%rbp)
    movq    %rsi, -8(%rbp)
    movq    -4(%rbp), %rdx
    movq    -8(%rbp), %rax
    addq    %rdx, %rax
    popq    %rbp
    ret
main:
    pushq    %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    $3, -12(%rbp)
    movq    $4, -8(%rbp)
    movq    -8(%rbp), %rdx
    movq    -12(%rbp), %rax
    movq    %rdx, %rsi
    movq    %rax, %rdi
    call    sex
    movq    %rax, %rsi
    leaq    .LC0(%rip), %rdi
    movq    $0, %rax
    call    printf@PLT
    movq    $12, %rsi
    leaq    .LC0(%rip), %rdi
    movq    $0, %rax
    call    printf@PLT
    movq    $69, %rsi
    leaq    .LC0(%rip), %rdi
    movq    $0, %rax
    call    printf@PLT
    movq    -12(%rbp), %rdx
    movq    -8(%rbp), %rax
    addq    %rdx, %rax
    movq    %rax, -4(%rbp)
    movq    $0, %rax
    leave
    ret
    