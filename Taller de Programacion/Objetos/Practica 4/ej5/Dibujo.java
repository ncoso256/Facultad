
package tema4;


public class Dibujo {
    private String titulo;
    private Figura[] vector;
    private int guardadas;
    private int capacidadMaxima = 10;
    
    public Dibujo(String titulo){
        this.titulo = titulo;
        this.guardadas = 0;
        this.vector = new Figura[this.capacidadMaxima];
    }
    
    public void agregar(Figura f){
        
        if (!estaLleno()){
            this.vector[this.guardadas] = f;
            this.guardadas++;
            System.out.println("La figura " + f.toString() + " se ha guardado ");
        }
    }
    
    // calcula el area del dibujo:
    //  suma de las areas de sus figuras
    public double calcularArea(){
        double suma = 0.0;
        for (int i = 0; i < this.guardadas; i++){
            suma += this.vector[i].calcularArea();
            
        }
        return suma;
    }
    
    // imprime el titulo, representacion 
    // de cada figura, y area del dibujo
    public void mostrar(){
        System.out.println(this.titulo);
        for (int i = 0; i < this.guardadas; i++){
            System.out.println(this.vector[i].toString());
        
        }
        System.out.println(this.calcularArea());
    }
    
    // retorna esta lleno el dibujo
    public boolean estaLleno(){
        return (guardadas == capacidadMaxima);
    }
}
