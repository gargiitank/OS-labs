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

    ; Asking for user's name
    mov eax, name_prompt
    call print_string

    mov eax, name
    mov ebx, 100
    call read_char

    ; Check count > 50
    cmp eax, 50
    jle invalid_input

    ; Check count < 100
    cmp eax, 100
    jge invalid_input

    ; set up loop counter 
    mov esi, [count]

welcome_loop: 
    ; printing "Welcome, "
    mov eax, welcome_msg
    call print_string

    ;printing user's name
    mov eax, name
    call print_string

    call print_nl 

    ; decreasing counter by 1
    dec esi

    ;repeating while counter > 0
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

