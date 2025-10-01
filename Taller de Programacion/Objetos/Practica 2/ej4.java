/*

4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:

a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos
de casting.

Una vez finalizada la inscripción:

b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado.

 */
package tema2;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author noe
 */
public class Ejercicio4 {
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar();
        
        Persona [][] tabla = new Persona[5][8];
        int dimf = 40;
        int diml  = 0;
        int i,j;
        int[] vc = new int[5];
        
        String nombre;
        int edad,dni,dia,turno;
        
        for (i = 0; i < 5; i++)
            vc[i] = 0;
        
        for (i = 0; i < 5 ; i++)
            for (j = 0; j < 8; j++)
                tabla[i][j] = null;
        
        nombre = GeneradorAleatorio.generarString(3);
        dia = GeneradorAleatorio.generarInt(5);
        turno = GeneradorAleatorio.generarInt(8);
        while (!nombre.equals("ZZZ") && diml < dimf){
            edad = GeneradorAleatorio.generarInt(100);
            dni = GeneradorAleatorio.generarInt(10);
            
            if (tabla[dia][turno] == null){ 
                tabla[dia][turno] = new Persona(nombre,dni,edad);
                vc[dia]++;
                
            }diml++;
            nombre = GeneradorAleatorio.generarString(3);
            dia = GeneradorAleatorio.generarInt(5);
            turno = GeneradorAleatorio.generarInt(8);
        }
        

        i = 0; 
        while (i < tabla.length){ // length : devuelve el tamaño de la estructura, en la matriz devuelve la fila completa  
            j = 0;
            while ( i < tabla.length && j < vc[i]){
                if (tabla[i][j] != null){
                    System.out.println("El dia " + i + " cantidad: " + vc[i]);
                    System.out.println(i+" "+ j + " " + tabla[i][j].getNombre());
                    
                }
                else{
                    System.out.println("No existe el turno en ese dia.");
                }
                j++;
            }
            i++;
                
        }
        
//        i= 0;
  //      j = 0;
    //    while (tabla[i][j] != null)
      //      if (tabla[i][j] = null)
                
                
    }
}
