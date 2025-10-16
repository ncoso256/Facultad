/*

 */
package javaapplication4;

/*
El constructor de eventos ocasionales además recibe el motivo, el nombre del contratante y día del evento.


iii. El evento ocasional debe saber responder al mensaje actuar de manera distinta:

 Si es un show de beneficencia se imprime la leyenda “Recuerden colaborar con…“ seguido del nombre del contratante.

 Si es un show de TV se imprime “Saludos amigos televidentes”

 Si es un show privado se imprime “Un feliz cumpleaños para…” seguido del nombre del contratante.
Independientemente del motivo del evento, luego se imprime el listado de temas como lo hace cualquier recital.

Si es un evento ocasional devuelve 0 si es a beneficio, 50000 si es un show de TV y 150000 si es privado.
*/
public class eventoOcasional extends Recital{
    private String motivo;
    private String nombreContratante;
    private int dia;

    public eventoOcasional(String unNombre,int cantTemas,String unMotivo, String unNombreContratante, int unDia){
        super(unNombre, cantTemas);
        this.motivo = unMotivo;
        this.nombreContratante = unNombreContratante;
        this.dia = unDia;
    }
    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    public void actuar(){
        if (this.getMotivo().equals("show de beneficencia")){
            System.out.println("Recuerden colaborar con... " + this.getNombreContratante());
        }
        else{
            if (this.getMotivo().equals("show de TV")){
                System.out.println("Saludos amigos televidentes");
            }
            else{
                if (this.getMotivo().equals("show privado")){
                    System.out.println("Un feliz cumpleaños para… " + this.getNombreContratante());
                }
            }
        }
        super.actuar();
    }
    
    public int calcularCosto(){
        if (this.getMotivo().equals("beneficio")){
            return 0;
        }
        else{
            if (this.getMotivo().equals("show de TV")){
                return 50000;
            }
            else{
                if (this.getMotivo().equals("show privado"))
                    return 150000;
            }
        }
        return -1;
    }
    
}
