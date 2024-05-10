; esta super ineficiente

org 1000h
vocal db "abcde1#!",0
res dw ?

org 3000h
esvocal: mov bh, 0
cmp bx, 'a'
jz unavocal
cmp bx, 'e'
jz unavocal
cmp bx, 'i'
jz unavocal
cmp bx, 'o'
jz unavocal
cmp bx, 'u'
jz unavocal
add cl, 00h
jmp fin
unavocal: add cx, 00ffh
fin: ret

org 2000h
mov res, 0000h
mov cx, 0
mov bx, vocal
call esvocal
mov bl, vocal+1
call esvocal
mov bl, vocal+2
call esvocal
mov bl , vocal+3
call esvocal
mov bl, vocal+4
call esvocal
mov bl, vocal+5
call esvocal
mov bl, vocal+6
call esvocal
mov bl, vocal+7
call esvocal
mov res, cx
hlt
end
