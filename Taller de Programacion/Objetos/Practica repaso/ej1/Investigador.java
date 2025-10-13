
package practicarepaso1;

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
    
    @Override
    public String toString(){
        String aux;
        aux = "Nombre investigador: "+ this.nombre +"  "+ " Categoria:  " +this.categoria +"  "+ " Especialidad: "+ this.especialidad+"  "+ " Monto Total:  " +this.obtenerMontoTotal();
        return aux;
    }
}

