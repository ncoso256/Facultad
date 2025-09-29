/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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
        System.out.println(p.getNombre());
        
        System.out.println(p.toString());
        
        
        
    }
    
}

