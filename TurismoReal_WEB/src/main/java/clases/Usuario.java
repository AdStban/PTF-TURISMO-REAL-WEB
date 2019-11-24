package clases;

public class Usuario {
    
    int id_usuario;
    String correo;
    String pass;
    char estado_usuario;
    int id_perfil;

    public Usuario() {
    }
    
    public Usuario(int id_usuario, String correo, String pass, char estado_usuario, int id_perfil) {
        this.id_usuario = id_usuario;
        this.correo = correo;
        this.pass = pass;
        this.estado_usuario = estado_usuario;
        this.id_perfil = id_perfil;
    }
    
     public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public char getEstado_usuario() {
        return estado_usuario;
    }

    public void setEstado_usuario(char estado_usuario) {
        this.estado_usuario = estado_usuario;
    }

    public int getId_perfil() {
        return id_perfil;
    }
    
    public void setId_perfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }
}
