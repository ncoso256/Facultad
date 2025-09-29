/*
1- Se dispone de la clase Persona (en la carpeta tema2). Un objeto persona puede crearse
sin valores iniciales o enviando en el mensaje de creación el nombre, DNI y edad (en ese
orden). Un objeto persona responde a los siguientes mensajes:
getNombre() retorna el nombre (String) de la persona
getDNI() retorna el dni (int) de la persona
getEdad() retorna la edad (int) de la persona
setNombre(X) modifica el nombre de la persona al “String” pasado por parámetro (X)
setDNI(X) modifica el DNI de la persona al “int” pasado por parámetro (X)
setEdad(X) modifica la edad de la persona al “int” pasado por parámetro (X)
toString() retorna un String que representa al objeto. Ej: “Mi nombre es Mauro, mi
DNI es 11203737 y tengo 70 años”
Realice un programa que cree un objeto persona con datos leídos desde teclado. Luego
muestre en consola la representación de ese objeto en formato String.
 */
package tema2;

/**
 *
 * @author noe
 */
import PaqueteLectura.*;

public class ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       
        String nombre;
        int dni,edad;
        
        System.out.println("Lea un nombre");
        nombre = Lector.leerString();
        
        System.out.println("Lea un dni");
        dni = Lector.leerInt();
        
        System.out.println("Lea su edad");
        edad = Lector.leerInt();
        
        
        
        Persona p;
        p = new Persona();
        
        p.setNombre(nombre); // configuro nombre, dni y edad.
        p.setDNI(dni);
        p.setEdad(edad);
        
        System.out.println(p.getNombre());
        System.out.println(p.getDNI());
        System.out.println(p.getEdad()); // obtengo mi nombre, dni y edad.
        
        System.out.println(p.toString()); // imprimo el objeto persona. 
        
        
        
    }
    
}
