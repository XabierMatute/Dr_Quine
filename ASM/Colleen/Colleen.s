section .text
    global main
    extern printf

print_code:
    push rbp
    mov rbp, rsp
    
    mov rdi, code
    mov rsi, 34
    mov rdx, code
    mov rcx, 34

    mov rax, 0      ; number of vector registers used

    call printf

    pop rbp
    ret

; This program will print its own source when run.

main:
    push rbp
    mov rbp, rsp
    
    ; This function prints the source code
    call print_code
    
    mov rax, 0      ; return value
    pop rbp
    ret

section .data
   code db"section .text\n    global main\n    extern printf\n\nprint_code:%c    push rbp%c    mov rbp, rsp%c    %cmov rdi, code%c    mov rsi, 34%c    mov rdx, code%c    mov rcx, 34%c%c    mov rax, 0      ; number of vector registers used%c%c    call printf%c%c    pop rbp%c    ret%c%c; This program will print its own source when run.%c%cmain:%c    push rbp%c    mov rbp, rsp%c    %c; This function prints the source code%c    call print_code%c    %cmov rax, 0      ; return value%c    pop rbp%c    ret%c%csection .data% c   code db%c%s%c"