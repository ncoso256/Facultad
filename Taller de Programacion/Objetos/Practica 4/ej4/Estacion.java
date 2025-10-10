

package tema4;

public class Estacion {
    private String nom;
    private double longitud;
    private double latitud;
    
    public Estacion(String nom, double longitud, double latitud){
        this.nom = nom;
        this.longitud = longitud;
        this.latitud = latitud;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }
    
    
}
