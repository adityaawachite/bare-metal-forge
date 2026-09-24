
; Simple Assembly Program: Take a character input and show it back
; Assembler: MASM/TASM (16-bit DOS)
.model small
.stack 100h
.data
    msg db 'Enter a character: $'        ; Message asking user for input
    outmsg db 0Dh,0Ah,'You entered: $'   ; Message to show before output
.code
main proc
    mov ax, @data
    mov ds, ax          ; Load data segment (standard setup)
    ; Step 1: Ask the user to type a character
    mov ah, 9           ; Function to print a string
    lea dx, msg         ; Load address of "Enter a character"
    int 21h             ; Call DOS interrupt to display it
    ; Step 2: Wait for the user to press a key
    mov ah, 1           ; Function to take single character input
    int 21h             ; Call DOS interrupt
    mov bl, al          ; Save the typed character in BL register
    ; Step 3: Print a newline and the "You entered:" message
    mov ah, 9
    lea dx, outmsg
    int 21h
    ; Step 4: Show the actual character the user typed
    mov dl, bl          ; Put saved character in DL
    mov ah, 2           ; Function to print one character
    int 21h
    ; Step 5: Exit the program gracefully
    mov ah, 4Ch
    int 21h
main endp
end main