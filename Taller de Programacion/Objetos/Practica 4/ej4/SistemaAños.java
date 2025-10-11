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
public class SistemaAños extends Sistema{
    public SistemaAños(Estacion esta, int A,int N){
        super(esta,A,N);
    }
    
    public void toString2(){
        double[][] t = super.getTemperatura();
        int temp;
        
        System.out.println(super.getEsta().getNom()+ " " + super.getEsta().getLatitud() + " " + super.getEsta().getLongitud());
        
        
        for (int i = 0; i < t.length; i++){
            double total = 0;
            for (int j = 0; j < 12 ; j++){
                if (t[i][j] != 99999)
                    total += t[i][j];
            }
            temp = super.getAno()+ i;
            System.out.println("año " + temp + " temperatura " + total/ 12 + "\n");
        }
    }
}

}
