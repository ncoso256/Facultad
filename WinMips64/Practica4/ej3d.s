.data
cant: .word 2
a: .word 1,2
b: .word 0

.code
dadd r1, r0, r0
ld r2, cant(r0)
loop: ld r3, a(r1)
      daddi r2, r2, -1 
      dsll r3, r3, 1
      sd r3, b(r1)
      daddi r1, r1, 8
      bnez r2, loop
      halt
