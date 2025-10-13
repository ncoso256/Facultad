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
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private Subsidio[] subsidios = new Subsidio[5];
    private int diml;
    
    public Investigador(String unNombre, int unaCategoria, String unaEspecialidad){
        this.nombre = unNombre;
        this.categoria = unaCategoria;
        this.especialidad = unaEspecialidad;
        this.diml = 0;
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if (this.diml < 5){
            this.subsidios[this.diml] = unSubsidio;
            this.diml++;
        }
    }


    public double obtenerMontoTotal(){
        double montotot = 0;
        for (int i = 0; i < this.diml; i++)
            if (subsidios[i].isOtorgado())
                montotot += subsidios[i].getMonto();
        return montotot;
    }
    
    public void otorgarTodos(String nombre_completo){
        for (int i = 0; i < this.diml; i++){
            if (!this.subsidios[i].isOtorgado() && this.nombre.equals(nombre_completo)){
                this.subsidios[i].setOtorgado(true);
            }
        }
    }
    
    public String toString(){
        String aux;
        aux = this.nombre + this.categoria + this.especialidad+ this.obtenerMontoTotal();
        return aux;
    }
}

