
%include "asm_io.inc"

segment .data
    name_prompt db "Enter your name: ", 0
    number_prompt db "How many welcomes? ", 0
    welcome_msg db "Welcome, ", 0
    error_msg db "Error: number must be between 50 and 100.", 0

segment .bss
    name resb 100
    count resd 1

segment .text
    global asm_main

asm_main:
    pusha

    ; Ask for name
    mov eax, name_prompt
    call print_string

    ; Read name one character at a time
    mov edi, name
    mov esi, 99

read_name:
    call read_char

    ; Check if Enter was pressed
    cmp al, 10
    je name_done

    ; Store character
    mov [edi], al
    inc edi
    dec esi

    ; Stop if buffer is full
    cmp esi, 0
    jg read_name

name_done:
    ; Add null terminator
    mov byte [edi], 0

    ; Ask for number
    mov eax, number_prompt
    call print_string

    call read_int
    mov [count], eax

    ; Validate number
    cmp eax, 50
    jle invalid_input

    cmp eax, 100
    jge invalid_input

    ; Set loop counter
    mov esi, [count]

welcome_loop:
    mov eax, welcome_msg
    call print_string

    mov eax, name
    call print_string

    call print_nl

    dec esi
    cmp esi, 0
    jg welcome_loop

    jmp finished

invalid_input:
    mov eax, error_msg
    call print_string
    call print_nl

finished:
    popa
    mov eax, 0
    ret
