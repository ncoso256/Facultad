package tema3;

import PaqueteLectura.Lector;

/**
 *
 * @author noe
 */
public class main3 {


    public static void main(String[] args) {
        String nombre,bio,origen;
        String titulo,edi,isbn;
        int añoedi;
        double precio;
        
        nombre = Lector.leerString();
        bio = Lector.leerString();
        origen = Lector.leerString();
        
        titulo = Lector.leerString();
        edi = Lector.leerString();
        isbn = Lector.leerString();
        añoedi = Lector.leerInt();
        precio = Lector.leerDouble();
        
        
        Estante e= new Estante();
        Autor a = new Autor(nombre,bio,origen);
        Libro l = new Libro(titulo,edi,añoedi,a,isbn,precio);  
        
        e.agregarAlEstante(l);
        
        e.devolverLibro("Mujercitas");
        
        System.out.println(e.devolverLibro()); 
        
    }
    
}
