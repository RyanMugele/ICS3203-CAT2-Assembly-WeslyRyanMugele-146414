section .data
    prompt db "Enter a number: ", 0
    positive_msg db "POSITIVE", 0
    negative_msg db "NEGATIVE", 0
    zero_msg db "ZERO", 0

section .bss
    num resb 1

section .text
    global _start

_start:
    ; Prompt user for input
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, len prompt
    int 0x80

    ; Read input
    ; Store the number in 'num' for classification

    ; Conditional logic
    cmp byte [num], 0
    je is_zero
    jl is_negative
    jmp is_positive

is_zero:
    ; Output "ZERO"
    ; Exit

is_negative:
    ; Output "NEGATIVE"
    ; Exit

is_positive:
    ; Output "POSITIVE"
    ; Exit
