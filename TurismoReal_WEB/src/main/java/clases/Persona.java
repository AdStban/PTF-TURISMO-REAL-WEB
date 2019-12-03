package clases;
import java.util.Date;


public class Persona {
    int id_datos,id_usuario;
    String rut, nombre,apellido_pa, apellido_ma,contacto,direccion;
    Date fecha_nacimiento;
    
    public Persona(){}
    
    public Persona(int id_datos, int id_usuario, String rut, String nombre, String apellido_pa, String apellido_ma, String contacto, String direccion, Date fecha_nacimiento) {
        this.id_datos = id_datos;
        this.id_usuario = id_usuario;
        this.rut = rut;
        this.nombre = nombre;
        this.apellido_pa = apellido_pa;
        this.apellido_ma = apellido_ma;
        this.contacto = contacto;
        this.direccion = direccion;
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public Persona(int id_usuario, String rut, String nombre, String contacto, String direccion) {
        this.id_usuario = id_usuario;
        this.rut = rut;
        this.nombre = nombre;
        this.contacto = contacto;
        this.direccion = direccion;
    }
    
    
    
    public int getId_datos() {
        return id_datos;
    }

    public void setId_datos(int id_datos) {
        this.id_datos = id_datos;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_pa() {
        return apellido_pa;
    }

    public void setApellido_pa(String apellido_pa) {
        this.apellido_pa = apellido_pa;
    }

    public String getApellido_ma() {
        return apellido_ma;
    }

    public void setApellido_ma(String apellido_ma) {
        this.apellido_ma = apellido_ma;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Date getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(Date fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }
}
