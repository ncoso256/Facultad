package tema3;

import PaqueteLectura.Lector;


/**
 *
 * @author noe
 */
public class Main4 {

    public static void main(String[] args) {
        
        int cantHabitaciones;
        cantHabitaciones = Lector.leerInt();
        Hotel h = new Hotel(cantHabitaciones);
        
        
        String nombre;
        int dni,edad; 

        
        boolean ocupado;

        
        int i,x;
        double monto;
        for (i = 0; i < h.getN(); i++){
            
            x = Lector.leerInt();   
            nombre = Lector.leerString();
            dni = Lector.leerInt();
            edad = Lector.leerInt();
            Cliente c = new Cliente(nombre,dni,edad);  
            
            ocupado = Lector.leerBoolean();
            Habitacion hab = new Habitacion(ocupado,c);
            
            h.ingresarCliente(c,hab.isestaOkupa(), x);
            
            monto = Lector.leerDouble();
            System.out.println(hab.aumentarMonto(monto));
            
            System.out.println(h.toString());
        }
            
    }
    
}
