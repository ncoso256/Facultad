ORG 1000H
ABCD DB "ABCD",0
ORG 3000H
LONGITUD: MOV AX, 0
LOOP: CMP BYTE PTR [BX], 0
JZ FIN
INC AX
INC BX
JMP LOOP
FIN: RET
ORG 2000H
MOV BX, OFFSET ABCD
CALL LONGITUD
HLT
END
