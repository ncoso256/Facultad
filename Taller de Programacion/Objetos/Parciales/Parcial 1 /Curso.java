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
public abstract class Curso {
   private String nombre;
   private int costo;
   private String comienzo;
   private int M;
   private Alumno[] alumnos;
   
    public Curso(int M,String unNombre, int unCosto,String unComienzo) {
        this.nombre = unNombre;
        this.costo = unCosto;
        this.comienzo = unComienzo;
        this.M = 0;
        this.alumnos = new Alumno[this.M];
    }
   
    public int inscribirAlumno(Alumno a){
        this.alumnos[this.M] = a;
        this.M++;
        return this.M;
    }
   
    public Alumno devolverAlumno(int a){
        if (this.alumnos != null)
            return this.alumnos[a];
        return null;
    }

    public Alumno[] getAlumnos() {
        return alumnos;
    }

    public int getM() {
        return M;
    }
    
    public void actualizarRendimiento(String nombre, int x){
        int i;
        int suma;
        for (i = 0; i < this.M; i++){
            if (this.nombre.equals(nombre)){
                suma = alumnos[i].getSumaNotas();
                alumnos[i].setSumaNotas(suma + x);
                alumnos[i].setCantTareas(+1);
            }
        }
        
    }
    

    
   public abstract Alumno  mejorDesempeño(); 
    
   @Override
    public String toString(){
        String aux;
        aux = this.nombre + this.costo + this.comienzo;
        int i;
        for (i = 0; i < this.M; i++){
            aux+= this.alumnos[i].toString(); 
        }
        aux += this.mejorDesempeño();
        return aux;
    }
}
