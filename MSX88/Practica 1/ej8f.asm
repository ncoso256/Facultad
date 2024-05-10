org 1000h
original db 'a', 0
reemplazo db 'b'
org 3000h
reemplazar_car: mov cx, 0
mov bx, sp
add bx, 2
mov dx, [bx]
add bx, 2
mov ax, [bx]
mov original, dl
mov reemplazo, al
ret
org 2000h
mov bh, 0
mov ah, 0
mov al, original
mov bl, reemplazo
push ax
push bx
call reemplazar_car
pop bx
pop ax
hlt
end
