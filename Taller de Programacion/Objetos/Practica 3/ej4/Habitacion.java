
package tema3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author noe
 */
public class Habitacion {
    private double costopornoche = GeneradorAleatorio.generarDouble(8000-2000+1) + 2000;
    private boolean estaOkupa;
    private Cliente cli;

    public Habitacion(boolean ok,Cliente cli){
        this.cli = cli;
        this.estaOkupa = ok;
    }

    
    public double aumentarMonto(double unMonto){
        return this.getCostopornoche() + unMonto;
    }
    
    public double getCostopornoche() {
        return costopornoche;
    }

    public void setCostopornoche(double costopornoche) {
        this.costopornoche = costopornoche;
    }

    public boolean isestaOkupa() {
        return estaOkupa;
    }

    public void setOk(boolean ok) {
        this.estaOkupa = ok;
    }

    public Cliente getCli() {
        return cli;
    }

    public void setCli(Cliente cli) {
        this.cli = cli;
    }

    
    @Override
    public String toString() {
        return "Habitacion{" + "costopornoche=" + costopornoche + ", esta ocupada =" + estaOkupa + ", cli=" + cli + '}';
    }
    
    
    
}
