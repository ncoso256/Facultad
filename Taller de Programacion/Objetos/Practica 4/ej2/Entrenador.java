
package tema4;

public class Entrenador extends Empleado{
    private int cantcampeonatosganados;
    
    public Entrenador(String unNombre, double unSueldo, int unaAntiguedad, int cantidadCampGanados){
        super(unNombre,unSueldo,unaAntiguedad);
        setCantcampeonatosganados(cantidadCampGanados);
    }

    public int getCantcampeonatosganados() {
        return cantcampeonatosganados;
    }

    public void setCantcampeonatosganados(int cantcampeonatosganados) {
        this.cantcampeonatosganados = cantcampeonatosganados;
    }
    
    public double calcularEfectividad(){
        int i,suma;
        suma = 0;
        for (i = 0 ; i < super.getAntiguedad(); i++){
            suma += this.getCantcampeonatosganados();
        }
        return suma / super.getAntiguedad();
    }
    
    public double sueldoEntrenadores(){
        double sueldoentrenador = super.calcularSueldoACobrar();
        if (getCantcampeonatosganados() >= 1 && 4 <= getCantcampeonatosganados())
            sueldoentrenador += 5000;
        else
            if (getCantcampeonatosganados() >= 5 && 10 <= getCantcampeonatosganados())
                sueldoentrenador += 30000;
            else
                sueldoentrenador += 50000;
        return sueldoentrenador;
    }
    
    public String toString(){
        String aux;
        aux = super.toString() + this.cantcampeonatosganados;
        return aux;
    }
}
