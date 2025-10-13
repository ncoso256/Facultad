/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicarepaso1;

/**
 *
 * @author Usuario
 */
public class Subsidio {
    private double monto;
    private String motivo;
    private boolean otorgado = false;
    
    public Subsidio(double unMonto, String unMotivo){
        this.monto = unMonto;
        this.motivo = unMotivo;
    }

    public double getMonto() {
        return monto;
    }

    public boolean isOtorgado() {
        return otorgado;
    }

    public void setOtorgado(boolean otorgado) {
        this.otorgado = otorgado;
    }
    
}

