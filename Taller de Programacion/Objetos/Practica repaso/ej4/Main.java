
package javaapplication6;

import PaqueteLectura.Lector;


public class JavaApplication6 {

    public static void main(String[] args) {
        Director d = new Director("Gustavo",123456,42,20);
        
        String nombrecs= Lector.leerString();
        int cantCoristasCs = Lector.leerInt();
        
        CoroSemicircular cs = new CoroSemicircular(nombrecs,d,cantCoristasCs);
        
        for (int i = 0; i < cantCoristasCs; i++){
            System.out.println(i+1);
            String nombre = Lector.leerString();
            int dni = Lector.leerInt();
            int edad = Lector.leerInt();
            int tono = Lector.leerInt();
            cs.agregarCorista(new Corista(nombre,dni,edad,tono));
            
        }
        
        String nombrech = Lector.leerString();
        int filas = Lector.leerInt();
        int columnas = Lector.leerInt();
        
        CoroPorHileras ch = new CoroPorHileras(nombrech,d,filas,columnas);
        
        for (int  i = 0; i < (filas * columnas); i++){
            String nombre = Lector.leerString();
            int dni = Lector.leerInt();
            int edad = Lector.leerInt();
            int tono = Lector.leerInt();
            ch.agregarCorista(new Corista(nombre,dni,edad,tono));
            
        }
        
        System.out.println(cs.toString());
        if (cs.estaFormado()){
            System.out.println("esta bien formado");
        }
        else{
            System.out.println("no esta bien formado");
        }
        
        System.out.println(ch.toString());
        if (ch.estaFormado())
            System.out.println("esta bien formado");
        else
            System.out.println("no esta bien formado");
        
        
        
    }
}
