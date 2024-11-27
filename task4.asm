section .data
    sensor_value db 8
    motor_status db 0
    alarm_status db 0

section .text
    global _start

_start:
    ; Read sensor value
    mov al, [sensor_value]
    cmp al, 10
    ja alarm
    cmp al, 5
    ja motor_on
    jmp motor_off

motor_on:
    mov byte [motor_status], 1
    jmp end

motor_off:
    mov byte [motor_status], 0
    jmp end

alarm:
    mov byte [alarm_status], 1

end:
    ; Exit
