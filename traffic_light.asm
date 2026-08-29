
section .data
    red_msg db 'RED Light - STOP', 10
    red_len equ $ - red_msg

    yellow_msg db 'YELLOW Light - GET READY', 10
    yellow_len equ $ - yellow_msg

    green_msg db 'GREEN Light - GO', 10
    green_len equ $ - green_msg

section .text
    global _start

_start:
traffic_loop:
    mov eax, 4
    mov ebx, 1
    mov ecx, red_msg
    mov edx, red_len
    int 0x80
    call delay

    mov eax, 4
    mov ebx, 1
    mov ecx, yellow_msg
    mov edx, yellow_len
    int 0x80
    call delay

    mov eax, 4
    mov ebx, 1
    mov ecx, green_msg
    mov edx, green_len
    int 0x80
    call delay

    jmp traffic_loop

delay:
    mov ecx, 0FFFFFFFh
delay_loop:
    dec ecx
    jnz delay_loop
    ret
