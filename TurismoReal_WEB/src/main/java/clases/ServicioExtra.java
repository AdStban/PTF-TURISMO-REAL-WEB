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
public class ServicioExtra {
    
    int id_servicio;
    String descripcion;
    int costo_servicio;

    public ServicioExtra() {
    }

    public ServicioExtra(String descripcion, int costo_servicio) {
        
        this.descripcion = descripcion;
        this.costo_servicio = costo_servicio;
    }

    public int getId_servicio() {
        return id_servicio;
    }

    public void setId_servicio(int id_servicio) {
        this.id_servicio = id_servicio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCosto_servicio() {
        return costo_servicio;
    }

    public void setCosto_servicio(int costo_servicio) {
        this.costo_servicio = costo_servicio;
    }
    
    
    
    
    
}
