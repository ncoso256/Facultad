
package ejercicio2;

public class Estacionamiento {
    private String nombre;
    private String direccion;
    private String apertura;
    private String cierre;
    private int N;
    private int M;
    private Auto[][] lugar;

    public void inicializarMatriz(){
        int i,j;
        for (i = 0; i < this.N; i++){
            for (j = 0; j < this.M; j++)
                this.lugar[i][j] = null;
        }
    }
    public Estacionamiento(String unNombre, String unaDireccion){
        this.nombre = unNombre;
        this.direccion = unaDireccion;
        this.setApertura("8:00");
        this.setCierre("21:00");
        this.N = 5;
        this.M = 10;
        this.lugar = new Auto[this.N][this.M];
        this.inicializarMatriz();
    }
    
    public Estacionamiento(String unNombre, String unaDireccion,String unaApertura, String unCierre, int pisos, int plazas){
        this.nombre = unNombre;
        this.direccion = unaDireccion;
        this.apertura = unaApertura;
        this.cierre = unCierre;
        this.N = pisos;
        this.M = plazas;
        this.lugar = new Auto[pisos][plazas];
        this.inicializarMatriz();
    }
    
    
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getApertura() {
        return apertura;
    }

    public void setApertura(String apertura) {
        this.apertura = apertura;
    }

    public String getCierre() {
        return cierre;
    }

    public void setCierre(String cierre) {
        this.cierre = cierre;
    }

    public int getN() {
        return N;
    }

    public void setN(int N) {
        this.N = N;
    }

    public int getM() {
        return M;
    }

    public void setM(int M) {
        this.M = M;
    }

    public Auto[][] getLugar() {
        return lugar;
    }

    public void setLugar(Auto[][] lugar) {
        this.lugar = lugar;
    }
    
    public void registrarAuto(Auto a, int x, int y){
        this.lugar[x][y] = a;
    }
    
    public String buscarAuto(String unaPatente){
        String aux = "";
        boolean encontre = false;
        int i,j;
        int piso = -1,plaza = -1;
        i = 0;
        while (i < this.N && !encontre){
            j = 0;
            while (j < this.M && !encontre){
                if (this.lugar[i][j] != null){
                    if (this.lugar[i][j].getPatente().equals(unaPatente)){
                        encontre = true;
                        piso = i;
                        plaza = j;
                    }
                }
                j++;
            }
            i++;
        }
        if (encontre){
            aux = unaPatente + " Piso: " + (piso+1) + " Plaza:  " + (plaza+1);
        }
        else{
            aux = "auto inexistente";
        }
        return aux;
    }
    
    @Override
    public String toString(){
        String aux = " ";
        for (int i = 0; i < this.N; i++){
            for (int j = 0; j < this.M; j++){
                if (this.lugar[i][j] != null){
                    aux += "Piso: " + (i+1) + " Plaza : " + (j+1);
                }
                else{
                    aux += "Libre";
                }
                aux += " \n ";
            }
        }
        return aux;
    }
    
    public int cantAutosPlaza(int y){
        int cant = 0;
        for (int i = 0; i < this.N ; i++){
            if (this.lugar[i][y] != null){
                cant++;
            }
        }
        return cant;
    }
}
