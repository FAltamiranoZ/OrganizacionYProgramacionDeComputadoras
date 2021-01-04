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
m SDWORD ?
cont SDWORD 0
ans SDWORD 0
msgN BYTE "Ingrese N:", 0
msgM BYTE "Ingrese M:", 0
msgError BYTE "Los operandos son invalidos (uno o ambos son menor a cero)", 0
msgRes BYTE "El restulado es: ", 0

.CODE
main PROC
    mov EDX, OFFSET msgN
    call WriteString
    call CrLf
    call ReadInt
    mov n, EAX

    mov EDX, OFFSET msgM
    call WriteString
    call CrLf
    call ReadInt
    mov m, EAX

    .IF m > 0 && n > 0
        mov EAX , m
        .IF EAX > n
            mov EBX , n
            mov m , EBX
            mov n , EAX
        .ENDIF
	
        mov EBX, m
        .REPEAT
            mov EAX, n
            add ans,EAX
            inc cont
        .UNTIL cont == EBX

	mov edx, OFFSET msgRes
	mov eax, ans
	call WriteInt
	call CrLf

    .ELSE
	mov edx, OFFSET msgError
	mov eax, n
	call WriteInt
	call CrLf
	mov eax, m
	call WriteInt
	call CrLf
	
    .ENDIF
    main ENDP
END main	
