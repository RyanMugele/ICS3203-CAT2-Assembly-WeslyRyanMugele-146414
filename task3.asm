section .data
    input db 5                            ; Input number for factorial
    result resb 1                         ; Storage for the factorial result

section .text
    global _start

_start:
    ; Load the input into AL
    mov al, [input]                       ; Load input into AL
    call factorial                        ; Call factorial subroutine
    mov [result], al                      ; Store result in memory

    ; Exit program
    mov eax, 1                            ; System call for exit
    mov ebx, 0                            ; Exit status 0
    int 0x80

factorial:
    ; Save registers to stack
    push ebx                              ; Save EBX
    push ecx                              ; Save ECX

    cmp al, 1                             ; Check if AL <= 1
    je done                               ; If yes, return

    dec al                                ; Decrement AL
    call factorial                        ; Recursive call to factorial
    mul byte [input]                      ; Multiply AL by input

done:
    ; Restore registers from stack
    pop ecx                               ; Restore ECX
    pop ebx                               ; Restore EBX
    ret                                   ; Return from subroutine
