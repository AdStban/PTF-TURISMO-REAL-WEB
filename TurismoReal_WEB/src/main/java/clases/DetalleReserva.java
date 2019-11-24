/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author Adán Esteban
 */
public class DetalleReserva {
    int id_detalle,total_detalle,abono_detalle,restante_detalle,id_departamento,id_reserva;

    public DetalleReserva() {
    }

    public DetalleReserva(int total_detalle, int abono_detalle, int restante_detalle, int id_departamento, int id_reserva) {
        
        this.total_detalle = total_detalle;
        this.abono_detalle = abono_detalle;
        this.restante_detalle = restante_detalle;
        this.id_departamento = id_departamento;
        this.id_reserva = id_reserva;
    }

    public int getId_detalle() {
        return id_detalle;
    }

    public void setId_detalle(int id_detalle) {
        this.id_detalle = id_detalle;
    }

    public int getTotal_detalle() {
        return total_detalle;
    }

    public void setTotal_detalle(int total_detalle) {
        this.total_detalle = total_detalle;
    }

    public int getAbono_detalle() {
        return abono_detalle;
    }

    public void setAbono_detalle(int abono_detalle) {
        this.abono_detalle = abono_detalle;
    }

    public int getRestante_detalle() {
        return restante_detalle;
    }

    public void setRestante_detalle(int restante_detalle) {
        this.restante_detalle = restante_detalle;
    }

    public int getId_departamento() {
        return id_departamento;
    }

    public void setId_departamento(int id_departamento) {
        this.id_departamento = id_departamento;
    }

    public int getId_reserva() {
        return id_reserva;
    }

    public void setId_reserva(int id_reserva) {
        this.id_reserva = id_reserva;
    }
    
    
    
    
}
