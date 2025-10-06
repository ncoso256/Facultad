package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author noe
 */
public class main5 {


    public static void main(String[] args) {
        double radio;
        String colorR,colorL;
        radio = Lector.leerDouble();
        colorR = Lector.leerString();
        colorL = Lector.leerString();
        Circulo c = new Circulo(radio,colorR,colorL);
        
        System.out.println(c.calcularPerimetro());
        
        System.out.println(c.calcularArea());
    }
    
}
