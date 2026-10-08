
%include "asm_io.inc"

segment .bss
    numbers resd 100     ; Reserve 100 integers
    total resd 1         ; Space for the sum

segment .text
    global asm_main

asm_main:
    pusha

    ; Initialise the array with 1 to 100
    mov ecx, 100         ; Number of elements
    mov esi, 0           ; Array index
    mov eax, 1           ; Starting value

fill_array:
    mov [numbers + esi*4], eax
    inc eax
    inc esi
    loop fill_array

    ; Sum all 100 elements
    mov ecx, 100
    mov esi, 0
    mov ebx, 0           ; Running total

sum_array:
    add ebx, [numbers + esi*4]
    inc esi
    loop sum_array

    ; Store and print the result
    mov [total], ebx
    mov eax, [total]
    call print_int
    call print_nl

    popa
    mov eax, 0
    ret
