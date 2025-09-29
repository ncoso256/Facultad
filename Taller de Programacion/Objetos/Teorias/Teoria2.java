package videostaller2;

/**
 *
 * @author noe
 */
public class VideosTaller2 {


    public static void main(String[] args) {
        
        String test = "Hola desde Java";
        // en este caso evalua el char en la posicion 5 
        System.out.println(test.charAt(5)); // mensaje objeto string por ejemplo
        
        System.out.println("--------------------------");
        
        String saludo = "hola"; 
        String saludo1 = new String("Hola mundo"); // se guarda tambien el comportamiento
        String saludo2 = new String("Hola mundo");
        saludo1 = saludo2; // funciona como punteros 
        System.out.println(saludo1 == saludo2); // aca va a ser true por la instruccion de arriba
        
        System.out.println("--------------------------");
        
        System.out.println(saludo2.equals(test)); // en este caso va a evaluar que tiene el objeto por dentro no revisa el puntero.
        
        System.out.println("--------------------------");
        
        String test1 = "hola";
        String test2 = "hola";
        boolean iguales = test1 == test2;
        System.out.println(iguales); // en este caso esta usando la misma pos de memoria
        
        System.out.println("--------------------------");
        
        String test3 = new String("hola");
        String test4 = new String("hola");
        boolean iguales2 = test3 == test4;
        System.out.println(iguales2); // ahora como cree los objetos test 3 y test 4 ahora la comparacion da falsa
        
        System.out.println("--------------------------");
        
        String test5 = "hola";
        String test6 = new String("hola");
        boolean ValoresIguales = test5.equals(test4);
        boolean ValoresIguales2 = test5.equals(new String("Chau"));
        boolean ValoresIguales3 = test5.equals(new int[20]); // no tiene sentido pero de igual forma son objetos. 
        System.out.println(ValoresIguales); // ahora evalue los objetos test 5 y test 6 por dentro a ver si los valores son iguales
        
        System.out.println("--------------------------");
        
        System.out.println(test5.toUpperCase()); // devuelve test5 todo en mayuscula
        
        System.out.println("--------------------------");
        
        System.out.println(test5); // no modifica la variable .toUpperCase
        
        System.out.println("--------------------------");
        
        String saludo3 = new String("hola");
        System.out.println(saludo3.length()); // imprime 4 la cantidad de caracteres del string.
        
        System.out.println("--------------------------");
        
        System.out.println(saludo3.charAt(0)); // evalua en la pos 0 y muestra el caracter
        
        System.out.println("--------------------------");
        
        System.out.println(saludo3.toUpperCase().equals("HOLA")); // dos mensajes seguidos es decir dos acciones en una
    }
    
}
