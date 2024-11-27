section .data
    prompt db "Enter a number: ", 0        ; Prompt message
    positive_msg db "POSITIVE", 0         ; Message for positive numbers
    negative_msg db "NEGATIVE", 0         ; Message for negative numbers
    zero_msg db "ZERO", 0                 ; Message for zero

section .bss
    num resb 1                            ; Storage for user input

section .text
    global _start

_start:
    ; Print the prompt message
    mov eax, 4                            ; System call for write
    mov ebx, 1                            ; File descriptor (stdout)
    mov ecx, prompt                       ; Address of the prompt message
    mov edx, 16                           ; Length of the prompt message
    int 0x80                              ; Execute the system call

    ; Read user input
    mov eax, 3                            ; System call for read
    mov ebx, 0                            ; File descriptor (stdin)
    mov ecx, num                          ; Address to store input
    mov edx, 1                            ; Read one byte
    int 0x80                              ; Execute the system call

    ; Convert ASCII character to integer
    sub byte [num], 48                    ; Convert ASCII to numerical value

    ; Classify the number
    cmp byte [num], 0                     ; Compare input with 0
    je zero_case                          ; If equal, jump to zero_case
    jl negative_case                      ; If less, jump to negative_case
    jmp positive_case                     ; Otherwise, jump to positive_case

zero_case:
    ; Print "ZERO"
    mov eax, 4
    mov ebx, 1
    mov ecx, zero_msg
    mov edx, 5
    int 0x80
    jmp end

negative_case:
    ; Print "NEGATIVE"
    mov eax, 4
    mov ebx, 1
    mov ecx, negative_msg
    mov edx, 8
    int 0x80
    jmp end

positive_case:
    ; Print "POSITIVE"
    mov eax, 4
    mov ebx, 1
    mov ecx, positive_msg
    mov edx, 8
    int 0x80

end:
    ; Exit program
    mov eax, 1                            ; System call for exit
    mov ebx, 0                            ; Exit status 0
    int 0x80
