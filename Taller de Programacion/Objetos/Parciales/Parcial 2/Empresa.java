/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication5;

public class Empresa {

    private String nombre;
    private String direccion;
    private int costoxmes;
    private int S;
    private int B;
    private Cliente[][] matriz; 
    private int diml1 = 0;
    private int diml2 = 0;


    public Empresa(String unNombre, String unaDireccion, int unCosto, int sector, int baulera){
        this.nombre = unNombre;
        
        this.direccion = unaDireccion;

        this.costoxmes = unCosto;
        
        this.S = sector;

        this.B = baulera;
        
        this.matriz = new Cliente[this.S][this.B];
    }

    

    public void ingresarCliente(Cliente c){
        
        if (this.diml1  < this.S){
            if (this.diml2 < this.B){
                this.matriz[this.diml1][this.diml2] = c;
                this.diml2++;
            }
            if (this.diml1 == this.S){
                this.diml1++;
                this.diml2 = 0;
            }
        }

    }

    

    public String listarCliente(int x){
        String aux = "";
        int j;
        for (j = 0; j < this.B; j++){
            if (this.matriz[x-1][j] != null && this.matriz[x-1][j].getLocalidad().equalsIgnoreCase("los hornos")){
                aux += this.matriz[x-1][j].toString();
            }
        }
        return aux;
    }

    

    public int obtenerNumSectorMax(){
        int cant;
        int imax = -1;
        int max = -1;
        int i,j;
        for (i = 0; i < this.S; i++){
            cant = 0;
            for (j = 0; j < this.B ; j++){
                if (this.matriz[i][j] != null && matriz[i][j].isSeguro()){
                    cant++;
                }
            }
            if (cant > max){
                max = cant;
                imax = i + 1;
            }
        }
        return imax;
    }

    

    @Override

    public String toString(){

        String aux = "";

        aux = "Empresa: "+ this.nombre+ " Direccion: " + this.direccion+ " Costo por mes: " + this.costoxmes+  " \n";

        int i,j;

        for (i = 0; i < this.S; i++){

            aux += "Sector: "+ (i+1) +   " \n";

            for (j = 0; j < this.B; j++){
                
                if (this.matriz[i][j]!= null){
                    aux += "baulera:  "+ (j+1)+ this.matriz[i][j].toString() +" \n";

                }
                else{
                    aux += "Vacia";
                }
            }

        }

        return aux;

    }

}


