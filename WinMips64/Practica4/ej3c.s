.data
a: .word 1
b: .word 3

.code
ld r2, b(r0) ; ordenar esto para 0 atascos raw
ld r1, a(r0)
loop: daddi r2, r2, -1 ; y esto 
      dsll r1, r1, 1
      bnez r2, loop
      halt
