
package tema4;

public abstract class Sistema {
    
    private Estacion esta;
    private double[][] temperatura;
    private int ano;
    
    public Sistema(Estacion esta, int A,int N){
        this.esta = esta;
        this.ano = A;
        this.temperatura = new double[N][12];
        
         
        for (int i = 0; i < temperatura.length; i++){
            for(int j = 0; j < 12; j++){
                this.temperatura[i][j] = 99999;
            }
        }
        
        
    }

    public Estacion getEsta() {
        return esta;
    }

    public void setEsta(Estacion esta) {
        this.esta = esta;
    }

    public double[][] getTemperatura() {
        return temperatura;
    }

    public void setTemperatura(double[][] temperatura) {
        this.temperatura = temperatura;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }
    
    public void registrarTemperatura(int anio, int mes, double tem){
        this.temperatura[anio][mes] = tem;
    }
    
    public double devolverTemperatura(int anio, int mes){
        if (this.temperatura[anio][mes] != 99999){
            return this.temperatura[anio][mes];
        }
        return 99999;
    }
    
    @Override
    public String toString(){
        int mes = 0;
        int anio = 0;
        double max = -1;
        
        
        for(int i = 0; i < temperatura.length; i++){
            for(int j = 0; j< 12;j++){
                if (this.temperatura[i][j]> max){
                    max = this.temperatura[i][j];
                    mes = j;
                    anio = i;
                }
            }
        }
        int temp;
        temp = this.ano+anio;
        return "en el año " + temp + " y mes " + mes + " se registro la temperatura mas alta de " + max+ " grados";
    }
    public abstract void toString2();
}
