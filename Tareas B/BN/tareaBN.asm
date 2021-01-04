TITLE Producto - tareaBN

;Descripcion:
; Recibe e imprime n temperaturas dadas
; Donde 0 < n < 11

INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib

.DATA
n DWORD ?
numTemp DWORD 1
idx DWORD 0
min SDWORD 3000
msgN BYTE "Dato n: ", 0
msgE BYTE "ERROR por n<1 o n>10; ", 0
msgT BYTE "Temperatura ", 0
msgTb BYTE ": ", 0
msgA BYTE "ADIOS.", 0
msgM BYTE "Minimo de las temperaturas: ", 0
msgP BYTE ", P", 0
msgI BYTE ", I", 0
msgO BYTE "Teclee la ", 0
msgOb BYTE " temperatura: ", 0
temps SDWORD 0

.CODE
main PROC
	
	mov EDX, OFFSET msgN
	call WriteString
	call ReadInt
	mov n, EAX
	.IF (n < 1) || (n > 10)
		mov EDX, OFFSET msgE
		call WriteString
		mov EDX, OFFSET msgA
		call WriteString
	.ELSE
		.REPEAT
			mov EDX, OFFSET msgO
			call WriteString
			mov EAX, numTemp
			call WriteInt
			mov EDX, OFFSET msgOb
			call WriteString
			call ReadInt

			mov ESI, OFFSET temps
			mov EBX, idx
			ADD ESI, EBX
			mov [ESI], EAX

			.IF EAX < min
				mov min, EAX
			.ENDIF

			ADD EBX, 4 ; checar si no suma directo
			mov idx, EBX
			
			mov EAX, numTemp
			inc EAX
			mov numTemp, EAX
		.UNTIL EAX > n 
		
		mov EDX, OFFSET msgM
		call CrLf
		call WriteString
		mov EAX, min
		call WriteInt
		call CrLf
		call CrLf
		
		mov EAX, idx
		SUB EAX, 4
		mov idx, EAX

		.REPEAT

			mov EAX, numTemp
			dec EAX
			mov numTemp, EAX


			mov EDX, OFFSET msgT
			call WriteString
			call WriteInt
			mov EDX, OFFSET msgTb
			call WriteString
			mov ESI, OFFSET temps
			mov EBX, idx
			ADD ESI, EBX
			mov EAX, [ESI]
			call WriteInt

			mov EDX, 00000000
            	mov ECX, 2
			idiv ECX
			.IF EDX != 0
				mov EDX, OFFSET msgI
			.ELSE
				mov EDX, OFFSET msgP
			.ENDIF
			
			call WriteString
			call CrLf
				
			SUB EBX, 4
			mov idx, EBX

                  mov EAX, numTemp

		.UNTIL EAX == 1
		call CrLf
		call CrLf
		mov EDX, OFFSET msgA
		call WriteString


	.ENDIF

main ENDP

END main

	