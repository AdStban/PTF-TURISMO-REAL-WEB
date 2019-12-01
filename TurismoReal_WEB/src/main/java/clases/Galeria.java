/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

/**
 *
 * @author joser
 */
public class Galeria {
    int Id_galeria;
    String Ubicacion_galeria;
    int Id_departamento;
    String Nombre_galeria;

    public Galeria(){
        
    }
    public Galeria(int Id_galeria, String Ubicacion_galeria, int Id_departamento, String Nombre_galeria) {
        this.Id_galeria = Id_galeria;
        this.Ubicacion_galeria = Ubicacion_galeria;
        this.Id_departamento = Id_departamento;
        this.Nombre_galeria = Nombre_galeria;
    }

    public int getId_galeria() {
        return Id_galeria;
    }

    public void setId_galeria(int Id_galeria) {
        this.Id_galeria = Id_galeria;
    }

    public String getUbicacion_galeria() {
        return Ubicacion_galeria;
    }

    public void setUbicacion_galeria(String Ubicacion_galeria) {
        this.Ubicacion_galeria = Ubicacion_galeria;
    }

    public int getId_departamento() {
        return Id_departamento;
    }

    public void setId_departamento(int Id_departamento) {
        this.Id_departamento = Id_departamento;
    }

    public String getNombre_galeria() {
        return Nombre_galeria;
    }

    public void setNombre_galeria(String Nombre_galeria) {
        this.Nombre_galeria = Nombre_galeria;
    }
    
    
}
