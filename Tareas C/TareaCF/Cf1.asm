TITLE Segundo examen

; Display <=N strings.

; Irvine Library procedures and functions
INCLUDE \masm32\Irvine\Irvine32.inc
INCLUDELIB \masm32\Irvine\Irvine32.lib
INCLUDELIB \masm32\Irvine\User32.lib
INCLUDELIB \masm32\Irvine\Kernel32.lib
; End Irvine


.DATA
ra real8 2.0
sb real8 3.0
tc real8 -2.0
ud real8 10.0
ve real8 15.0
msg byte "El resultado es: ", 0
msgA byte "ADIOS", 0
res real8 0.0

.CODE
main PROC

    fld ra
    fld sb
    fadd
    fld tc
    fdiv
    fld ud
    fmul
    fld ra
    fsub
    fld ve
    fadd
    mov edx, offset msg
    call writeString
    call writefloat
    fstp res
    call crlf
    call showfpustack
    call crlf
    mov edx, offset msga
    call writeString
    
    
    


    EXIT
main ENDP

END main