package videostaller4;

/**
 *
 * @author noe
 */
public class ProductoImportado extends ProductoQueCaduca{
    private String paisDeDondeViene;
    
    
    @Override
    public String toString(){
        return paisDeDondeViene + " y caduca en: " + this.getMeses();
    }
    
    
    public double precioConIVA(double IVA){
        return this.getPrecio() * IVA * 1.40;
    }
}
