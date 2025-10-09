
package tema4;

public class Jugador extends Empleado{
    private int nropartidos;
    private int nrogoles;
    
    public Jugador(int numPartidos,int numGoles,String unNombre, double unSueldo,int unaAntiguedad){
        super(unNombre,unSueldo,unaAntiguedad);
        setNropartidos(numPartidos);
        setNrogoles(numGoles);
    }

    public int getNropartidos() {
        return nropartidos;
    }

    public void setNropartidos(int nropartidos) {
        this.nropartidos = nropartidos;
    }

    public int getNrogoles() {
        return nrogoles;
    }

    public void setNrogoles(int nrogoles) {
        this.nrogoles = nrogoles;
    }
    
    public double calcularEfectividad(){
        int i,suma;
        suma = 0;
        for (i = 0; i < getNropartidos(); i++){
            suma += this.getNrogoles();
        }
        return suma;
    }
    
    public double sueldoJugador(){
        if (this.calcularEfectividad() > 0.5)
            return super.getSueldo()*((super.getAntiguedad()* 10 )/ 100);
        return 0; 
    }
    

    public String toString(){
        String aux;
        aux = super.toString() + this.nrogoles + this.nropartidos;
        return aux;
    }

    //@Override
    //public int calculara() {
        
    //}
    
    
}
