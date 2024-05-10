org 1000h
bits db 01101011b
org 3000h
rotarizq: add ah, ah
adc ah, 0
ret
org 2000h
mov ah, bits
call rotarizq
call rotarizq
hlt
end
