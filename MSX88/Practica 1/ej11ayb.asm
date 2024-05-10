org 1000h
dividendo dw 7h
divisor dw 2
cociente dw ?
resto dw ?
org 3000h
dividir: push cx
push dx
mov cx, 0
loop: cmp ax, bx
js fin
sub ax, bx
inc cx
jmp loop
fin: pop bx
mov [bx], ax ; resto
pop bx
mov [bx], cx ; cociente
ret
org 2000h
mov ax, dividendo
mov bx, divisor
mov cx, offset cociente
mov dx, offset resto
call dividir
hlt
end
