/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package videostaller3;

/**
 *
 * @author noe
 */
public class VideosTaller3 { // el nombre de la clase coincide con el archivo.java

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Producto p = new Producto();
        System.out.println(p.toString());
        
        if (p.esCaro(50)) // con precio2 no me paso 
            System.out.println("Te pasaste de precio");
        
        if (p.esCaro2(50)) // esCaro2 tiene acceso privado solo se pueden ejecutar metodos publicos
            System.out.println("Te pasaste de precio");
        
        Producto p2 = new Producto();
        if (p2.esCaro(20))
            System.out.println("Te pasaste de precio");
        
        Libro l1 = new Libro();
        int x = 1;
        l1.hacerUno(x);
        System.out.println(x); // imprime 1 porque es una copia x
        
        Libro l2 = new Libro();
        l2.setTitulo("Java");
        l1.hacerDos(l2);
        System.out.println(l2.getTitulo()); // imprime otro el parametro cambio
        
        l2.setTitulo("Java");
        l1.hacerTres(l2);
        System.out.println(l2.getTitulo()); // imprime java porque hacer tres hace un new de una variable de instancia en libro
        
        p2.setPrecio(200);
        if (p.esCaro(50))  
            System.out.println("Te pasaste de precio: " + p.getPrecio());
        if (p2.esCaro(20))
            System.out.println("Te pasaste de precio: " + p2.getPrecio());
        
        Producto p2 = new Producto(); // esto solo asi me tira error porque no puse los datos adentro del producto
        
        // entonces p3 
        Producto p3 = new Producto("Producto 1 ", "sin desc", 200.4);
        
        Fabrica f1 = new Fabrica("Arcor","La Plata");
    }
    
}
