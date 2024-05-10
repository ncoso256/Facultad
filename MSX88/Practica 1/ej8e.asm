org 3000h
contar_car: mov cl, 0
mov bx, sp
add bx, 2
mov al, [bx]
add bx, 2
mov bx, [bx]
loop: mov ah, [bx]
cmp ah, 0
jz fin
cmp ah, al
jnz no_es
inc cl
no_es: inc bx
jmp loop
fin: ret
org 1000h
cadena db "abbcde!",0
caracter db 'z'
org 2000h
mov ax, offset cadena ; ax = 1000h
push ax ; 7ffe = sp
mov al, caracter ; al= 'z' = 7ah
push ax
call contar_car
pop ax
pop ax
hlt
end
