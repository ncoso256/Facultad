ORG 3000H
RUT: MOV BX, 3 ; ?
RET ; 7FFEH = 03H ; 3002H = 03H
ORG 2000H
CALL RUT ; ?
ADD CX, 5 ; ?
CALL RUT; ?
HLT
END

;CALL RUT: Modifica el sp dos veces de 8000h a 7ffe. Llama a la direccion 3000h a la subrutina de org 3000h
; ret: modifica el sp al reves que en el call rut y vuelve a la direccion 2000h
