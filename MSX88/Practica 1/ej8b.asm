ORG 1000H
MIN DB "aBcDE1#!",0
RES DW ?
ORG 3000H
CONTAR_MIN: MOV CX, 0
LOOP: CMP BYTE PTR [BX], 0
JZ FIN
CMP BYTE PTR [BX], 'a'
JS NOMIN
CMP BYTE PTR [BX], 'z'
JNS NOMIN
INC CX
NOMIN: INC BX
JMP LOOP
FIN: RET
ORG 2000H
MOV BX, OFFSET MIN
CALL CONTAR_MIN
MOV RES, CX
HLT
END
