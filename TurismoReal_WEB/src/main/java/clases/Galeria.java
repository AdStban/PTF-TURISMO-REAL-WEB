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
public class Galeria {
   int id_foto;
   String ubicacion;
   int id_depto;
   String nom_foto;

    public Galeria() {
    }

    public Galeria(int id_foto, String ubicacion, int id_depto, String nom_foto) {
        this.id_foto = id_foto;
        this.ubicacion = ubicacion;
        this.id_depto = id_depto;
        this.nom_foto = nom_foto;
    }

    public int getId_foto() {
        return id_foto;
    }

    public void setId_foto(int id_foto) {
        this.id_foto = id_foto;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public int getId_depto() {
        return id_depto;
    }

    public void setId_depto(int id_depto) {
        this.id_depto = id_depto;
    }

    public String getNom_foto() {
        return nom_foto;
    }

    public void setNom_foto(String nom_foto) {
        this.nom_foto = nom_foto;
    }
   
   
}
