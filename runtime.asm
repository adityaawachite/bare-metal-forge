
section .text
global _start

_start:
    rdtsc
    shl rdx,32
    or rax,rdx
    mov rbx,rax        ; save start

    ; --- your command here ---
    mov rcx,1000000
.loop: dec rcx
    jnz .loop

    rdtsc
    shl rdx,32
    or rax,rdx
    sub rax,rbx        ; runtime cycles

    mov rdi,rax        ; exit code = runtime
    mov rax,60         ; syscall: exit
    syscall