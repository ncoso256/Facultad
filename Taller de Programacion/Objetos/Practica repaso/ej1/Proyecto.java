
package practicarepaso1;


public class Proyecto {
    private String nombre;
    private int codigo;
    private String nomdirector;
    private Investigador[] investigadores = new Investigador[50];
    private int dl;
    
    public Proyecto(String unNombre, int unCodigo, String unNomDirector){
        this.nombre = unNombre;
        this.codigo = unCodigo;
        this.nomdirector = unNomDirector;
        this.dl = 0;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if (this.dl < 50){
            investigadores[this.dl] = unInvestigador;
            this.dl++;
        }
    }
    
    public double dineroTotalOtorgado(){
       
        double suma = 0;
        double dinerotot;
        for (int i = 0; i < this.dl; i++){
            dinerotot = investigadores[i].obtenerMontoTotal();
            suma += dinerotot;
        }
        return suma;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = "Nombre: " + this.nombre + "  " + "Codigo: " +this.codigo + "  " + " Nombre director:  "+this.nomdirector+ "  " + "Dinero total otorgado proyecto: " + this.dineroTotalOtorgado();
        for (int i = 0; i < this.dl; i++)
            aux += " \n "+ this.investigadores[i].toString() + "\n";
        return aux;
    }
}

