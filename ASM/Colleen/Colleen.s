section .text
    global main
    extern printf

decapush:
    push 10
    push 10
    push 10
    push 10
    push 10
    push 10
    push 10
    push 10
    push 10
    push 10
    ret

print_code:
    push rbp
    mov rbp, rsp


    
    mov rdi, s
    mov rsi, 10
    mov rdx, 10
    mov rcx, 10
    mov r8, 10
    mov r9, 10

    call decapush
    ; push 14     ;1
    ; push 20     ;1
    mov rax, 0      ; number of vector registers used

    ; mov rax, 1      ; number of vector registers used
    call printf

    add rsp, 16
    add rsp, 16
    add rsp, 16
    add rsp, 16
    add rsp, 16

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
    s db "section .text%c    global main%c    extern printf%c%cprint_code:%c    push rbp%c"
;     s db "1%c2%c%c%c%c6%c"
; section .data
;     s db "test: %d %d %d %d %d (%d) %d %d %d", 10, 0