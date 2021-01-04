TITLE Examen Final

; Display <=N strings.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine


.DATA
msgCU   BYTE "Soy: 163314JFAZ", 0
msgReal4   BYTE "Real4 ", 0
cadenasreal4 BYTE "1-10000010-11000000000000000000000", 0 ;tamaño de 35 cada una
             BYTE "0-10000011-01110000000000000000000", 0
             BYTE "1-10000010-11100000000000000000000", 0
             BYTE "0-10000011-10000000000000000000000", 0
varisreal4 REAL4 0.0, 0.0, 0.0, 0.0;varisreal4 + 31 es el bit de signo
direccion dword ?
msgADIOS BYTE "ADIOS", 0

.CODE
main PROC

    finit
    MOV EDX, OFFSET msgCU
    CALL WriteString
    CALL CrLf
    call crlf
    push offset varisreal4
    push offset cadenasreal4
    CALL conversion
    mov edx, offset msgADIOS
    call WriteString
    EXIT
main ENDP

conversion PROC

    pop direccion
    pop esi ;direccion cadenasreal4
    pop edi ;direccion varisreal4
    mov ebx, 0 ;contador
    mov eax, 0
    mov ecx, 0

    .while ebx < 4
        ;call dumpregs
        MOV EDX, OFFSET msgReal4
        CALL WriteString
        mov cl, [esi]
        .if cl == 49
            stc
            rcl eax, 1
        .else
            clc
            rcl eax, 1
        .endif
        ;call dumpregs

        add esi, 2
        mov edx, 0
        .while edx < 8
            mov cl, [esi]
            .if cl == 49
                stc
                rcl eax, 1
            .else
                clc
                rcl eax, 1
            .endif
            ;call dumpregs
            inc edx
            inc esi
        .endw

        inc esi
        mov edx, 0
        .while edx < 23
            clc
            mov cl, [esi]
            .if cl == 49
                stc
                rcl eax, 1
            .else
                clc
                rcl eax, 1
            .endif
            ;call dumpregs
            inc edx
            inc esi
        .endw
        mov [EDI], eax
        inc esi
        fld real4 ptr [edi]
        call writeFloat
        call crlf
        fstp st(0)
        add edi, 32
        inc ebx
    .endw
    push direccion
    ret

conversion ENDP

END main