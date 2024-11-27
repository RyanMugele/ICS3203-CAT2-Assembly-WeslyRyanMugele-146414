section .data
    arr db 5, 3, 8, 1, 9
    size equ 5

section .text
    global _start

_start:
    mov esi, arr
    mov edi, arr + size - 1

reverse:
    cmp esi, edi
    jge done
    ; Swap values at esi and edi
    mov al, [esi]
    mov bl, [edi]
    mov [esi], bl
    mov [edi], al
    ; Increment and decrement pointers
    inc esi
    dec edi
    jmp reverse

done:
    ; Print the array
    ; Exit
