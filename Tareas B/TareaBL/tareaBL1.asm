TITLE Producto - tareaBL

;Descripcion:
; Realiza la multiplicacion de dos enteros (n,m)
; Donde n,m > 0 
; sin utilizar el operador MUL.

INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA

n SDWORD ?
tot SDWORD 00000000
ans SDWORD 00000000
msgN BYTE "Teclee el dato N:", 0
msgE BYTE "ERROR: ", 0
msgT BYTE "Termino [+", 0
msgTb BYTE "]: ", 0
msgRes BYTE "SUMA TOTAL SERIE: ", 0
msgA BUTE "ADIOS", 0

.CODE
main PROC
	
	mov EDX, OFFSET msgN
	.REPEAT
		call WriteString
		call CrLf
		call ReadInt
		mov n, EAX
		.IF n < 1
			mov EDX, OFFSET msgE
			call WriteString
			call WriteInt
			call CrLf
			mov EDX, OFFSET msgN
		.ENDIF
	.UNTIL EAX > 0

	mov EAX, 1
	
	.REPEAT
		mov EBX, ans
		ADD EBX, EAX
		mov ans, EBX
		mov EDX, 00000000
		idiv 2
		.IF EDX != 0
			neg EBX
		.ENDIF
		mov EDX, tot
		ADD EBX, EDX
		mov tot, EBX
		
		mov EDX, OFFSET msgT
		call WriteString
		call WriteInt

		mov EDX, OFFSET msgTb
		call WriteString	

		mov EDX, EAX
		mov EAX, EBX
		call WriteInt

		mov EAX,EDX	
		
		inc EAX
	.UNTIL EAX > n


	mov EDX, OFFSET msgRes
	call WriteString
	mov EAX, tot
	call WriteInt
	call CrLf
	mov EDX, OFFSET msgA
	call WriteString
	

main ENDP

END main

	