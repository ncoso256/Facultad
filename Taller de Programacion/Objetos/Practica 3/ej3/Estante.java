/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.

Implemente un constructor que permita iniciar el estante sin libros. 
Provea métodos para:

(i) devolver la cantidad de libros que almacenados 

(ii) devolver si el estante está lleno

(iii) agregar un libro al estante 

(iv) devolver el libro con un título particular que se recibe.

B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.

C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante?




*/

package tema3;

/**
 *
 * @author noe
 */
public class Estante {
    
    private Libro[] libros;
    private int dimL;

    public Estante() {
        this.libros= new Libro[20];
        dimL = 0;
    }

    
    public boolean estaLleno(){
        if (dimL == 20) 
            return true;
        return false;
        
    }
    
    public void agregarAlEstante(Libro unLibro){
        
        if (!this.estaLleno()){
            libros[dimL] = unLibro;
            System.out.println("Libro agregado exitosamente");
            dimL++;}
        else
            System.out.println("El estante esta lleno");
    }
    
    public int encontrar(String titulo){
        int i = 0;
        while ((i < dimL) && (!libros[i].getTitulo().equals(titulo))){
              i++;}
        if (libros[i].getTitulo().equals(titulo))
            return i;
        else 
            return -1;  
    }
    
    public Libro devolverLibro(String unTitulo){
        int buscar = encontrar(unTitulo);
        if ( buscar> -1)
            return libros[buscar];
        else 
                return null;
    }
}

