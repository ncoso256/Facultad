.data
a: .word 1
b: .word 2

.code
ld r1, a(r0)
ld r2, b(r0)
sd r2, a(r0)  
sd r1, b(r0)  
halt

;- con fordwarding no presenta ningun atasco porque predice que no se superponga el 1 con el 2 o al reves
;- el color verde de la ventana register indica si se esta colocando algo en un espacio de los registros en este caso  1 en r1 y 2 en r2
;- mejora el promedio con 1800 (cpi) ciclos por instruccion 
