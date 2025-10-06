package videostaller4;

/**
 *
 * @author noe
 */
public class ProductoImportado extends ProductoQueCaduca{
    private String paisDeDondeViene;
    
    public String toString(){
        return paisDeDondeViene + " y caduca en: " + this.getMeses();
    }
}
