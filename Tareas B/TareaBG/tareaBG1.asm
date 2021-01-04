INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
A SDWORD 7
B SDWORD ?
D SDWORD -15
R SDWORD ?
msg BYTE "Dato:", 0
msgR BYTE "El resultado R=", 0
msgRh BYTE "El resultado Rh=", 0

.CODE 
main PROC
    mov EDX, OFFSET msg
    call WriteString
    call CrLf
    call ReadInt
    mov B, EAX
    
    mov EAX, A ; mueve A
    neg EAX ; opera el negativo -A
    mov ECX, 000000009 ; mete un 9
    imul ECX ; multiplica -A*9
    mov ECX, EAX ; guarda el resultado para operar lo siguiente

    mov EAX, B ; paso B a eax para operarlo
    mov EBX, D ; paso D a un auxiliar
    mov EDX, 0 ; limpio el residuo
    idiv EBX ; B/D
    inc EAX ; +1
    neg EAX ; para no mover memoria en vez de restar se suma al negativo
    ADD EAX, ECX ; sumamos los 2 parciales
    ADD EAX, 100 ; se suma el 100 final
    call DumpRegs
    mov EDX, OFFSET msgR
    call WriteString
    call WriteInt
    call CrLf
    mov EDX, OFFSET msgRh
    call WriteString
    call WriteHex
    exit
main ENDP

END main