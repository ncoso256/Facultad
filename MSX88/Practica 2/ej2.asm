ORG 1000h
ASCII DW 1
FIN DB ?
ORG 2000H
LOOP: MOV BX, OFFSET ASCII
MOV AX, OFFSET FIN - OFFSET ASCII
INT 7
INC ASCII
CMP ASCII, 256
JNZ LOOP
INT 0
END
