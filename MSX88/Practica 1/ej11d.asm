org 1000h
n1l dw 1234h
n1h dw 0abcdh
n2l dw 5678h
n2h dw 0cdefh
resl dw ?
resh dw ?

org 3000h
suma32c: mov bx, sp
add bx, 2
mov ax, [bx]
add bx, 2
mov cx, [bx]
add bx, 2
mov dx, [bx]
add bx, 2
mov bx, [bx]
add cx, ax
adc dx, bx
mov bx, sp
add bx, 10
mov ax, [bx]
add bx, 2
mov bx, [bx]
mov [bx],dx
mov bx, ax
mov [bx], cx
ret
org 2000h
mov ax, offset resh
push ax
mov ax, offset resl
push ax
mov ax, n2h
push ax
mov ax, n1h
push ax
mov ax, n2l
push ax
mov ax, n1l
push ax
call suma32c
hlt
end
