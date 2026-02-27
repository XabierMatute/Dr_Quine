section .text
    global main
    extern printf
    extern snprintf
    extern dprintf
    extern open
    extern close
    extern system

main:
    push rbp
    mov rbp, rsp
    sub rsp, 64

    mov rax, [rel i]
    cmp rax, 0
    jl .negative

.positive:
    mov rax, [rel i]
    dec rax

    lea rdi, [rsp]
    mov rsi, 64
    lea rdx, [rel filename]
    mov rcx, rax
    xor eax, eax
    call snprintf

    lea rdi, [rsp]
    mov rsi, 0x241
    mov rdx, 0644o
    xor eax, eax
    call open

    mov [rel fd], rax

    mov rdi, [rel fd]
    lea rsi, [rel code]
    mov rdx, [rel i]
    mov rcx, 10
    dec rdx
    mov r8,  34
    lea r9,  [rel code]
    xor eax, eax
    call dprintf

    mov rdi, [rel fd]
    call close

    mov  rax, [rel i]
    dec  rax
    lea  rdi, [rsp]
    mov  rsi, 64
    lea  rdx, [rel cmd_nasm]
    mov  rcx, rax
    mov  r8,  rax
    xor  eax, eax
    call snprintf

    lea  rdi, [rsp]
    call system

    mov  rax, [rel i]
    dec  rax
    lea  rdi, [rsp]
    mov  rsi, 64
    lea  rdx, [rel cmd_cc]
    mov  rcx, rax
    mov  r8,  rax
    xor  eax, eax
    call snprintf

    lea  rdi, [rsp]
    call system

    mov  rax, [rel i]
    dec  rax
    lea  rdi, [rsp]
    mov  rsi, 64
    lea  rdx, [rel cmd_run]
    mov  rcx, rax
    xor  eax, eax
    call snprintf

    lea  rdi, [rsp]
    call system

    jmp .done

.negative:
    jmp .done

.done:
    xor eax, eax
    add rsp, 64
    pop rbp
    ret
    

section .data
    fd:           dq 0

section .rodata
    i:            dq 5
    code: db "section .text%2$c    global main%2$c    extern printf%2$c    extern snprintf%2$c    extern dprintf%2$c    extern open%2$c    extern close%2$c    extern system%2$c%2$cmain:%2$c    push rbp%2$c    mov rbp, rsp%2$c    sub rsp, 64%2$c%2$c    mov rax, [rel i]%2$c    cmp rax, 0%2$c    jl .negative%2$c%2$c.positive:%2$c    mov rax, [rel i]%2$c    dec rax%2$c%2$c    lea rdi, [rsp]%2$c    mov rsi, 64%2$c    lea rdx, [rel filename]%2$c    mov rcx, rax%2$c    xor eax, eax%2$c    call snprintf%2$c%2$c    lea rdi, [rsp]%2$c    mov rsi, 0x241%2$c    mov rdx, 0644o%2$c    xor eax, eax%2$c    call open%2$c%2$c    mov [rel fd], rax%2$c%2$c    mov rdi, [rel fd]%2$c    lea rsi, [rel code]%2$c    mov rdx, [rel i]%2$c    mov rcx, 10%2$c    dec rdx%2$c    mov r8,  34%2$c    lea r9,  [rel code]%2$c    xor eax, eax%2$c    call dprintf%2$c%2$c    mov rdi, [rel fd]%2$c    call close%2$c%2$c    mov  rax, [rel i]%2$c    dec  rax%2$c    lea  rdi, [rsp]%2$c    mov  rsi, 64%2$c    lea  rdx, [rel cmd_nasm]%2$c    mov  rcx, rax%2$c    mov  r8,  rax%2$c    xor  eax, eax%2$c    call snprintf%2$c%2$c    lea  rdi, [rsp]%2$c    call system%2$c%2$c    mov  rax, [rel i]%2$c    dec  rax%2$c    lea  rdi, [rsp]%2$c    mov  rsi, 64%2$c    lea  rdx, [rel cmd_cc]%2$c    mov  rcx, rax%2$c    mov  r8,  rax%2$c    xor  eax, eax%2$c    call snprintf%2$c%2$c    lea  rdi, [rsp]%2$c    call system%2$c%2$c    mov  rax, [rel i]%2$c    dec  rax%2$c    lea  rdi, [rsp]%2$c    mov  rsi, 64%2$c    lea  rdx, [rel cmd_run]%2$c    mov  rcx, rax%2$c    xor  eax, eax%2$c    call snprintf%2$c%2$c    lea  rdi, [rsp]%2$c    call system%2$c%2$c    jmp .done%2$c%2$c.negative:%2$c    jmp .done%2$c%2$c.done:%2$c    xor eax, eax%2$c    add rsp, 64%2$c    pop rbp%2$c    ret%2$c    %2$c%2$csection .data%2$c    fd:           dq 0%2$c%2$csection .rodata%2$c    i:            dq %1$d%2$c    code: db %3$c%4$s%3$c, 0%2$c    filename: db %3$cSully_%%i.s%3$c, 0%2$c    cmd_nasm: db %3$cnasm -f elf64 Sully_%%d.s -o Sully_%%d.o%3$c, 0%2$c    cmd_cc:   db %3$cgcc Sully_%%d.o -o Sully_%%d -no-pie%3$c, 0%2$c    cmd_run:  db %3$c./Sully_%%d%3$c, 0", 0
    filename: db "Sully_%i.s", 0
    cmd_nasm: db "nasm -f elf64 Sully_%d.s -o Sully_%d.o", 0
    cmd_cc:   db "gcc Sully_%d.o -o Sully_%d -no-pie", 0
    cmd_run:  db "./Sully_%d", 0