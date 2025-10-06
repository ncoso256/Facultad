package videostaller4;


        /*
    Definicion de clases
    
    public class NombreDeClase(){
        
        // declaracion del estado del objeto
        
        // declaracion de constructores
        
        // declaracion de metodos que implementan acciones
    }
    
    */

public class Producto {
    private double precio = 10; // primitiva
    private String nombre = "Pepe"; // objeto
    private String descripcion = "Sin descripcion" ; // private para encapsulamiento
    private Fabrica fabricante;
    
    /*
    Declaracion de constructores =
    
    Sintaxis =
    
    public nombreClase(Lista de parametros formales){
       // codigo
    }
    
    la clase no declara constructores, java te da uno sin codigo (constructor nulo)
    
    Cumple la funcion de instanciar el objeto:
    
    nombreClase objeto = new NombreClase(lista de parametros actuales);
    */
    
    public Producto(String unNombre, double unPrecio, Fabrica unFabricante){
        nombre = unNombre;
        precio = unPrecio;
        fabricante = unFabricante;
    }
    
    public Producto(String unNombre){
        nombre = unNombre;
    }
    public Producto(){
        nombre = "vacio";
        precio = 0.01;
    }
    /*
    Declaracion del comportamiento = 
    
    public tipoRetorno nombreMetodo(Lista de parametros formales){
        // declaracion de variables locales al metodo
        // cuerpo del metodo
    }
    
    public = forma parte de la interfaz
    
    tipoRetorno = primitivos / nombre de clase / void (no retorna dato)
    
    Lista de parametros = datos primitivos o objetos 
                        = tipoPrimitivo // NombreClase nombreParam
                        = se separa con coma 
                        = pasaje por valor unicamente
    
    Declaracion de variables locales = Duran solo en el metodo
    
    Cuerpo = Devolver resultado return
    */
    
    public double getPrecio(){
        return precio;
    }
    
    public void setPrecio(double nuevoPrecio){
        precio = nuevoPrecio;
    }
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    
    public boolean esCaro(double valor){
        return (precio > valor);
    }

    @Override
    public String toString() {
       String aux = "Producto:" + nombre + " vale " + precio;
       aux += esCaro(500); 
       aux += fabricante;
       return aux;
    }


    
    
}
