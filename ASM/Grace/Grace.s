%macro OPEN 1
    mov rax, 2
    lea rdi, [rel %1]
    mov rsi, 577
    mov rdx, 0664o
    syscall
    mov rbx, rax
%endmacro

%macro PRINT_TO_FILE 2
    push rbp
    mov rdi, rbx
    mov rsi, code
    mov rdx, 10
    mov rcx, 34
    mov r8, 37
    mov r9, code
    mov rax, 0
    call dprintf wrt ..plt
    pop rbp
%endmacro

%macro CLOSE 0
    mov rax, 3
    mov rdi, rbx
    syscall
%endmacro

section .text
    global main
    extern dprintf

; This program will create a copy of its own source when run.

main:
    OPEN fn
    PRINT_TO_FILE code, 0
    CLOSE

section .rodata
    fn: db "Grace_kid.s", 0
    code: db "%3$cmacro OPEN 1%1$c    mov rax, 2%1$c    lea rdi, [rel %3$c1]%1$c    mov rsi, 577%1$c    mov rdx, 0664o%1$c    syscall%1$c    mov rbx, rax%1$c%3$cendmacro%1$c%1$c%3$cmacro PRINT_TO_FILE 2%1$c    push rbp%1$c    mov rdi, rbx%1$c    mov rsi, code%1$c    mov rdx, 10%1$c    mov rcx, 34%1$c    mov r8, 37%1$c    mov r9, code%1$c    mov rax, 0%1$c    call dprintf wrt ..plt%1$c    pop rbp%1$c%3$cendmacro%1$c%1$c%3$cmacro CLOSE 0%1$c    mov rax, 3%1$c    mov rdi, rbx%1$c    syscall%1$c%3$cendmacro%1$c%1$csection .text%1$c    global main%1$c    extern dprintf%1$c%1$c; This program will create a copy of its own source when run.%1$c%1$cmain:%1$c    OPEN fn%1$c    PRINT_TO_FILE code, 0%1$c    CLOSE%1$c%1$csection .rodata%1$c    fn: db %2$cGrace_kid.s%2$c, 0%1$c    code: db %2$c%4$s%2$c, 0", 0