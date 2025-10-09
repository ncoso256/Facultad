
package tema4;


public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado(String unNombre, double unSueldo, int unaAntiguedad){
        setNombre(unNombre);
        setSueldo(unSueldo);
        setAntiguedad(unaAntiguedad);
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    // public abstract int calculara(); usar insert code...
    
    public double calcularSueldoACobrar(){
        
        return getSueldo()*((getAntiguedad()* 10 )/ 100);
    }
    
    public String toString(){
        String aux;  
        aux = this.nombre + this.sueldo + this.calcularEfectividad();
        return aux;
    }
}

