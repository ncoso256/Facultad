.data
a: .word 1
b: .word 2

.code
ld r1, a(r0)
ld r2, b(r0)
sd r2, a(r0) ; esta esta generando un atasco 
sd r1, b(r0) ; esta tambien esta generando un atasco 
halt

; el tipo de atasco es RAW (Read after Write)
;el promedio de cpi es de 5000 ciclos por instruccion
