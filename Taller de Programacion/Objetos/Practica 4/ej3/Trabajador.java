
package tema4;

/**
 *
 * @author noe
 */
public class Trabajador extends Persona{
    private String tarea;

    public Trabajador(String unNombre,int unDni,int unaEdad ,String unaTarea){
        super(unNombre,unDni,unaEdad);
        tarea = unaTarea;
    }
    
    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    @Override
    public String toString() {
        return super.toString() + "Soy " + tarea + ".";
    }
    
    
    
}
