ORG 1000H
NUM1 DW 5
NUM2 DW 3
RES DW ?
ORG 3000H
MUL: MOV CX, 0
LOOP: ADD CX, BX
DEC AX
JNZ LOOP
RET
ORG 2000H
MOV AX, NUM1
MOV BX, NUM2
CALL MUL
MOV RES, CX
HLT
END