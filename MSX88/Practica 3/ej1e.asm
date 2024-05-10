pb equ 31h
cb equ 33h
org 1000h
cero db "0"
org 2000h
mov bx, offset cero
mov cl, [bx]
sub cl, cero
reinicio: mov al, 1
jmp mandar
loop: cmp cl, 0
jz mandar
rotar: add al, al
dec cl
mandar: out pb,al
cmp cl, 7
jz rotar
inc cl
cmp al, 0
jz reinicio
jmp loop
hlt
end
