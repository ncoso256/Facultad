
package tema4;

/**
 *
 * @author Usuario
 */
public class Circulo extends Figura{
    private double radio;
    
    public Circulo(double unRadio, String colorR, String colorL){
        super(colorR,colorL);
        setRadio(unRadio);
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    public double calcularPerimetro(){
        double perimetro;
        perimetro = 2 * Math.PI * getRadio();
        return perimetro;
    }
    
    public double calcularArea(){
        double area;
        area = Math.PI * (getRadio()* getRadio());
        return area;
    }
    
    
    public void despintar(){
        super.setColorLinea("Negra");
        super.setColorRelleno("Blanco");
    }
    
    public String toString(){
        String aux = super.toString() + "Radio : " + getRadio();
        return aux;
    }
}
