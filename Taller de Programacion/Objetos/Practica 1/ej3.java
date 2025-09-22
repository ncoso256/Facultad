/*

3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Leer un valor entero e indicar si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java

 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
// importar el lector de datos
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	    //Paso 2. iniciar el generador aleatorio     
		GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int [][] tabla = new int [5][5];
        int i,j;
        for (i = 0; i< 5 ; i++)
            for (j = 0; j < 5; j++)
                tabla[i][j] = GeneradorAleatorio.generarInt(31);
        
        
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i = 0; i < 5; i++){
            System.out.println("-----------------------------");
            for (j = 0; j< 5; j++)
                System.out.print(" ( "+ i + " , " + j + " ) " + tabla[i][j] + " | ");
            
        }
        System.out.println("-----------------------------");    
        
        
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int sumafila = 0; // inicializo la variable suma fila en 0
        
        for (j = 0; j < 5 ;j++) // recorro el vector en la fila 1 
           sumafila += tabla[0][j]; // sumo la tabla en i = 0 y voy incrementando j
        System.out.println("La suma de los elementos de la fila 1 es de: " + sumafila);  // imprimo 
        System.out.println("-----------------------------"); 
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        int[] vector = new int[5]; // declaro vector
        
        for (i = 0; i< 5; i++)
            vector[i] = 0;
     
        for (i = 0; i < 5; i++){
            for (j = 0; j<5 ; j++)
                vector[i]+= tabla[j][i]; // hay que invertir el indice para sacar columnas en caso de guardar en un vector  
            System.out.println("La suma de la columna " + i +" es: " + vector[i]);
            System.out.println("-----------------------------"); 
        }   
         
        
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        
        System.out.println("Ingrese un numero entero: ");
        
        int num = Lector.leerInt();
        
        for (i = 0; i < 5 ; i++){ // recorro la matriz 
            for (j = 0; j< 5 ; j++)
                if (tabla[i][j] == num) // si el numero de la tabla es igual al numero que ingrese
                    System.out.println(" ( "+ i + " , " + j + " ) "); // mostra la posicion 
                else
                    System.out.println("No se encontro el elemento"); // sino mostra que el elemento en esa iteracion no se encontro en las 25 iteraciones no se si es necesario..

        }
    }
}
