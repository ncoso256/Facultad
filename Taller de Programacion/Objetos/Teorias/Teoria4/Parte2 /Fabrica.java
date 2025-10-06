
package videostaller4;


public class Fabrica {
    private String nombre;
    private String localidad;

    public Fabrica(String nombre, String localidad) {
        this.nombre = nombre;
        this.localidad = localidad;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    @Override
    public String toString() {
        return  "nombre: " + getNombre();
    }
    
    
}
