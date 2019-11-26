package dao;

import clases.Conexion;
import clases.Persona;
import clases.Usuario;
import clases.Validar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import oracle.jdbc.OracleTypes;
import java.security.MessageDigest;

public class UsuarioDAO implements Validar {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    String msg;
    int respuesta;
    int nivel = 0;
    Usuario u = new Usuario();
    int id = 0;

    //Registrar Usuario
    public String registrar(Usuario u) {
        String sql = "INSERT INTO usuario (ID_USUARIO, CORREO_USUARIO, CONTRASENA_USUARIO, ESTADO_USUARIO, ID_PERFIL) VALUES (sq_idUsuario.nextval,?,?,1,3)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getCorreo());
            ps.setString(2, u.getPass());
            respuesta = ps.executeUpdate();

            if (respuesta == 1) {
                msg = "Usuario registrado correctamente.";
            } else {
                msg = "Ha ocurrido un error al registrar el usuario.";
            }
        } catch (Exception e) {

        }
        return msg;
    }

    //Registrar Datos de Persona
    public String registrarDatos(Persona p) {
        String sql = "INSERT INTO datos_persona (ID_DATOS, RUT_DATOS, NOMBRE_DATOS, APELLIDOPA_DATOS, APELLIDOMA_DATOS, CONTACTO_DATOS, FECHANAC_DATOS, DIRECCION_DATOS, ID_USUARIO) VALUES (SQ_IDDATOS.nextval,?,?,?,?,?,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getRut());
            ps.setString(2, p.getNombre());
            ps.setString(3, p.getApellido_pa());
            ps.setString(4, p.getApellido_ma());
            ps.setString(5, p.getContacto());
            ps.setDate(6, new java.sql.Date(p.getFecha_nacimiento().getTime()));
            ps.setString(7, p.getDireccion());
            ps.setInt(8, p.getId_usuario());
            respuesta = ps.executeUpdate();

            if (respuesta == 1) {
                msg = "Datos registrados exitosamente";
            } else {
                msg = "Ha ocurrido un error al los datos";
            }
        } catch (Exception e) {

        }
        return msg;
    }

    //Valida existencia
    public int validaExistencia(String correo) {
        //CachedRowSetImpl crs=null;
        int i = 0;
        try {
            con = cn.getConnection();
            CallableStatement cst = con.prepareCall("{call pkg_comun.sp_validaExistencia (?,?)}");

            cst.registerOutParameter(1, OracleTypes.CURSOR);
            cst.setString(2, correo);

            cst.executeQuery();

            ResultSet cursor = (ResultSet) cst.getObject(1);
            while (cursor.next()) {
                i = i + 1;
            }
            //crs = new CachedRowSetImpl();
            //crs.populate(cursor);

        } catch (SQLException ex) {
            ex.getMessage();
        }
        return i;
    }

    @Override
    public int validar(Usuario us) {
        String sql = "select id_perfil from usuario where correo_usuario=? and contrasena_usuario=?";

        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, us.getCorreo());
            ps.setString(2, us.getPass());
            rs = ps.executeQuery();

            while (rs.next()) {
                nivel = rs.getInt(1);
                r = r + 1;
                us.setCorreo("correo_usuario");
                us.setPass("contrasena_usuario");

            }
            if (r == 1) {
                return nivel;
            } else {
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }
    }

    //Retorno de ID sesion iniciada
    public int retornoId(Usuario u) {
        String sql = "select id_usuario from usuario where correo_usuario=?";

        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, u.getCorreo());

            rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt(1);
                r = r + 1;
                u.setCorreo("correo_usuario");

            }
            if (r == 1) {
                return id;
            } else {
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }
    }
    //Método para aplicar Hash a las contraseñas
    public String CryptoHash(String base) {
        try{
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(base.getBytes("UTF-8"));
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < hash.length; i++) {
                String hex = Integer.toHexString(0xff & hash[i]);
                if(hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }

            return hexString.toString();
        } catch(Exception ex){
           throw new RuntimeException(ex);
        }
    }  
    
}
