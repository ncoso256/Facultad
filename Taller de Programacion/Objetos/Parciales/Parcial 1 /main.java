
package javaapplication7;

import PaqueteLectura.GeneradorAleatorio;


public class JavaApplication7 {

    public static void main(String[] args) {
       CursoBasico cb = new CursoBasico(2,"Java", 4, "11/12/2005");
       CursoAvanzado ca = new CursoAvanzado("HTML", 3,"programacion", 450, "08/10/2005");
       
       Alumno a1 = new Alumno(3,"Noé");
       cb.inscribirAlumno(a1);
       
       Alumno a2 = new Alumno(4,"Gonza");
       cb.inscribirAlumno(a2);
       
       ca.inscribirAlumno(a2);
       ca.inscribirAlumno(a1);
       
       cb.actualizarRendimiento("Carlos", GeneradorAleatorio.generarInt(10)+1);
       ca.actualizarRendimiento("Noé", 8);
       
        System.out.println(cb.toString());
        System.out.println(ca.toString());
    }
    
}
