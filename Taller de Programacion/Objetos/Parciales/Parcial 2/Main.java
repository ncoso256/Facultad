package javaapplication5;





public class JavaApplication5 {



    public static void main(String[] args) {

       Empresa e = new Empresa("Storage", "60", 65, 5, 3);

       

       Cliente c1 = new Cliente(4564423, "Jose", 22154848, "La Plata", true);

       Cliente c2 = new Cliente(4564289, "Juan", 22154849, "Los hornos", false);

       Cliente c3 = new Cliente(3, "Ana", 333, "La Plata", true); 
    
       Cliente c4 = new Cliente(4, "Maria", 444, "Los hornos", true);
       Cliente c5 = new Cliente(5, "Pedro", 555, "City Bell", true);
       Cliente c6 = new Cliente(6, "Luis", 666, "Los hornos", false);

       e.ingresarCliente(c1);

       e.ingresarCliente(c2);

       e.ingresarCliente(c3);
       
       e.ingresarCliente(c4);
       
       e.ingresarCliente(c5);
       
       e.ingresarCliente(c6);

       System.out.println(e.listarCliente(1));

       

       System.out.println("el sector con maxima cantidad de clientes con seguro es :  "+ e.obtenerNumSectorMax());

       

       System.out.println(e.toString());

       

    }

    

    

}
