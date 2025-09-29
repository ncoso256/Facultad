/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package videostaller;

/**
 *
 * @author noe
 */
import PaqueteLectura.Lector; // importar funcionalidad para la lectura
import PaqueteLectura.GeneradorAleatorio; // importar funcionalidad Generador aleatorio
import PaqueteLectura.*; // importar todas las funcionalidades del paquete de lectura (Lector, GeneradorAleatorio)

public class VideosTaller {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String nombreDelAlumno; // declaracion de un string
        boolean esArgentino = true;  // declaracion de un booleano y si quiero le pongo un valor
       
        // comentario linea unica
        
        /* 
        comentario de muchas lineas
        */
        
        nombreDelAlumno = "Noé"; // asignacion a un string 
        nombreDelAlumno = nombreDelAlumno + " Coso"; // concatenar strings 
        nombreDelAlumno += " Facultad de informatica";
        
        boolean encontre = false;
        int miDni = 11222333, tuDni = 10555444; // miDni,tuDni: integer;
        char sexo,inicial = 'C'; // lo mismo de arriba
        sexo = 'F'; 
        double miSueldo = 1000.30; // miSueldo: real;
        String miNombre = "Pepe"; // String "" , y char ''
        
        int i = 1; 
        i++; // i:= i + 1;
        i = i + 1;
        
        int i2 = 3; // i2 vale 3
        i2++; // i2 vale 4
        i2--; // i2 vale 3
        
        int result = 1 + 2; // result es 3
        result = result - 1; // result es 2
        result = result * 2; // result es 4
        result = result / 2; // result es 2
        result = result % 2; // result es 0
        
        int i3 = 4/3;  // division entera i = 1 
        double d1 = 4.0/3.0; // division real d1 = 1.33333
        double d2 = 4/3;  // division entera d2 = 1.0
        double d3 = (double) 4/3; //division real d3 = 1.333
        
        System.out.print("Hola Mundo! ");
        
        System.out.println("---------------------------");
        
        System.out.println("Hola mundo ! ");
        
        System.out.println("---------------------------");
        
        System.out.println(1234);
        
        System.out.println("---------------------------");
        
        System.out.println(true);
        
        System.out.println("---------------------------");
        
        // Para mostrar varios datos unirlos con + 
        int año = 2018;
        System.out.println("Hola mundo " + año + "!");
       
        System.out.println("---------------------------");
        
        // otra alternativa al i++
        System.out.println("Hola "+ i);
        
        System.out.println("---------------------------");
        
        System.out.println("Hola "+ ++i); // esto lo que hace primero es poner el valor sumado
        
        System.out.println("---------------------------");
        
        System.out.println("Hola "+ i++); // aca cambia el valor despues del write
        
        System.out.println("---------------------------");
        
        System.out.println("Hola "+ i + " Es nacional? :  " + esArgentino);
        
        System.out.println("---------------------------");
        
        System.out.println("Se llama... " + nombreDelAlumno);
        
        System.out.println("---------------------------");
        
        System.out.println("Ingrese un nombre: ");
        String nombre = Lector.leerString(); // leer string
        System.out.println("Ingrese su sueldo: "); 
        double sueldo = Lector.leerDouble();
        
        System.out.println(nombre + " cobra " + sueldo+ " pesos");
        
        System.out.println("---------------------------");
        
        GeneradorAleatorio.iniciar();
        System.out.println(GeneradorAleatorio.generarInt(10)); // genera un int entre 0 y 9
        
        System.out.println("---------------------------");
        
        
        System.out.println(GeneradorAleatorio.generarDouble(10)); // genera un double entre 0 y 9
        
        System.out.println("---------------------------");
        
        System.out.println(GeneradorAleatorio.generarBoolean()); // genera un boolean
        
        System.out.println("---------------------------");
        
        System.out.println(GeneradorAleatorio.generarString(4)); // genera un string de long 4 
        
        System.out.println("---------------------------");
        
        sueldo = GeneradorAleatorio.generarDouble(500);
        System.out.println(nombre + " cobra " + sueldo+ " pesos");
        
        System.out.println("---------------------------");
        
        // for (inicializacion; condicion; expresion)
        //  acciones
        int i4;
        for (i4=1; i4<= 10; i4++)
            System.out.println(i4);
        
        System.out.println("---------------------------");
        
        for (int i5=1; i5<= 10; i5++)
            System.out.println(i5);
        
        System.out.println("---------------------------");
        
        for (int i6=1; i6<= 10; System.out.println(i6++));
        
        System.out.println("---------------------------");
        
        int i7; 
        for (i7 = 10; i7>0; i7=i7-1) // for i:= 10 downto 1 do 
            System.out.println(i7);
        
        System.out.println("---------------------------");
        
        int i8;
        for (i8= 10; i8>0; i8--) // hacer i8-- o --i8 no cambia en nada
             System.out.println(i8);
        
        System.out.println("---------------------------");
        /* 
        cuatro formas de hacer diferentes
        estructuras de control for
        */
        
        int i9 = 100;
        while (i9 > 2){
            System.out.println(i9);
            if (i9 % 2 == 0) // si i9 mod 2 = 0 then, si i9 es par entonces
                System.out.println(i9 + " es par");
            i9-= 3;
            // tambien en vez de i9-- puedo hacer i9-=1;
        }
        
        System.out.println("---------------------------");
        
        /* 
        Declaracion arreglos
        
        tipoElemento[] nombreVariable;
        
        Creacion 
        
        nombreVariable = new tipoElemento[DIMF];
        
        Acceso a elemento
        nombreVariable[posicion]
        */
        
        int[] contador = new int[10]; // vector de enteros del 0..9
        for (int i0 = 0; i0 < 10; i0++)
            contador[i0]= i0;
        System.out.println("La pos. 1 tiene "+ contador[1]);
        
        System.out.println("---------------------------");
        
        String[] alumnos = new String[8]; // vector de string de 0..7
        
        alumnos[1] = "Facundo";
        alumnos[2] = "Mariano";
        alumnos[3] = "Franco";
        
        for (int i10 = 0 ; i10 < 8; i10++) // imprime en las pos que tiene basura null que seria nil de pascal
            System.out.println("Pos. " + i10 + " esta. " + alumnos[i10]);
        
        System.out.println("---------------------------");
        
        for (int i11 = 1 ; i11 <= 3; i11++) // para imprimirlo bien hay que cambiar los valores de inicializacion y condicion
            System.out.println("Pos. " + i11 + " esta. " + alumnos[i11]);
        
        System.out.println("---------------------------");
        
        for (int i12 = 0; i12 <8; alumnos[i12++] = GeneradorAleatorio.generarString(5)); // genera strings de 5 caracteres
        
        // si no puedo hacer tambien que el generador aleatorio propiamente me genere la cantidad de caracteres y sea mas aleatorio todavia
        // con GeneradorAleatorio.generarString(1 + GeneradorAleatorio.generarInt(7))
        
        for (int i13 = 0; i13 <= 7; System.out.println( i13 + " : "+ alumnos[i13++]));
        
        System.out.println("---------------------------");
        
        String[][] aula1 = new String[5][9]; // definicion matriz 
        aula1[0][0] = "Pepe";
        aula1[3][8] = "Juan";
        
        int k,j;
        for (k = 0 ; k < 5 ; k++)
            for (j = 0 ; j<9; j++)
                aula1[k][j] = GeneradorAleatorio.generarString(5); // genero valores aleatorios en mi matriz
        
        for (k = 0 ; k<5 ; k++){
            System.out.println("---------------------------");
            for (j = 0; j<9 ; j++)
               System.out.print("("+ k + " , " + j + " ) " + aula1[k][j]+ " | " );
        }    
        
        System.out.println("---------------------------");
        
        int [][] tabla = new int [3][4];
        int k1,j1;
        for (k1 = 0; k1 <3; k1++)
            for (j1 = 0 ; j1 < 4 ; j1++)
                tabla[k1][j1] = GeneradorAleatorio.generarInt(10);
        System.out.println("La pos. 1,2 tiene " + tabla[1][2]);
               
    }    
}   
