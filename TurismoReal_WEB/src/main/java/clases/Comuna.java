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
public class Comuna {
    int id_comuna;
    String nombre_comuna;
    int id_region;

    public Comuna() {
    }

    public Comuna(int id_comuna, String nombre_comuna, int id_region) {
        this.id_comuna = id_comuna;
        this.nombre_comuna = nombre_comuna;
        this.id_region = id_region;
    }

    public int getId_comuna() {
        return id_comuna;
    }

    public void setId_comuna(int id_comuna) {
        this.id_comuna = id_comuna;
    }

    public String getNombre_comuna() {
        return nombre_comuna;
    }

    public void setNombre_comuna(String nombre_comuna) {
        this.nombre_comuna = nombre_comuna;
    }

    public int getId_region() {
        return id_region;
    }

    public void setId_region(int id_region) {
        this.id_region = id_region;
    }
    
    
}
