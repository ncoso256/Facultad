package tema3;

/**
 *
 * @author noe
 */
public class Hotel {
    private int N; 
    private Cliente[] clientes = null;
    private Habitacion hab; 

    
    public Hotel(int N) {
        this.N = N;
    }
    
    public Cliente[] ingresarCliente(Cliente c,boolean ocupa, int x){
        if (clientes[x] == null && !ocupa)
            clientes[x] = c;
        return clientes;
    }
    
    
    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }

    public Cliente[] getHabitaciones() {
        return clientes;
    }

    public void setHabitaciones(Cliente[] clientes) {
        this.clientes = clientes;
    }

    @Override
    public String toString() {
        int i = 0;
        String aux;
        aux = "Habitación: " + i +  "  " + "costo: " + hab.getCostopornoche() + "  " + " libre u ocupada: " + hab.isestaOkupa();
        if (clientes != null)
            aux += "info del cliente: " + this.clientes;
        return aux;
    }
}
