package clases;

public class Departamento {
    int id_departamento;
    int costo_departamento;
    String tipo_departamento;
    String direccion_departamento;
    String nom_comuna;
    int habitaciones;
    int banio;
    
    public Departamento() {
    }

    public Departamento(int id_departamento, int costo_departamento, String tipo_departamento, String direccion_departamento, String nom_comuna, int habitaciones, int banio) {
        this.id_departamento = id_departamento;
        this.costo_departamento = costo_departamento;
        this.tipo_departamento = tipo_departamento;
        this.direccion_departamento = direccion_departamento;
        this.nom_comuna = nom_comuna;
        this.habitaciones = habitaciones;
        this.banio = banio;
    }
    
    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public int getCosto_departamento() {
        return costo_departamento;
    }

    public void setCosto_departamento(int costo_departamento) {
        this.costo_departamento = costo_departamento;
    }
   
    public String getTipo_departamento() {
        return tipo_departamento;
    }

    public void setTipo_departamento(String tipo_departamento) {
        this.tipo_departamento = tipo_departamento;
    }

    public String getDireccion_departamento() {
        return direccion_departamento;
    }

    public void setDireccion_departamento(String direccion_departamento) {
        this.direccion_departamento = direccion_departamento;
    }

    public String getNom_comuna() {
        return nom_comuna;
    }

    public void setNom_comuna(String nom_comuna) {
        this.nom_comuna = nom_comuna;
    }
    
    public int getHabitaciones() {
        return habitaciones;
    }

    public void setHabitaciones(int habitaciones) {
        this.habitaciones = habitaciones;
    }

    public int getBanio() {
        return banio;
    }

    public void setBanio(int banio) {
        this.banio = banio;
    }
    
    

}
