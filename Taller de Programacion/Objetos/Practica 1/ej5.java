/*

5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: 
(0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.

Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto.

*/

package ejercicio5;

/**
 *
 * @author noe
*/
import PaqueteLectura.Lector;
public class Ejercicio5 {

    public static void main(String[] args) {
        int clientes = 5; // dimf
        int aspectos = 4; // dimf
        int calificacion; 
        int i,j; // indices 
        double[][] calificacionesxaspecto = new double[clientes][aspectos]; // nada mas pongo en double las calificaciones para calcular el promedio
        
        double suma = 0 , promedio = 0; // variables para el promedio
        
        System.out.println("Lea la calificacion del cliente: ");
        calificacion = Lector.leerInt(); // leo una calificacion
        for (i = 0; i < 5; i++){  // recorro la matriz
            for (j = 0; j < 4; j++){ 
                if (calificacion >= 1 && calificacion <= 10){ // leo calificaciones solo entre el 1 y 10
                    calificacionesxaspecto[i][j] = calificacion; // pongo la calificacion a la matriz
                    suma += calificacionesxaspecto[i][j]; // sumo para el promedio
                }
                System.out.println("Lea la calificacion del cliente: ");
                calificacion = Lector.leerInt(); // leo hasta que termine la ejecucion del for 
            }
        }
        for (i = 0; i < 5; i++){ // imprimo la matriz
            System.out.println("--------------------------");
            for (j= 0; j < 4; j++)
                System.out.print(" ( " + i + " , " + j + " ) " + calificacionesxaspecto[i][j] + " | ");
        } 
        promedio = suma / (clientes * aspectos);  // hago el promedio clientes*aspectos = 20 
        System.out.println("La suma de mi matriz es de: " + suma);  // imprimo suma  
        System.out.println("El promedio de mi matriz es de: " + promedio); // imprimo promedio
    }
    
}
