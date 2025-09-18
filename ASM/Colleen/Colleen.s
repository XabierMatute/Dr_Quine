section .text
global main

main:
    mov rax, 1        ; write(
    mov rdi, 1        ;   STDOUT_FILENO,
    lea rsi, [rel msg];   msg,
    mov rdx, msglen   ;   sizeof(msg)
    syscall           ; );
    
    mov rax, 0        ; return 0
    ret

section .rodata
    msg: db "section .text", 10
         db "global main", 10, 10
         db "main:", 10
         db "    mov rax, 1        ; write(", 10
         db "    mov rdi, 1        ;   STDOUT_FILENO,", 10
         db "    lea rsi, [rel msg];   msg,", 10
         db "    mov rdx, msglen   ;   sizeof(msg)", 10
         db "    syscall           ; );", 10, 10
         db "    mov rax, 0        ; return 0", 10
         db "    ret", 10, 10
         db "section .rodata", 10

         db "    msg: db ", 34, msg, 34, ", 10", 10

         db 10, 10
         db "    msglen: equ $ - msg", 10

    msglen: equ $ - msg
