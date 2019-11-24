package clases;

import java.util.Date;


public class Reserva {

    int id_reserva;
    int id_usuario;
    Date fechain_reserva;
    int dias_reserva;
    int cantpersonas_reserva;
    Date fechater_reserva;

    public Reserva() {
    }

    public Reserva(int id_reserva, int id_usuario, Date fechain_reserva, int dias_reserva, int cantpersonas_reserva, Date fechater_reserva) {
        this.id_reserva = id_reserva;
        this.id_usuario = id_usuario;
        this.fechain_reserva = fechain_reserva;
        this.dias_reserva = dias_reserva;
        this.cantpersonas_reserva = cantpersonas_reserva;
        this.fechater_reserva = fechater_reserva;
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

    public Date getFechain_reserva() {
        return fechain_reserva;
    }

    public void setFechain_reserva(Date fechain_reserva) {
        this.fechain_reserva = fechain_reserva;
    }

    public int getDias_reserva() {
        return dias_reserva;
    }

    public void setDias_reserva(int dias_reserva) {
        this.dias_reserva = dias_reserva;
    }

    public int getCantpersonas_reserva() {
        return cantpersonas_reserva;
    }

    public void setCantpersonas_reserva(int cantpersonas_reserva) {
        this.cantpersonas_reserva = cantpersonas_reserva;
    }

    public Date getFechater_reserva() {
        return fechater_reserva;
    }

    public void setFechater_reserva(Date fechater_reserva) {
        this.fechater_reserva = fechater_reserva;
    }
}
