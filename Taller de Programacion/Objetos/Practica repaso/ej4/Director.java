
package javaapplication6;


public class Director extends Persona {

    private int antiguedad;

    public Director(String nombre, int dni, int edad, int antiguedad) {
        super(nombre,dni,edad);
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return super.toString() + antiguedad;
    }
    
    
}
