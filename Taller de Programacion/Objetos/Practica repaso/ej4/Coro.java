
package javaapplication6;


public abstract class Coro {
    private String nombreCoro;
    private Director d;
    
    public Coro(String nombreCoro, Director unDirector){
        this.nombreCoro = nombreCoro;
        this.d = unDirector;
    }

    
    
    public abstract void agregarCorista(Corista c);
    public abstract boolean estaLleno();
    public abstract boolean estaFormado();
   
    
    
    public String toString(){
        String aux;
        aux = this.nombreCoro + this.d.toString();
        return aux;
    } 
}
