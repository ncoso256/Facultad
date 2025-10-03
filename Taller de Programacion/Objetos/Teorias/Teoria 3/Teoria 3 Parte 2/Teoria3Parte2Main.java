package video3;

public class VideosTaller3 {


    public static void main(String[] args) {
       Producto p = new Producto("prod 1");
        Producto p2;
        
        Fabrica f1 = new Fabrica("Arcor","La Plata");
        Producto[] productos = new Producto[2];
        productos[0] = new Producto("prod 2", 102.4,f1); 
        productos[0].setNombre("El de la pos 0");
        productos[1]= new Producto();
        
         
        
        
    }
    
}
