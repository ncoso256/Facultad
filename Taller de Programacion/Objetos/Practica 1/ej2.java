
/*
2- Escriba un programa que lea las alturas de los 15 jugadores de un equipo de
básquet y las almacene en un vector. Luego informe:
- la altura promedio
- la cantidad de jugadores con altura por encima del promedio
NOTA: Dispone de un esqueleto para este programa en Ej02Jugadores.java
*/

package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        //Paso 2: Declarar la variable vector de double 
        double[] vector;
        
        //Paso 3: Crear el vector para 15 double 
        vector = new double[15]; // vector de numeros reales del 0 al 14 
        
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
        double altura;
        
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for (i = 0; i < 15; i++){
            System.out.println("Lea una altura: ");
            altura = Lector.leerDouble();
            vector[i] = altura; 
        }
            
        //Paso 7: Calcular el promedio de alturas, informarlo
        double suma = 0,prom = 0;
        for (i = 0 ; i < 15; i++)
            suma = suma + vector[i];
        prom = suma / 15;
        System.out.println("El promedio de alturas es: " + prom);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int cantalturasencimaprom = 0;
        for (i = 0 ; i<15; i++)
            if (vector[i] > prom)
                cantalturasencimaprom++;
               
        //Paso 9: Informar la cantidad.
        System.out.println("Hay: " + cantalturasencimaprom + "cantidades de alturas que estan por encima del promedio");
    }
    
}
