section .text
    global main
    extern printf

print_code:
    push rbp
    mov rbp, rsp
    
    mov rdi, code
    mov rsi, 10
    mov rdx, 34
    mov rcx, code

    mov rax, 0

    call printf

    pop rbp
    ret

; This program will print its own source when run.

main:
    push rbp
    mov rbp, rsp
    
    ; This function prints the source code
    call print_code
    
    mov rax, 0
    pop rbp
    ret

section .data
   code db"section .text%1$c    global main%1$c    extern printf%1$c%1$cprint_code:%1$c    push rbp%1$c    mov rbp, rsp%1$c    %1$c    mov rdi, code%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    mov rcx, code%1$c%1$c    mov rax, 0%1$c%1$c    call printf%1$c%1$c    pop rbp%1$c    ret%1$c%1$c; This program will print its own source when run.%1$c%1$cmain:%1$c    push rbp%1$c    mov rbp, rsp%1$c    %1$c    ; This function prints the source code%1$c    call print_code%1$c    %1$c    mov rax, 0%1$c    pop rbp%1$c    ret%1$c%1$csection .data%1$c   code db%2$c%3$s%2$c"