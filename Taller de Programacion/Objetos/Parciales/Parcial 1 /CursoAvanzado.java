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
public class CursoAvanzado extends Curso{
    private String descripcion;

    public CursoAvanzado(String descripcion, int M, String unNombre, int unCosto, String unComienzo) {
        super(M, unNombre, unCosto, unComienzo);
        this.descripcion = descripcion;
    }

    
    
    public Alumno mejorDesempeño(){
        double max = -1;
        int i;
        Alumno alu = null;
        double promedio = 0;
        for (i = 0; i < super.getM(); i++){
            promedio = super.getAlumnos()[i].getSumaNotas() / super.getAlumnos()[i].getCantTareas();
            if (promedio > max){
                max = promedio;
                alu = super.getAlumnos()[i];
            }
        }
        return alu;
    }
}

