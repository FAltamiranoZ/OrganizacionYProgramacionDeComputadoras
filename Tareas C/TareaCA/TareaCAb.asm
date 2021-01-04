TITLE TareaCab

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine


.DATA
msgI    BYTE "String: ", 0
msgC    BYTE "Caracter ", 0
msgO    BYTE "o: ", 0
msgMin    BYTE " - minuscula", 0
msgMay    BYTE " - MAYUSCULA", 0
msgChar    BYTE " - Char no alfa.", 0
msgConv    BYTE "Conversion: ", 0
msgA    BYTE "ADIOS", 0
cont DWORD 0
string BYTE 31 dup(0)

.CODE
main PROC
    MOV EDX, OFFSET msgI
    CALL WriteString
    CALL Lectura
    CALL Analisis
    CALL Impresion
    MOV EDX, OFFSET msgA
    CALL WriteString
    EXIT
main ENDP

Lectura PROC
    MOV EDX, OFFSET string
    MOV ECX, 31
    CALL ReadString
    MOV ECX, EAX
Lectura ENDP

Analisis PROC
    MOV ESI, OFFSET string
    CALL CrLf
    .WHILE cont != ECX
        MOV EDX, OFFSET msgC
        CALL WriteString
        MOV EAX, cont
        INC EAX
        CALL WriteInt
        MOV cont, EAX
        MOV EDX, OFFSET msgO
        CALL WriteString
        MOV AL, [ESI]
        CALL WriteChar
        .IF AL > 64 && AL < 91 ; MAYUS
            MOV EDX, OFFSET msgMay
            CALL WriteString
            OR AL, 00100000b
            MOV [ESI], AL
        .ELSEIF AL > 96 && AL < 123 ; MINUS
            MOV EDX, OFFSET msgMin
            CALL WriteString
            AND AL, 11011111b
            MOV [ESI], AL
        .ELSE ;OTRO
            MOV EDX, OFFSET msgChar
            CALL WriteString
        .ENDIF
        INC ESI
        CALL CrLf
    .ENDW
Analisis ENDP

Impresion PROC
    MOV EDX, OFFSET msgConv
    CALL WriteString
    MOV EDX, OFFSET string
    CALL WriteString
    Call CrLf
Impresion ENDP

END main