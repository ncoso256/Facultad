/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;


public class DemoFiguras {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Cuadrado cuad = new Cuadrado(10,"Rojo", "Negro");
        System.out.println("Color linea: " + cuad.getColorLinea()); 
        System.out.println("Area: " + cuad.calcularArea()); 
        System.out.println("Representacion del cuadrado: " + cuad.toString()); 
       
        Triangulo t = new Triangulo(3,2,1,"Rojo","Verde");
        System.out.println(t.toString());
        t.despintar();
        System.out.println(t.toString());
        
        Circulo c = new Circulo(2,"Naranja","Azul");
        System.out.println(c.toString());
        c.despintar();
        System.out.println(c.toString());
        
    }
    
    
    
}

