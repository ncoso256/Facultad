
package javaapplication7;


public class JavaApplication7 {


    public static void main(String[] args) {
       Agenda a = new Agenda();
       
       Paciente p1 = new Paciente("Juan",true,6);
       Paciente p2 = new Paciente("Pedro",false,7);
       
       a.agregarPaciente(p1,3,2);
       a.agregarPaciente(p2,2,3);
       
       a.imprimir();
       
       a.liberar(p1.getNombre());
       
       System.out.println("");
        
       System.out.println("");
       
       a.imprimir();
    }
    
}
