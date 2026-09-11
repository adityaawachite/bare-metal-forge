
global _start       ; 1. Hey fresher! This tells Linux where to start.
section .text       ; 2. This is the 'factory floor' for our instructions.
_start:             ; 3. Day 1 begins right here at this label!
    mov rax, 1      ; 4. rax=1 means "Hey OS, I want to write text."
    mov rdi, 1      ; 5. rdi=1 means "Print it to the screen."
    mov rsi, msg    ; 6. rsi points to our text down below.
    mov rdx, 6      ; 7. rdx=6 means "Print exactly 6 letters."
    syscall         ; 8. Ring the bell! Linux executes our request.
    mov rax, 60     ; 9. rax=60 means "Time to exit the program."
    syscall         ; 10. Ring the bell again to safely go home!
section .data       ; 11. The 'supply closet' for our variables.
msg db "Hi Dev"     ; 12. Our exact 6-letter welcome message.
