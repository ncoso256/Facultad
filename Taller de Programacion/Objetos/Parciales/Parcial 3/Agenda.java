
package javaapplication7;


public class Agenda {
    private int dias = 5;
    private int turnos = 6;
    private Paciente[][] pa;
    
    public Agenda(){
        pa = new Paciente[dias][turnos];
    }
    
    public void inicializarPaciente(){
        int i,j;
        for (i = 0; i < this.dias; i++){
            for (j = 0; j < this.turnos; j++){
                pa[i][j] = null;
            }
        }
    }
    
    public void agregarPaciente(Paciente pas, int dia, int turno){
        pa[dia-1][turno-1] = pas;
    }
    
    public void liberar(String nombre){
        int i,j;
        for (i = 0; i < this.dias; i++){
            for (j = 0; j < this.turnos; j++){
                if (pa[i][j]!= null&& pa[i][j].nombreIgual(nombre)){
                    pa[i][j] = null;
                }
            }
        }
    }
    
    public boolean tieneTurno(int dia,String nombre){
        boolean encontre = false;
        int j;
        for (j = 0; j < this.turnos;j++){
            if (pa[dia][j]!= null && pa[dia][j].nombreIgual(nombre)&& encontre != true){
                encontre = true;
            }
        }
        return encontre;
    }
    
    public void imprimir(){
        int i,j;
        for (i = 0; i < this.dias; i++){
            for (j = 0; j < this.turnos; j++){
                if (pa[i][j]!= null){
                    System.out.print("Nombre: " + pa[i][j].getNombre());
                }
                else{
                    System.out.print("vacio");
                }
            }
            System.out.println();
        }
    }
}
