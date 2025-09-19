/*
1- Analice el programa Ej01Tabla2.java, que carga un vector que representa la
tabla del 2. 
Luego escriba las instrucciones necesarias para:
- generar enteros aleatorios hasta obtener el número 11. Para cada número
muestre el resultado de multiplicarlo por 2 (accediendo al vector).
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;
public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        int DF=11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        System.out.println("2x" + "5" + "="+ tabla2[5]);
        
        GeneradorAleatorio.iniciar(); // inicio el Generador Aleatorio
        int random; 
        for (random = GeneradorAleatorio.generarInt(DF+1); random != 11; random = GeneradorAleatorio.generarInt(DF+1)) // en vez de hacer un while hago un for con el generador de aleatorios
            System.out.println("2x" + random + "="+  tabla2[random]); // a cada valor multiplicado por 2 le asigno como indice de mi vector el valor random
        System.out.println("Se genero el valor: " + random);

    }
    
}

