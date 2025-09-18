section .data
    s db "section .data    s db %c%s%c, 0", 0

section .text
    global main
    extern printf

main:
    push rbp
    mov rbp, rsp
    
    mov rdi, s      ; format string
    mov rsi, 34     ; ASCII code for "
    mov rdx, s      ; string content
    mov rcx, 34     ; ASCII code for "
    mov rax, 0      ; number of vector registers used
    call printf
    
    mov rax, 0      ; return value
    pop rbp
    ret