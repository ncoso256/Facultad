/*

3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.

a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.

Una vez finalizada la inscripción:

b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals.


*/
package tema2;
import PaqueteLectura.*;

public class P2Ej3main {


    public static void main(String args[]) {
        Persona [] [] tabla = new Persona [5][8];
        int dimF=40;
        int dimL=0;
        int i,j, x;
        int[] v = new int[5];
        for (x=0; x<5; x++)
            v[x] =0; 
        String nombre; int edad; int dni;
        nombre = GeneradorAleatorio.generarString(3);
        i=0;
        while (!nombre.equals("zzz")  && i< 5) {
            
            j = 0;
            while(!nombre.equals("zzz")  && j< 8){
                edad= GeneradorAleatorio.generarInt(100);
                dni = GeneradorAleatorio.generarInt(10);
                //int dia = dimL / 8;   // filas 
                //int turno = dimL % 8; // columnas  

                // en el caso de ser pos null vector contador entero 
                v[i]++;
                tabla [i][j]=  new Persona (nombre,dni,edad);
                j++;
                nombre = GeneradorAleatorio.generarString(3);
            }
            dimL++;  
            i++;
            nombre = GeneradorAleatorio.generarString(3);
        }
  
        
      
        i=0;
        while (i < dimL){
            j=0;
            while (j < v[i]){
                System.out.println(tabla[i][j].toString());
                j++;
            }
            i++;
        }
        
     }}
