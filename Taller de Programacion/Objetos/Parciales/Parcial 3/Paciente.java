/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication7;

/**
 *
 * @author Usuario
 */
public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private double costo;
    
    public Paciente(String nombre,boolean obraSocial, double costo){
        this.nombre = nombre;
        this.obraSocial = obraSocial;
        this.costo = costo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }
    
    public boolean nombreIgual(String nombre){
        boolean encontre = false;
        if (nombre.equals(this.getNombre())){
            encontre = true;
        }
        return encontre;
    }
}
