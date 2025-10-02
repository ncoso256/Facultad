/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package videostaller3;

/**
 *
 * @author noe
 */
public class Libro {
    private String titulo;
    private String primerAutor;
    private String editorial;
    private int añoEdicion;
    private String ISBN;
    private double precio;
    
    public void hacerUno(int y){
        y++;
    }
    
    public String getTitulo(){
        return titulo;
    }

    public void setTitulo(String unTitulo){
        titulo = unTitulo;
    }
    
    public double getPrecio(){
        return precio;
    }
    
    public void setPrecio(double unPrecio){
        precio = unPrecio;
    }
    
    public void hacerDos(Libro l){
        l.setTitulo("otro");
    }
    
    public void hacerTres(Libro l){
        l = new Libro();
        l.setTitulo("otro");
    }
    
    public String toString(){
        String aux = titulo + " por " + primerAutor + " - " + añoEdicion + " - ISBN" + ISBN;
        return aux;
    }
}
