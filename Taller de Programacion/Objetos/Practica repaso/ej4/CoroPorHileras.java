
package javaapplication6;


public class CoroPorHileras extends Coro{
    private Corista[][] coristas;
    private int hileras;
    private int integrantesPorHilera;
    private int coristasAgregados;
    
    
    public CoroPorHileras(String nombre, Director director, int hileras, int integrantesPorHilera){
        super(nombre,director);
        this.hileras = integrantesPorHilera;
        this.coristas = new Corista[hileras][integrantesPorHilera];
        this.coristasAgregados = 0;
    }
    @Override
    public void agregarCorista(Corista c){
        if (!estaLleno()){
            int fila = coristasAgregados / integrantesPorHilera;
            int columna = coristasAgregados % integrantesPorHilera;
            this.coristas[fila][columna] = c;
            coristasAgregados++;
        }
    }
    
    @Override
    public boolean estaLleno(){
        return this.coristasAgregados == (this.hileras * this.integrantesPorHilera);
    }
    
    public boolean estaFormado(){
        if (!estaLleno()){
            return false;
        }
        
        for (int i = 0; i < this.hileras; i++){
            int primerTono = this.coristas[i][0].getTono();
            for (int j = 1; j < this.integrantesPorHilera; j++){
                if (this.coristas[i][j].getTono()!= primerTono){
                    return false;
                }
            }
        }
        
        for (int i = 0; i < this.hileras-1; i++){
            if (this.coristas[i][0].getTono() < this.coristas[i+1][0].getTono()){
                return false;
            }
        }
        return true;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = super.toString();
        for (int i = 0; i < this.hileras; i++){
            for (int j = 0; j < this.integrantesPorHilera; j++){
                if (this.coristas[i][j]!= null){
                    aux += i+1;
                    aux += this.coristas[i][j].toString();
                }
            }
        }
        return aux;
    }
}
