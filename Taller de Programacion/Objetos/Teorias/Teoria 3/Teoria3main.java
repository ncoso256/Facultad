package video3;

public class VideosTaller3 {


    public static void main(String[] args) {
       Producto p = new Producto();
        Producto p2 = new Producto();
        
        Producto[] productos = new Producto[2];
        productos[0] = new Producto(); 
        productos[0].setNombre("El de la pos 0");
        productos[1].getPrecio();
        
        // l^.sig := nil; error 
        
        p2.setNombre("Titulo de p: ");
        p2.setPrecio(200);
        if (p.esCaro(5))
            System.out.println("Te pasaste de precio: " +  p.getPrecio());
        
        if (p2.esCaro(20))
            System.out.println("Te pasaste de precio: "+ p2.getPrecio());
        
        p2.setNombre("Titulo de prueba de p2: ");
        System.out.println(p2);
    }
    
}

