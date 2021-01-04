TITLE Factorial - tareaBL

;Descripcion:
; Saca el factorial de un entero n

INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib


.DATA
n SDWORD ?
cont SDWORD 1
ans SDWORD 1
msgN BYTE "Ingrese N:", 0
msgError BYTE "Operando invalido", 0
msgRes BYTE "El restulado es: ", 0

.CODE
main PROC
    mov EDX, OFFSET msgN
    call WriteString
    call CrLf
    call ReadInt
    mov n, EAX

    .IF n > 0
        mov EBX, n
        .IF n > 1
            mov eax, ans
            .REPEAT
                inc cont
                mul cont
            .UNTIL cont == EBX

            mov ans, eax
        .ENDIF

        mov edx, OFFSET msgRes
        mov eax, ans
        call WriteInt
        call CrLf

    .ELSE
        mov edx, OFFSET msgError

    .ENDIF

    main ENDP

END main
        