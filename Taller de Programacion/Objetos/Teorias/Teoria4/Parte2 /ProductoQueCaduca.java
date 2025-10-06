
package videostaller4;

/**
 *
 * @author noe
 */
public class ProductoQueCaduca extends Producto{
    private int meses;

    public int getMeses() {
        return meses;
    }

    public void setMeses(int meses) {
        this.meses = meses;
    }

    public double precioConIVA(double IVA) {
        return this.getPrecio() * IVA;
    }
    
    
}
