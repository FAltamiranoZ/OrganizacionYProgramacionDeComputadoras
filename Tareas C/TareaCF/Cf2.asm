TITLE Segundo examen

; Display <=N strings.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine


.DATA

direccion dword ?
contador dword 1
n dword ?
factor dword ?
msg1 byte "Introduzca el factor, debe de ser un entero entre 0 y 9: ", 0
msg2 byte "Introduzca el tamaño de la lista, debe de ser un entero entre 1 y 10: ", 0
msg3 byte "Introduzca el valor #", 0
msg4 byte "El menor número es: ", 0
msg42 byte " y su índice es: ", 0
msg5 byte "El valor #", 0
msg52 byte " es: ", 0
msg6 byte "ADIOS", 0
arrLista Real8 ?

.CODE
main PROC
    finit
    mov edx, offset msg1
    call writeString
    call readInt
    mov factor, eax
    call crlf
    mov edx, offset msg2
    call writeString
    call readInt
    mov n, eax
    call crlf
    push n
    push offset arrLista
    call leerLista
    push n
    push offset factor
    push offset arrLista
    call facLista
    push n
    push offset arrLista
    call menorLista
    push n
    push offset arrLista
    call imprime
    call showfpustack
    call crlf
    mov edx, offset msg6
    call writeString

    EXIT
main ENDP

leerLista proc
    pop direccion
    pop esi ;direccion arrLista
    pop ebx ;n
    mov eax, contador
    .while ebx > 0
        mov edx, offset msg3
        call writeString
        call writeint
        call crlf
        call readfloat
        fstp real8 ptr [esi]
        add esi, 8
        dec ebx
        inc eax
    .endw
    push direccion
    ret
    
leerLista endp


facLista proc

    pop direccion
    pop esi ;direccion arrLista
    pop edi ;direccion factor
    pop ebx ;n 
    .while ebx > 0
        fld real8 ptr [esi]
        fimul dword ptr [edi]
        fstp real8 ptr [esi]
        add esi, 8
        dec ebx
    .endw
    push direccion
    ret

facLista endp


menorLista proc

    pop direccion
    pop esi ;direccion arrLista
    pop ebx ;n
    mov edx, 1; indice
    mov ecx, contador 
    mov eax, 0
    fld real8 ptr [esi]
    dec ebx
    .while ebx > 0
        add esi, 8
        inc ecx
        fld real8 ptr [esi]
        fcomp
        fnstsw ax
        sahf
	ja fin
            fstp st(0)
            fld real8 ptr [esi]
            mov edx, ecx
fin:
        dec ebx
    .endw
    mov eax, edx
    mov edx, offset msg4
    call writeString
    call writeFloat
    fstp st(0)
    mov edx, offset msg42
    call writeString
    call writeInt 
    call crlf
    push direccion
    ret

menorLista endp


imprime proc

    pop direccion
    pop esi ;direccion arrLista
    pop ebx ;n
    mov eax, contador
    .while ebx > 0
        mov edx, offset msg5
        call writeString
        call writeint
        mov edx, offset msg52
        call writeString
        fld real8 ptr [esi]
        call writeFloat
        call crlf
        fstp st(0)
        add esi, 8
        dec ebx
        inc eax
    .endw
    push direccion
    ret

imprime endp


END main