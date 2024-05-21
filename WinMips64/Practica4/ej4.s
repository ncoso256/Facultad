      .data
tabla: .word 20,1,14,3,2,58,18,7,12,11
num: .word 7
long: .word 10
      .code
      ld r1, long(r0)
      ld r2, num(r0)
      dadd r3, r0, r0
      dadd r10, r0,r0 
loop: ld r4, tabla(r3)
      beq r4, r2, listo
      daddi r1, r1, -1
      daddi r3, r3, 8
      bnez r1, loop
      j fin
listo: daddi r10, r0, 1
fin: halt

; 4a) El programa recorre el arreglo de numeros buscando el numero 7 si lo encuentra pone un 1 en r10 si no sigue hasta encontrar uno; el resultado es que hay un 1 en r10 y queda indicado en la posicion de memoria 38 identificado desde el r3 que se va desplazando

; 4byc) sin branch target buffer tiene 71 ciclos 16 atascos raw y 8 atascos branch taken , con cpi 1.651
      ;con branch target buffer tiene 67 ciclos 16 atascos raw y 4 atascos branch taken , con cpi 1.558 
; branch target buffer es un circuito de la cpu que nos permite predecir los saltos, guarda la direccion del ultimo salto.
; si nunca se ejecuto el salto 
      ;cargar siguiente instruccion
; sino
      ; cargar instruccion de la tabla(saltar o no saltar, alto dilema)
