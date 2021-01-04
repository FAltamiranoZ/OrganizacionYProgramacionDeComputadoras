TITLE TareaCA

;calcule la suma de los n salarios.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine

.DATA

n DWORD ?
fila byte 7
columna byte 13

msg1 BYTE "Ingrese el dato n: ",0
msg2 BYTE "Ingrese el ",0
msgsalario BYTE " salario: ",0
msgres BYTE "Resultado: ",0
adios BYTE "ADIOS.",0

resalario DWORD ?
dir DWORD ?
suma DWORD ?
num DWORD ?

numDato DWORD ?
dirP DWORD ?

.CODE
main PROC
    ;Para empezar en la columna y fila que se piden
    mov DL, columna
    mov DH, fila
    call Gotoxy ;GotoXY positions the cursor at (X,Y)
    inc fila

    ;Pregunta n
    mov EDX, OFFSET msg1
    call WriteString
    call ReadInt
    mov n, EAX
    call CrlF

    ;Pregunta n veces por los salarios
    push n
    call Salarios
    pop suma

    mov DL, columna
    mov DH, fila
    call Gotoxy
    inc fila

    mov EDX, OFFSET msgres
    call WriteString
    mov EAX, suma
    call WriteInt
    call crlf

    mov DL, columna
    mov DH, fila
    call Gotoxy
    inc fila

    mov EDX, OFFSET adios
    call WriteString

    EXIT
main ENDP

Salarios PROC
  ;Pedido de los n salarios y suma
    pop dir
    pop num
    mov EBX,1
    mov ECX,0

    .WHILE EBX <= n
        push EBX
        call Possal ;llama a "Possal" cada vez

        call ReadInt
        mov resalario, EAX

        ADD ECX, resalario
        INC EBX

        call Crlf

    .ENDW

    push ECX
    push dir

    RET
Salarios ENDP


Possal PROC
    pop dirP
    mov DL, columna
    mov DH, fila
    call Gotoxy

    pop numDato
    mov EDX, OFFSET msg2
    call WriteString
    mov EAX, numDato
    call WriteInt

    mov EDX, OFFSET msgsalario
    call WriteString

    inc fila

    push dirP
    RET
Possal ENDP

END main
