section .data
    sensor_value db 8                     ; Simulated sensor input
    motor_status db 0                     ; Motor status (0 = off, 1 = on)
    alarm_status db 0                     ; Alarm status (0 = off, 1 = on)

section .text
    global _start

_start:
    mov al, [sensor_value]                ; Load sensor value into AL

    ; Check if alarm needs to be triggered
    cmp al, 10                            ; Compare sensor value with threshold
    ja trigger_alarm                      ; If above 10, jump to trigger_alarm

    ; Check if motor needs to be turned on
    cmp al, 5                             ; Compare sensor value with motor threshold
    ja motor_on                           ; If above 5, jump to motor_on

motor_off:
    mov byte [motor_status], 0            ; Turn off motor
    jmp end

motor_on:
    mov byte [motor_status], 1            ; Turn on motor
    jmp end

trigger_alarm:
    mov byte [alarm_status], 1            ; Trigger alarm

end:
    ; Exit program
    mov eax, 1                            ; System call for exit
    mov ebx, 0                            ; Exit status 0
    int 0x80
