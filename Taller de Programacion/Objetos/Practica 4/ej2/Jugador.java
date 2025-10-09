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
public class Jugador extends Empleado{
    private int nropartidos;
    private int nrogoles;
    
    public Jugador(int numPartidos,int numGoles,String unNombre, double unSueldo,int unaAntiguedad){
        super(unNombre,unSueldo,unaAntiguedad);
        setNropartidos(numPartidos);
        setNrogoles(numGoles);
    }

    public int getNropartidos() {
        return nropartidos;
    }

    public void setNropartidos(int nropartidos) {
        this.nropartidos = nropartidos;
    }

    public int getNrogoles() {
        return nrogoles;
    }

    public void setNrogoles(int nrogoles) {
        this.nrogoles = nrogoles;
    }
    
    
}
