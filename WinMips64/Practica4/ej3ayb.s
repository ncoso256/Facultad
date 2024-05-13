.data
a: .word 1
b: .word 3

.code
ld r1, a(r0)
ld r2, b(r0)
loop: dsll r1, r1, 1
      daddi r2, r2, -1
      bnez r2, loop
      halt


; a) 
; los atascos raw se producen cuando una instruccion necesita leer un dato que todavia no esta disponible, se atasca el pipeline y se alarga la etapa id
; branch taken stalls es una penalizacion por saltos que es de tipo condicional y la direccion de destino se debe determinar lo mas pronto posible, dentro del cauce, para reducir la penalizacion.
; este programa tiene 21 ciclos, 12 instrucciones y 1750 ciclos por instruccion


; b) 
; las instrucciones que generan un dato que lee otra posterior, se producen en la id los raw y en la if los branch taken stalls; en el ciclo 4 esta el 1er raw, en el ciclo 7 y 2 instrucciones ocurre el 2do raw, en el 8 ciclo el 3ero, en el 9no ciclo y 4 instrucciones ocurre un atasco branch taken,en el ciclo 13 el 4to raw, en el ciclo 14 el 5to raw, en el ciclo 15 y 7 instrucciones el 2do branch taken, en el ciclo 19 el 6to raw y en el ciclo 20 el septimo raw.
; en el septimo ciclo y 3 instrucciones ocurre un branch taken, con forwarding, nos ahorramos en este caso 1 instruccion y 2 ciclos, el forwarding se antepone, seria mas eficiente y en el otro caso de branch taken con forwarding nos ahorra 3 ciclos y una instruccion
; tiene 25 ciclos el programa sin forwarding 12 instrucciones eso igual y 2083 (cpi) numeros mayores tanto como el de los ciclos y cpi sin forwarding
