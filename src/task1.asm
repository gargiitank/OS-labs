
%include "asm_io.inc"

segment .data
    integer1 dd 15      ; first integer
    integer2 dd 6       ; second integer

segment .bss
    result resd 1       ; space for result

segment .text
    global asm_main

asm_main:
    pusha

    mov eax, [integer1] ; eax = 15
    add eax, [integer2] ; eax = 15 + 6
    mov [result], eax   ; store result
    call print_int      ; print eax

    popa
    mov eax, 0
    ret
