/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package videostaller3;

/**
 *
 * @author noe
 */
public class Producto {
    private double precio; // azul tipo primitivo 
    private String nombre; // esta es un objeto
    private String descripcion; // y esta variable son objetos
    
    public String nombre1; // esta mal las variables de instacia son privadas. 
    
    private double precio1 = 100; // le puedo dar un valor por defecto antes de inicializarlo en el ppal
    private String nombre2 = "Pepe";
    private String descripcion1 = "Sin desc";
    
    private double precio2 = 10; 
    private Fabrica fabricante;
    
    /*
    
    public TipoRetorno nombreMetodo(lista de parametros formales){
        declaracion de variables locales al metodo
        cuerpo del metodo
    }
    
    public puede ser private tambien 
    
    tipo de retorno: dato primitivo, nombre de clase o void no retorna datos
    
    lista de parametros: siempre por valor se separa con coma ;   tipoprimitivo nombreParam , NombreClase nombreParam 
    
    cuerpo: codigo y devuelve resultado return 
    */
    
    public boolean esCaro(double valor){ 
        return (precio2 > valor); 
    }
    private boolean esCaro2(double valor2){
        return (precio1 > valor2);
    }
    
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

    public String getNombre1() {
        return nombre1;
    }

    public void setNombre1(String nombre1) {
        this.nombre1 = nombre1;
    }

    public double getPrecio1() {
        return precio1;
    }

    public void setPrecio1(double precio1) {
        this.precio1 = precio1;
    }

    public String getNombre2() {
        return nombre2;
    }

    public void setNombre2(String nombre2) {
        this.nombre2 = nombre2;
    }

    public String getDescripcion1() {
        return descripcion1;
    }

    public void setDescripcion1(String descripcion1) {
        this.descripcion1 = descripcion1;
    }

    public double getPrecio2() {
        return precio2;
    }

    public void setPrecio2(double precio2) {
        this.precio2 = precio2;
    }

    @Override
    public String toString() { // armado por insert code tiene que ser si o si toString el nombre porque si no es no puedo hacer
        // system.out.println(p2); p2 = producto y hace el casteo del toString
        String aux = "Producto{" + "precio=" + precio + ", nombre=" + nombre + ", descripcion=" + descripcion + ", nombre1=" + nombre1 + ", precio1=" + precio1 + ", nombre2=" + nombre2 + ", descripcion1=" + descripcion1 + ", precio2=" + precio2 + '}';
        aux += fabricante;
        return aux;
    }
    
    public Producto(String unNombre, String unaDescripcion, double unPrecio){
        nombre = unNombre;
        precio = unPrecio;
        descripcion = unaDescripcion;  // puedo definir asi la cantidad que quiera
    } 
    // y asi varios constructores mas
    
    public Producto(String unNombre ,double unPrecio, Fabrica unFabricante){
        nombre = unNombre;
        precio = unPrecio;
        fabricante = unFabricante;
    }
    
    public Producto(String unNombre){
        nombre = unNombre;
    }
    
    public Producto(){
        nombre = "vacio";
        precio = 0.02;
    }
}
