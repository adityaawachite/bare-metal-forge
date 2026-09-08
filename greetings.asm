
section .data
    msg db 'Welcome to bare-metal-forge!', 0xa  ; The message to print, ending with a newline (0xa)
    len equ $ - msg                             ; Calculate the length of the message

section .text
    global _start                               ; Define the entry point of the program

_start:
    ; 1. Print the message to the screen (sys_write)
    mov eax, 4      ; Load 4 into EAX (System call number for sys_write)
    mov ebx, 1      ; Load 1 into EBX (File descriptor for Standard Output)
    mov ecx, msg    ; Load the memory address (pointer) of the message into ECX
    mov edx, len    ; Load the length of the message (in bytes) into EDX
    int 0x80        ; Trigger an interrupt to execute the system call via the kernel

    ; 2. Safely exit the program (sys_exit)
    mov eax, 1      ; Load 1 into EAX (System call number for sys_exit)
    mov ebx, 0      ; Load 0 into EBX (Exit code 0 indicates a successful execution)
    int 0x80        ; Trigger an interrupt to execute the system call via the kernel
