
package javaapplication4;
/*
 Una gira es un recital que además tiene un nombre y las “fechas” donde se repetirá la actuación. 
De cada “fecha” se conoce la ciudad y el día.
Además la gira guarda el número de la fecha en la que se tocará próximamente (actual).

El constructor de giras además recibe el nombre de la gira y la cantidad de fechas que tendrá.

ii. La gira debe saber responder a los mensajes:

 agregarFecha que recibe una “fecha” y la agrega adecuadamente.

 La gira debe responder al mensaje actuar de manera distinta. 
Imprime la leyenda “Buenas noches …” seguido del nombre de la ciudad de la fecha “actual”. 
Luego debe imprimir el listado de temas como lo hace cualquier recital. 
Además debe establecer la siguiente fecha de la gira como la nueva “actual”.

Las giras deben devolver 30000 por cada fecha de la misma.
*/

public class Gira extends Recital{
    private String nombreGira;
    private int cantFechas = 0;
    private int cantGiras = 0;
    private Fecha[] fechas;
    
    public Gira(String unNombre,int cantTemas,String unNombreGira,int cantidadFechas){
        super(unNombre, cantTemas);
        this.nombreGira = unNombreGira;
        this.cantFechas = cantidadFechas;
        this.fechas = new Fecha[this.cantFechas];
    }
    
    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }
    
    public void agregarFecha(Fecha f){
        if (this.cantGiras < this.cantFechas){
            this.fechas[this.cantGiras] = f;
            this.cantGiras++;
        }
    }
    
    public void actuar(){
        int i;
        for (i = 0; i< this.cantGiras; i++){
            System.out.println("Buenas noches … " + this.fechas[i].getCiudad());
            super.actuar();
        }
    }
    
    public int calcularCosto(){
        return (30000*this.cantGiras);
    }
}
