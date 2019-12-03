package dao;

import clases.Conexion;
import clases.DetalleReserva;
import clases.Reserva;
import clases.ServicioExtra;
import clases.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    String msg;
    int respuesta;

    int r = 0;
    int id = 0;

    Reserva re = new Reserva();
    DetalleReserva dr = new DetalleReserva();

    public int registrarReserva(Reserva re) {
        String sql = "INSERT INTO RESERVA (ID_RESERVA,ID_USUARIO, FECHAIN_RESERVA,DIAS_RESERVA,CANTPERSONAS_RESERVA,FECHATER_RESERVA) VALUES (sq_idReserva.nextval,?,?,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, re.getId_usuario());
            ps.setDate(2, new java.sql.Date(re.getFechain_reserva().getTime()));
            ps.setInt(3, re.getDias_reserva());
            ps.setInt(4, re.getCantpersonas_reserva());
            ps.setDate(5, new java.sql.Date(re.getFechater_reserva().getTime()));
            respuesta = ps.executeUpdate();

            if (respuesta == 1) {
                return 1;
            } else {
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }

    }

    public int retornaIdReserva() {

        String cadena = "select max(ID_RESERVA)from reserva";
        try {
            int res = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(cadena);
            rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt(1);
                res = res + 1;

            }
            if (res == 1) {
                return id;
            } else {
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }
    }

    //
    public String registrarDetalle(DetalleReserva dr) {
        String cadena = "INSERT INTO DETALLE_RESERVA (ID_DETALLE,TOTAL_DETALLE,ABONO_DETALLE,RESTANTE_DETALLE,ID_DEPARTAMENTO,ID_RESERVA) VALUES (SQ_IDDETALLE.nextval,?,?,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(cadena);
            ps.setInt(1, dr.getTotal_detalle());
            ps.setInt(2, dr.getAbono_detalle());
            ps.setInt(3, dr.getRestante_detalle());
            ps.setInt(4, dr.getId_departamento());
            ps.setInt(5, dr.getId_reserva());

            respuesta = ps.executeUpdate();

            if (respuesta == 1) {
                msg = "Detalle registrado correctamente.";
            } else {
                msg = "Ha ocurrido un error al registrar el detalle.";
            }
        } catch (Exception e) {
            msg = "Ha ocurrido un error al registrar el detalle.";
        }
        return msg;
    }
    int valor = 0;

    public int retornoValorServicio(int i) {
        String sql = "select COSTO_SERVICIO from SERVICIO_EXTRA WHERE ID_SERVICIO=?";

        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, i);

            rs = ps.executeQuery();

            while (rs.next()) {
                valor = rs.getInt(1);
                r = r + 1;
            }
            if (r == 1) {
                return valor;
            } else {
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }
    }

    public int retornaIdDetalle() {

        String cadena = "select max(ID_DETALLE) from DETALLE_RESERVA";
        try {
            int res = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(cadena);
            rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getInt(1);
                res = res + 1;

            }
            if (res == 1) {
                return id;
            } else {
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }
    }

    public int registrarServicio(int de, int se) {
        String sql = "INSERT INTO DR_SERVICIO (ID_DETALLE,ID_SERVICIO) VALUES (?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, de);
            ps.setInt(2, se);

            respuesta = ps.executeUpdate();

            if (respuesta == 1) {
                return 1;
            } else {
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }

    }

    public int registroReserva(int de, int re) {
        String sql = "INSERT INTO REGISTRO_RESERVA (ID_REGISTRO,FECHA_RESERVA,ID_DEPARTAMENTO,ID_RESERVA) VALUES (sq_reservaRegistro.nextval,sysdate,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, de);
            ps.setInt(2, re);

            respuesta = ps.executeUpdate();

            if (respuesta == 1) {
                return 1;
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

    public List<ServicioExtra> obtenerDatosServicio(int idServicio) {

        String sql = "select ID_SERVICIO,DESCRIPCION_SERVICIO,COSTO_SERVICIO from SERVICIO_EXTRA WHERE ID_SERVICIO=?";
        List<ServicioExtra> lista = new ArrayList();
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, idServicio);

            rs = ps.executeQuery();
            while (rs.next()) {
                ServicioExtra se = new ServicioExtra();
                se.setId_servicio(rs.getInt(1));
                se.setDescripcion(rs.getString(2));
                se.setCosto_servicio(rs.getInt(3));
                lista.add(se);
            }

        } catch (Exception e) {
        }
        return lista;
    }

    public List obtenerDatosReserva(String correo) {

        String sql = "select rr.FECHA_RESERVA,co.NOMBRE_COMUNA,dr.TOTAL_DETALLE,dr.RESTANTE_DETALLE,dr.ABONO_DETALLE,r.FECHAIN_RESERVA||' al '||r.FECHATER_RESERVA\n"
                + "from REGISTRO_RESERVA rr \n"
                + "join RESERVA r on rr.ID_RESERVA = r.ID_RESERVA\n"
                + "join DEPARTAMENTO d on rr.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO \n"
                + "join COMUNA co on d.ID_COMUNA = co.ID_COMUNA\n"
                + "join DETALLE_RESERVA dr on r.ID_RESERVA = dr.ID_RESERVA\n"
                + "join USUARIO us on r.ID_USUARIO = us.ID_USUARIO\n"
                + "where us.CORREO_USUARIO = ?";
        
        List lista = new ArrayList();
        
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, correo);

            rs = ps.executeQuery();
            while (rs.next()) {

                lista.add(rs.getDate(1));
                lista.add(rs.getString(2));
                lista.add(rs.getInt(3));
                lista.add(rs.getInt(4));
                lista.add(rs.getInt(5));
                lista.add(rs.getString(6));

            }

        } catch (Exception e) {
        }
        return lista;
    }

}
