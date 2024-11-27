section .data
    arr db 5, 3, 8, 1, 9                  ; Original array
    size equ 5                            ; Array size

section .text
    global _start

_start:
    mov esi, arr                          ; Pointer to start of the array
    mov edi, arr + size - 1               ; Pointer to end of the array

reverse:
    cmp esi, edi                          ; Check if pointers meet or cross
    jge done                              ; Exit loop if reversed

    ; Swap values at esi and edi
    mov al, [esi]                         ; Load value from esi
    mov bl, [edi]                         ; Load value from edi
    mov [esi], bl                         ; Store value from edi to esi
    mov [edi], al                         ; Store value from esi to edi

    inc esi                               ; Increment start pointer
    dec edi                               ; Decrement end pointer
    jmp reverse                           ; Repeat the loop

done:
    ; Exit program
    mov eax, 1                            ; System call for exit
    mov ebx, 0                            ; Exit status 0
    int 0x80
