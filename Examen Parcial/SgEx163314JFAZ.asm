TITLE Segundo examen

; Display <=N strings.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine


.DATA
AryStr	BYTE "on1on", ?
	BYTE "tw2tw", ?
	BYTE "th3tw", ?
	BYTE "fo4fo", ?
	BYTE "fi5fi", ?
	BYTE "si6si", ?
	BYTE "se7se", ?
	BYTE "ei8ei", ?
	BYTE "ni9ni", ?
N	SDWORD 9	; Total de strings
T	SDWORD ?	; Tamanho de cada string
msgCU   BYTE "Soy: 163314JFAZ", 0
msgL    BYTE "Longitud de cada string: ", 0
msgLis  BYTE "Lista de strings: ========", 0
msgS    BYTE "String ", 0
msgA    BYTE "ADIOS", 0
msgP    BYTE ": ", 0

.CODE
main PROC

    MOV EDX, OFFSET msgCU
    CALL WriteString
    CALL CrLf
    MOV EDX, OFFSET msgL
    CALL WriteString
    MOV EAX, LengthOf AryStr
    DEC EAX ; Para quitarle el 0
    CALL WriteInt
    CALL CrLf
    MOV EDX, OFFSET msgLis
    CALL WriteString
    CALL CrLf

    MOV EAX, 0 ;EBX funcionará como contador
    mov ECX, 0 ;ECX funcionará como bandera
    MOV ESI, OFFSET AryStr

    .WHILE EAX < N
    MOV EDX, OFFSET msgs
    CALL WriteString
    INC EAX
    CALL WriteInt
    MOV EDX, OFFSET msgP
    CALL WriteString
    .IF ECX == 1
        ADD ESI, 6
    .ELSE
        INC ECX
    .ENDIF
    MOV EDX, ESI
    CALL WriteString
    CALL CrLf
    .ENDW
    CALL CrLf
    MOV EDX, OFFSET msgA
    CALL WriteString
    

    EXIT
main ENDP

END main