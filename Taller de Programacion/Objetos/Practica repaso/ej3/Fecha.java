
package javaapplication4;
// De cada “fecha” se conoce la ciudad y el día.
public class Fecha {
    private String ciudad;
    private int diaFecha;

    public Fecha(String ciudad, int diaFecha) {
        this.ciudad = ciudad;
        this.diaFecha = diaFecha;
    }
    
    
    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDiaFecha() {
        return diaFecha;
    }

    public void setDiaFecha(int diaFecha) {
        this.diaFecha = diaFecha;
    }
    
    
    
}
