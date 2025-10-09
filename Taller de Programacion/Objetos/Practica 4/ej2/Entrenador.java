/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Usuario
 */
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
    
    
}
