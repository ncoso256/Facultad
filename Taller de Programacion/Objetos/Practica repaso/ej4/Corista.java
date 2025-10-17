
package javaapplication6;

public class Corista extends Persona{

    private int tono;

    public Corista(String nombre, int dni,int edad, int tono) {
        super(nombre,dni,edad);
        this.tono = tono;
    }
    
    public int getTono() {
        return tono;
    }

    @Override
    public String toString() {
        return super.toString() + tono;
    }

    
    
}
