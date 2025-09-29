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
import PaqueteLectura.*;
public class Ejercicio4 {


    public static void main(String[] args) {
        int[][] oficinas = new int[8][4]; // declaro mi matriz
        int piso; 
        int nrooficina;
        int i,j; // indices matriz
        
        // leo el piso y el nro de oficina
       
        System.out.println("Ingrese el numero de piso correspondiente(cuando quiera dejar de leer aprete el 9): ");
        piso = Lector.leerInt(); 
        
        // con un while preguntando si es distinto de 9 y filtro la matriz entre mi variable piso y nro oficina
        
        while (piso != 9){
            System.out.println("Ingrese el numero de oficina correspondiente: ");
            nrooficina = Lector.leerInt(); 
            if ((piso >= 1 && piso <= 8) &&(nrooficina >= 1 && nrooficina <=4)){  // las dobles condiciones en java se hacen en una sola condicion.. no como en pascal 
                oficinas[piso-1][nrooficina-1] += 1; // incremento la cantidad de personas filtrando la informacion por piso y oficina 
            }
                
            // vuelvo a leer la informacion para seguir iterando
            System.out.println("Ingrese el numero de piso correspondiente(cuando quiera dejar de leer aprete el 9): ");
            piso = Lector.leerInt(); 
        }
        
        for (i = 0; i < 8; i++){ // imprimo la informacion del edificio...
            System.out.println("---------------------------");
            for (j = 0; j < 4; j++)
                System.out.print(" ( " + i + " , " + j + " ) " + oficinas[i][j] + " | ");
        }
    }
    
}

