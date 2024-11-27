section .data
    input db 5 ; Example input
    result resb 1

section .text
    global _start

_start:
    ; Call factorial subroutine
    mov al, [input]
    call factorial
    mov [result], al
    ; Exit

factorial:
    ; Preserve registers
    push ebx
    push ecx
    cmp al, 1
    je done
    dec al
    call factorial
    mul byte [input]
done:
    ; Restore registers
    pop ecx
    pop ebx
    ret
