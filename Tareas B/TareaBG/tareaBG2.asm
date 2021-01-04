INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
Svector WORD 2002h, 4004h, 6006h, 8008h
Cvector SWORD -2, -4, -6, -8
suma BYTE "Suma: ", 0
prod BYTE "Producto: ",0
adios BYTE "ADIOS",0

.CODE
main PROC

    movzx EAX, Svector+6
    movzx EBX, Cvector+6
    ADD EAX, EBX
    mov EDX, OFFSET suma
    call WriteString
    call WriteInt
    call CrLF

    movzx EAX, Svector+4
    movzx EBX, Cvector+4
    imul EBX
    mov EDX, OFFSET prod
    call WriteString
    call WriteInt
    call CrLF

    mov EDX, OFFSET adios
    call WriteString 

    exit
    

main ENDP

END main