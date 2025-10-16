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
public class CursoBasico extends Curso{

    public CursoBasico(int M, String unNombre, int unCosto, String unComienzo) {
        super(M, unNombre, unCosto, unComienzo);
    }
    
    
    
    public Alumno mejorDesempeño(){
        int max = -1;
        int i;
        Alumno alu = null;
        for (i = 0; i < super.getM() ; i++){    
            if (super.getAlumnos()[i].getCantTareas() > max){
                max = super.getAlumnos()[i].getCantTareas();
                alu = super.getAlumnos()[i];
            }
        }
        return alu;
    }


    
    
}




