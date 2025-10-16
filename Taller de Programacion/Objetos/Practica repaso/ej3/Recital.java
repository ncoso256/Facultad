
package javaapplication4;

//  De todo recital se conoce el nombre de la banda y la lista de temas que tocarán durante el recital.

/*
b) Implemente los constructores. 
El constructor de recitales recibe el nombre de la banda y la cantidad de temas que tendrá el recital.


i. Cualquier recital debe saber responder a los mensajes:

 agregarTema que recibe el nombre de un tema y lo agrega a la lista de temas.

 actuar que imprime (por consola) para cada tema la leyenda “y ahora tocaremos…” seguido por el nombre del tema.


iv. Todo recital debe saber responder al mensaje calcularCosto teniendo en cuenta lo siguiente.
Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV y 150000 si es privado.
Las giras deben devolver 30000 por cada fecha de la misma.
*/

public abstract class Recital {
    private String nombreBanda;
    private int cantidadTemas = 0;
    private int diml = 0;
    private String[] listaTemas;
    
    public Recital(String unNombre, int cantTemas){
        this.nombreBanda = unNombre;
        this.cantidadTemas = cantTemas;
        listaTemas = new String[this.cantidadTemas];
    }
    
    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }
    
    public void agregarTema(String unNombreTema){
        if (this.diml < this.cantidadTemas){
            this.listaTemas[this.diml] = unNombreTema;
            this.diml++;
        }
    }
    
    public void actuar(){
        int i;
        for (i = 0; i < this.diml ; i++){
            System.out.println("y ahora tocaremos… " + this.listaTemas[i]);
        }
    }
    
    public abstract int calcularCosto();
}
