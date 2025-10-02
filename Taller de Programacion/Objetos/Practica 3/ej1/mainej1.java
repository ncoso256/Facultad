package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author noe
 */

public class MainT {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangulo t = new Triangulo(Lector.leerDouble(),Lector.leerDouble(),Lector.leerDouble(),Lector.leerString(),Lector.leerString()); 
        System.out.println(t.calcularPerimetro());
        System.out.println(t.calcularArea());
    }
    
}
