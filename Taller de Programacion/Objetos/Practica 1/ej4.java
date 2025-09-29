/*

4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). 
Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. 
Para esto, simule la llegada de personas al edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. 
La llegada de personas finaliza al indicar un nro. de piso 9. 
Al finalizar la llegada de personas, informe lo pedido.

*/
package ejercicio4;

/**
 *
 * @author noe
 */
import PaqueteLectura.Lector;
public class Ejercicio4 {


    public static void main(String[] args) {
        int[][] oficinas = new int[8][4]; // declaro mi matriz
        int piso; 
        int nrooficina;
        int i,j; // indices matriz
        
        // leo el piso y el nro de oficina
       
        System.out.println("Ingrese el numero de piso correspondiente(cuando quiera dejar de leer aprete el 9): ");
        piso = Lector.leerInt(); 
        System.out.println("Ingrese el numero de oficina correspondiente: ");
        nrooficina = Lector.leerInt();
        
        for (i = 0; i < 8 ; i++) // inicializo mi matriz en 0
            for (j = 0; j < 4; j++)
                oficinas[i][j] = 0;
        
        // con dos while preguntando si es distinto de 9 recorro la matriz y filtro entre mi variable piso y nro oficina
        
        while (piso != 9 && piso < 8){
            while (piso != 9 && nrooficina < 4){
                if (piso >= 1 && piso <= 8){  // las dobles condiciones en java se hacen en una sola condicion.. no como en pascal 
                    if (nrooficina >= 1 && nrooficina <=4)
                        oficinas[piso-1][nrooficina-1] += 1; // incremento la cantidad de personas filtrando la informacion por piso y oficina 
                }

                System.out.println("Ingrese el nro de piso correspondiente(cuando quiera dejar de leer aprete el 9): ");
                piso = Lector.leerInt();   
                System.out.println("Ingrese el numero de oficina correspondiente: ");
                nrooficina = Lector.leerInt(); 
                
                // vuelvo a leer la informacion para seguir iterando
            }
        }
        
        for (i = 0; i < 8; i++){ // imprimo la informacion del edificio...
            System.out.println("---------------------------");
            for (j = 0; j < 4; j++)
                System.out.print(" ( " + i + " , " + j + " ) " + oficinas[i][j] + " | ");
        }
    }
    
}
