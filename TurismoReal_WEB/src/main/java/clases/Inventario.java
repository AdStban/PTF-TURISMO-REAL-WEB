package clases;


public class Inventario {

    int id_inventario, id_departamento, internet_inventario;
    int banio_inventario, dormitorio_inventario, televisor_inventario;
    int mesa_inventario, asiento_inventario, mueble_inventario;

    int id_detalle, costo, id_reserva, id_usuario;
    String tipo_departamento;
    String detalle_fecha;

    public Inventario() {
    }

    public Inventario(int id_inventario, int id_departamento, int internet_inventario, int banio_inventario, int dormitorio_inventario, int televisor_inventario, int mesa_inventario, int asiento_inventario, int mueble_inventario, int id_detalle, int costo, int id_reserva, int id_usuario, String tipo_departamento, String detalle_fecha) {
        this.id_inventario = id_inventario;
        this.id_departamento = id_departamento;
        this.internet_inventario = internet_inventario;
        this.banio_inventario = banio_inventario;
        this.dormitorio_inventario = dormitorio_inventario;
        this.televisor_inventario = televisor_inventario;
        this.mesa_inventario = mesa_inventario;
        this.asiento_inventario = asiento_inventario;
        this.mueble_inventario = mueble_inventario;
        this.id_detalle = id_detalle;
        this.costo = costo;
        this.id_reserva = id_reserva;
        this.id_usuario = id_usuario;
        this.tipo_departamento = tipo_departamento;
        this.detalle_fecha = detalle_fecha;
    }

    

    public int getId_inventario() {
        return id_inventario;
    }

    public void setId_inventario(int id_inventario) {
        this.id_inventario = id_inventario;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public int getInternet_inventario() {
        return internet_inventario;
    }

    public void setInternet_inventario(int internet_inventario) {
        this.internet_inventario = internet_inventario;
    }

    public int getBanio_inventario() {
        return banio_inventario;
    }

    public void setBanio_inventario(int banio_inventario) {
        this.banio_inventario = banio_inventario;
    }

    public int getDormitorio_inventario() {
        return dormitorio_inventario;
    }

    public void setDormitorio_inventario(int dormitorio_inventario) {
        this.dormitorio_inventario = dormitorio_inventario;
    }

    public int getTelevisor_inventario() {
        return televisor_inventario;
    }

    public void setTelevisor_inventario(int televisor_inventario) {
        this.televisor_inventario = televisor_inventario;
    }

    public int getMesa_inventario() {
        return mesa_inventario;
    }

    public void setMesa_inventario(int mesa_inventario) {
        this.mesa_inventario = mesa_inventario;
    }

    public int getAsiento_inventario() {
        return asiento_inventario;
    }

    public void setAsiento_inventario(int asiento_inventario) {
        this.asiento_inventario = asiento_inventario;
    }

    public int getMueble_inventario() {
        return mueble_inventario;
    }

    public void setMueble_inventario(int mueble_inventario) {
        this.mueble_inventario = mueble_inventario;
    }

    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public int getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getTipo_departamento() {
        return tipo_departamento;
    }

    public void setTipo_departamento(String tipo_departamento) {
        this.tipo_departamento = tipo_departamento;
    }

    public String getDetalle_fecha() {
        return detalle_fecha;
    }

    public void setDetalle_fecha(String detalle_fecha) {
        this.detalle_fecha = detalle_fecha;
    }
    
    

}
