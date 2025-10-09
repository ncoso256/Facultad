
package tema4;

/**
 *
 * @author noe
 */
public class Main3 {


    public static void main(String[] args) {
        
        Persona p = new Persona("Mauro", 11203737, 70);
        
        Trabajador t = new Trabajador("Mauro",11203737, 70, "Jardinero");
        
        System.out.println(p.toString());
        
        System.out.println(t.toString());
    }
    
}
