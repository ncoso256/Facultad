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
    
    private Libro[] libros = new Libro[20];

    public Estante() {
    }
    

    public int devolverLibro(){
        int i;
        int cantlibros = 0;
        for (i = 0; i < libros.length ; i++){
            if (libros[i] != null)
                cantlibros++;
        }
        return cantlibros;
          
    }
    
    public boolean estaLleno(){
        
        if (this.devolverLibro() == 20) 
            return true;
        return false;
        
    }
    
    public void agregarAlEstante(Libro unLibro){
        
        if (!this.estaLleno())
            libros[this.devolverLibro()+1] = unLibro;
        else
            System.out.println("El estante esta lleno");
    }
    
    public Libro devolverLibro(String unTitulo){
        int i = 0;
        while (!unTitulo.equals(libros[i].getTitulo())){
            i++;
        }
        return libros[i];
    }
}
