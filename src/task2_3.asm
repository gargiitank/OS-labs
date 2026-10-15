
%include "asm_io.inc"

segment .data
    start_prompt db "Enter start of range (1-100): ", 0
    end_prompt db "Enter end of range (1-100): ", 0
    result_msg db "Sum of selected range: ", 0
    error_msg db "Error: invalid range.", 0

segment .bss
    numbers resd 100
    start_num resd 1
    end_num resd 1

segment .text
    global asm_main

asm_main:
    pusha

    ; Initialise array with values 1 to 100
    mov ecx, 100
    mov esi, 0
    mov eax, 1

fill_array:
    mov [numbers + esi*4], eax
    inc eax
    inc esi
    loop fill_array

    ; Ask for start of range
    mov eax, start_prompt
    call print_string
    call read_int
    mov [start_num], eax

    ; Ask for end of range
    mov eax, end_prompt
    call print_string
    call read_int
    mov [end_num], eax

    ; Validate range
    mov eax, [start_num]
    cmp eax, 1
    jl invalid_range

    mov ebx, [end_num]
    cmp ebx, 100
    jg invalid_range

    cmp eax, ebx
    jg invalid_range

    ; Convert start value to zero-based index
    mov esi, eax
    dec esi

    ; Calculate number of elements
    mov ecx, ebx
    sub ecx, eax
    inc ecx

    ; Initialise running total
    mov ebx, 0

sum_range:
    add ebx, [numbers + esi*4]
    inc esi
    loop sum_range

    ; Print result
    mov eax, result_msg
    call print_string

    mov eax, ebx
    call print_int
    call print_nl

    jmp finished

invalid_range:
    mov eax, error_msg
    call print_string
    call print_nl

finished:
    popa
    mov eax, 0
    ret
