; me di cuenta que en el vonsim tenia una configuracion de la memoria en vacia y lo cambie a aleatorio, me surgio un error que lo corregi

HAND_DATO    EQU 40H
HAND_ESTADO  EQU 41H

ORG 1000H
MENSAJE DB ?


ORG 2000H
; Configuro el Handshake para el polling
IN AL, HAND_ESTADO ; Tomo estado actual
AND AL, 07FH ; 7FH = 01111111
OUT HAND_ESTADO, AL ; Estado = 0xxxxxxx


; Recorremos el mensaje y lo enviamos caracter
; a caracter hacia la impresora
MOV BX, OFFSET MENSAJE ; Para recorrer el mensaje
MOV CL, 5
POLL: IN AL, HAND_ESTADO ; Tomo el estado actual
    AND AL, 1 ; Chequeo el primer bit
    JNZ POLL ; Mientras sea 1 sigo en el loop
    INT 6 ; Tomo el caracter
    MOV AL, [BX]
    DEC CL
    OUT HAND_DATO, AL ; Lo envio al registro de datos
    INC BX ; Avanzo a la siguiente posicion
    CMP CL, 0; Chequeo si llegue al final
    JNZ POLL
LOOP: DEC BX 
    MOV AL, [BX]
    OUT HAND_DATO, AL
    CMP BX, 1000H ; SI NO ES IGUAL A LA ANTERIOR POS DE MEMORIA DE MSJ
    JNZ LOOP
INT 0
END
