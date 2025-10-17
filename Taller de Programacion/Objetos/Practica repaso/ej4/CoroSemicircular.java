
package javaapplication6;


public class CoroSemicircular extends Coro {
    private int coristasAgregados;
    private Corista[] coroSemi;
    
    public CoroSemicircular(String nombre,Director director,int cantidadCoristas){
        super(nombre,director);
        this.coroSemi = new Corista[cantidadCoristas];
        this.coristasAgregados = 0;
    }
    
    @Override
    public void agregarCorista(Corista c){
        if (!estaLleno()){
            this.coroSemi[this.coristasAgregados] = c;
            this.coristasAgregados++;
        }
    }
    
    @Override
    public boolean estaLleno(){
        return this.coristasAgregados == this.coroSemi.length;
    }
    

    @Override
    public boolean estaFormado(){
        if (!estaLleno())
            return false;
        for (int i = 0; i < this.coristasAgregados-1; i++){
            if (coroSemi[i].getTono() < coroSemi[i+1].getTono()){
                return false;
            }
        }
        return true;
    }
    
    @Override
    public String toString(){
        String aux;
        aux = super.toString();
        for (int i = 0; i < this.coristasAgregados; i++){
            aux += this.coroSemi[i].toString();
        }
        return aux;
    }
}
