/*

 * To change this license header, choose License Headers in Project Properties.

 * To change this template file, choose Tools | Templates

 * and open the template in the editor.

 */

package javaapplication5;



/**

 *

 * @author noe

 */

public class Cliente {

    private int dni;

    private String nombre;

    private int telefono;

    private String localidad;

    private boolean seguro;



    public Cliente(int dni, String nombre, int telefono, String localidad, boolean seguro) {

        this.dni = dni;

        this.nombre = nombre;

        this.telefono = telefono;

        this.localidad = localidad;

        this.seguro = seguro;

    }



    public int getDni() {

        return dni;

    }



    public void setDni(int dni) {

        this.dni = dni;

    }



    public String getNombre() {

        return nombre;

    }



    public void setNombre(String nombre) {

        this.nombre = nombre;

    }



    public int getTelefono() {

        return telefono;

    }



    public void setTelefono(int telefono) {

        this.telefono = telefono;

    }



    public String getLocalidad() {

        return localidad;

    }



    public void setLocalidad(String localidad) {

        this.localidad = localidad;

    }



    public boolean isSeguro() {

        return seguro;

    }



    public void setSeguro(boolean seguro) {

        this.seguro = seguro;

    }



    @Override

    public String toString() {
        String aux;
        aux = "dni: " + dni + ""
                + "Nombre: " + nombre+""
                + "Telefono: " + telefono + ""
                + "Localidad: " + localidad +""
                + "Seguro: " + seguro;
        return aux;
    }

    

    

}
