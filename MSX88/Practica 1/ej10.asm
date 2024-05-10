org 1000h
num1 dw 5
num2 dw 3
org 3000h
swap: push ax
push bx
push cx
push dx
mov bx, sp

; dir num1
add bx, 12
mov ax, [bx]

; dir num2
sub bx, 2
mov cx, [bx]

;tomar valor num1
mov bx, ax
mov ax,[bx]
mov dx, bx

; tomar valor num2
mov bx, cx
mov cx, [bx]

; insertar valor de num1 a dir num2
mov [bx], ax

; insertar valor de num2 a dir num1
mov bx, dx
mov [bx], cx

pop dx
pop cx
pop bx
pop ax
ret
org 2000h
mov ax, offset num1
push ax
mov ax, offset num2
push ax
call swap
hlt
end
