/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Usuario
 */
public class SistemaMeses extends Sistema{
    public SistemaMeses(Estacion esta, int A,int N){
        super(esta,A,N);
    }
    
    public void toString2(){
        double[][] t = super.getTemperatura();
        int temp;
        
        System.out.println(super.getEsta().getNom()+ " " + super.getEsta().getLatitud() + " " + super.getEsta().getLongitud());
        
        int i,j;
        for (j = 0; j < 12; j++){
            double total = 0;
            for (i = 0; i < t.length ; i++){
                if (t[i][j] != 99999)
                    total += t[i][j];
            }
            System.out.println("Mes " + j + " temperatura " + total/ t.length + "\n");
        }
    }
}
