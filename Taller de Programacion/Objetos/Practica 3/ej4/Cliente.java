package tema3;


public class Cliente {
    private String nombre;
    private int DNI;
    private int edad; 
    
    public Cliente(String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
    }
    
    public Cliente(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int unDNI) {
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "El nombre del cliente es " + nombre + ", su DNI es " + DNI + " y tiene " + edad + " años.";
        return aux;
    }
    
}
