TITLE Examen Final

;calcule la suma de los n salarios.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine

.DATA
cadenasreal4 BYTE "1-10000010-11000000000000000000000", 0
             BYTE "0-10000011-01110000000000000000000", 0
             BYTE "1-10000010-11100000000000000000000", 0
             BYTE "0-10000011-10000000000000000000000", 0
varisreal4 REAL4 0.0, 0.0, 0.0, 0.0
N	SDWORD 4	; Total de strings
cont1 SDWORD 0 ; contador externo
cont2 SDWORD 0 ; contador interno
T	SDWORD ?	; Tamanho de cada string
msgInicio BYTE "Soy: 168114RCG",0
msgL BYTE "Longitud de cada string: ",0
msgLS BYTE "Lista de strings: ",0
msgS BYTE "String ",0
msgS2 BYTE ": ",0
msgBye BYTE "ADIOS",0

.CODE
main PROC
    mov EDX, OFFSET msgInicio
    call WriteString
    call CrLf
	
	;ASCII de '0' = 30h , ASCII de '1' = 31h

	mov T, LENGTHOF cadenasreal4 ; determinamos el tamano del string 
    .REPEAT
		.REPEAT
		shl [varisreal4+(T*cont1)],1
		.IF [cadenasreal4+(cont2*4)] == 31h
			inc [varisreal4+(T*cont1)]
		.ELSE
			.IF[cadenasreal4+(cont2*4)] == 30h
				
			.ELSE
				shr [varisreal4+(T*cont1)],1
			.ENDIF
		.ENDIF
		inc cont2
		.UNTIL cont2 == T
		mov cont2, 0
		inc cont1
	.UNTIL cont1 == N
	
	call CrLf
    mov EDX, OFFSET msgBye
    call WriteString

    EXIT
    
main ENDP

END main