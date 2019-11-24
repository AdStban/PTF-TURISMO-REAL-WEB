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
public class Tour {
    int id_tour;
    int id_servicio_extra;
    String descripcion_tour;

    public Tour() {
    }

    public Tour(int id_servicio_extra, String descripcion_tour) {
        
        this.id_servicio_extra = id_servicio_extra;
        this.descripcion_tour = descripcion_tour;
    }

    public int getId_tour() {
        return id_tour;
    }

    public void setId_tour(int id_tour) {
        this.id_tour = id_tour;
    }

    public int getId_servicio_extra() {
        return id_servicio_extra;
    }

    public void setId_servicio_extra(int id_servicio_extra) {
        this.id_servicio_extra = id_servicio_extra;
    }

    public String getDescripcion_tour() {
        return descripcion_tour;
    }

    public void setDescripcion_tour(String descripcion_tour) {
        this.descripcion_tour = descripcion_tour;
    }
    
    
    
    
    
}
