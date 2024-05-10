org 1000h
bits db 01101011b
org 3000h
rotarizq: add ah, ah
adc ah, 0
ret
org 4000h
rotarizq_n: cmp bh, 0
jz fin
call rotarizq
dec bh
jmp rotarizq_n
fin: ret
org 2000h
mov ah, bits
mov bh, 2
call rotarizq_n
hlt
end
