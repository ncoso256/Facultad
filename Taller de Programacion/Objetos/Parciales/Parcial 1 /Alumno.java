/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication7;

/**
 *
 * @author noe
 */
public class Alumno {
    private String nombre;
    private int cantTareas;
    private int sumaNotas;

    public Alumno(int cantTareas,String unNombre) {
        this.nombre = unNombre;
        this.cantTareas = cantTareas;
        this.sumaNotas = 0;
    }

    public int getSumaNotas() {
        return sumaNotas;
    }

    public int getCantTareas() {
        return cantTareas;
    }

    public void setSumaNotas(int sumaNotas) {
        this.sumaNotas = sumaNotas;
    }

    public void setCantTareas(int cantTareas) {
        this.cantTareas = cantTareas;
    }

    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", cantTareas=" + cantTareas + ", sumaNotas=" + sumaNotas + '}';
    }
    
    
    
}
