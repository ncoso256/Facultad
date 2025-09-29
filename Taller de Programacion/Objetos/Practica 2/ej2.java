/*

2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. 

La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:

- Informe la cantidad de personas mayores de 65 años.

- Muestre la representación de la persona con menor DNI

*/
package tema2;


import PaqueteLectura.*;
public class Ejercicio2 {


    
    public static void main(String[] args) {
        
        GeneradorAleatorio.iniciar(); // inicio el generador aleatorio
        
       
        int diml = 0; // inicio la dimension logica en 0
        Persona[] personas = new Persona[15]; // hago un vector del objeto persona
        Persona personaconmenordni = new Persona(); // hago otro objeto para ver la persona con menor dni
        

        String nombre; // variables que guardan items de mi objeto
        int edad,dni; 
       
         
        edad = GeneradorAleatorio.generarInt(100); // genero aleatoriamente
        while ((edad != 0 )&& (diml < 15)){   // mientras sea distinto de 0 y la dimension logica no se pase de la fisica
            nombre = GeneradorAleatorio.generarString(10); // termino de leer mi objeto
            dni = GeneradorAleatorio.generarInt(10000000) + 1;
            
            personas[diml] = new Persona(nombre,dni,edad); // para el vector del objeto persona creo un espacio de memoria para muchas personas con los campos nombre, dni y edad 
            
            System.out.println(personas[diml].toString()); // muestro lo que contiene el vector
            
            System.out.println("---------------------- "); 
              
            diml++; // aumento la dimension logica
            edad = GeneradorAleatorio.generarInt(100); // y sigo evaluando la condicion con la edad
        }
        
        int cant = 0, min = 99999999; // inicializo variables 
        for (int i = 0; i < diml; i++){ // recorro el vector del objeto persona
            if (personas[i].getEdad() > 65) // si lo que obtengo del objeto en el campo edad es mayor a 65
                cant++; // incremento en uno
            if (personas[i].getDNI() < min){ // si lo que obtengo del objeto en el campo dni es menor al minimo 
                min = personas[i].getDNI(); // puedo mostrar solo el dni minimo...
                personaconmenordni = personas[i]; // o puedo mostrar el objeto de la persona con dni minimo. 
            }
        }
        
        System.out.println("La cantidad de personas con mayor edad que 65 años es de: "+ cant); // informo 
        
        System.out.println("---------------------- "); 
        
        System.out.println("La persona con dni es: " + personaconmenordni.toString());
        
        System.out.println("---------------------- "); 
        
        System.out.println("El menor dni es: " + min);
        
        System.out.println("---------------------- ");     
    }
    
}

