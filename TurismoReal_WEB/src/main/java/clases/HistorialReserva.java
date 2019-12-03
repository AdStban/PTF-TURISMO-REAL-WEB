/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;
import java.util.Date;

/**
 *
 * @author Adán Esteban
 */
public class HistorialReserva {
    
    Date fecha_reserva;
    String nombre_comuna;
    int total_detalle;
    int restante_detalle;
    int abono;
    String fecha_detallada;

    public HistorialReserva() {
    }

    public HistorialReserva(Date fecha_reserva, String nombre_comuna, int total_detalle, int restante_detalle, int abono, String fecha_detallada) {
        this.fecha_reserva = fecha_reserva;
        this.nombre_comuna = nombre_comuna;
        this.total_detalle = total_detalle;
        this.restante_detalle = restante_detalle;
        this.abono = abono;
        this.fecha_detallada = fecha_detallada;
    }

    public Date getFecha_reserva() {
        return fecha_reserva;
    }

    public void setFecha_reserva(Date fecha_reserva) {
        this.fecha_reserva = fecha_reserva;
    }

    public String getNombre_comuna() {
        return nombre_comuna;
    }

    public void setNombre_comuna(String nombre_comuna) {
        this.nombre_comuna = nombre_comuna;
    }

    public int getTotal_detalle() {
        return total_detalle;
    }

    public void setTotal_detalle(int total_detalle) {
        this.total_detalle = total_detalle;
    }

    public int getRestante_detalle() {
        return restante_detalle;
    }

    public void setRestante_detalle(int restante_detalle) {
        this.restante_detalle = restante_detalle;
    }

    public int getAbono() {
        return abono;
    }

    public void setAbono(int abono) {
        this.abono = abono;
    }

    public String getFecha_detallada() {
        return fecha_detallada;
    }

    public void setFecha_detallada(String fecha_detallada) {
        this.fecha_detallada = fecha_detallada;
    }
       
}
