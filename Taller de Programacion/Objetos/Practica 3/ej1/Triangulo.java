/*
1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Área = √s(s − a)(s − b)(s − c) , donde a, b y c son
los lados y s = 𝐚+𝐛+𝐜
2 . La función raíz cuadrada es Math.sqrt(#)
 */
package tema3;

/**
 *
 * @author noe
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorR;
    private String colorL;
    
    public Triangulo(double lado1, double lado2, double lado3, String colorR, String colorL) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorR = colorR;
        this.colorL = colorL;
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public String getColorR() {
        return colorR;
    }

    public void setColorR(String colorR) {
        this.colorR = colorR;
    }

    public String getColorL() {
        return colorL;
    }

    public void setColorL(String colorL) {
        this.colorL = colorL;
    }
    
    public double calcularPerimetro(){
        double perimetro;
        perimetro = this.lado1+ this.lado2 + this.lado3;
        return perimetro;
    }
    public double calcularArea(){
        double s = (lado1 + lado2 + lado3) / 2;
        double area; 
        area = Math.sqrt(s*(s-lado1)*(s-lado2)*(s-lado3));
        return area;
    }
}
