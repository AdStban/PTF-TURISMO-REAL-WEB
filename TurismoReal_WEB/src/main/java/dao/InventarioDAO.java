package dao;

import clases.Conexion;
import clases.Inventario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InventarioDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<Inventario> listarInventario() {
        String sql = "SELECT I.ID_INVENTARIO, D.ID_DEPARTAMENTO, I.INTERNET_INVENTARIO, I.BANIO_INVENTARIO, I.DORMITORIO_INVENTARIO, I.TELEVISOR_INVENTARIO, I.MESA_INVENTARIO, I.ASIENTO_INVENTARIO, I.MUEBLE_INVENTARIO,R.FECHAIN_RESERVA||' - '||R.FECHATER_RESERVA\n"
                + "FROM DEPARTAMENTO D INNER JOIN INVENTARIO I ON D.ID_DEPARTAMENTO=I.ID_DEPARTAMENTO\n"
                + "JOIN DETALLE_RESERVA DR ON D.ID_DEPARTAMENTO = DR.ID_DEPARTAMENTO\n"
                + "JOIN RESERVA R ON DR.ID_RESERVA = R.ID_RESERVA";

        List<Inventario> lst = new ArrayList();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Inventario i = new Inventario();

                i.setId_inventario(rs.getInt(1));
                i.setId_departamento(rs.getInt(2));
                i.setInternet_inventario(rs.getInt(3));
                i.setBanio_inventario(rs.getInt(4));
                i.setDormitorio_inventario(rs.getInt(5));
                i.setTelevisor_inventario(rs.getInt(6));
                i.setMesa_inventario(rs.getInt(7));
                i.setAsiento_inventario(rs.getInt(8));
                i.setMueble_inventario(rs.getInt(9));
                i.setDetalle_fecha(rs.getString(10));
                lst.add(i);
            }
        } catch (Exception e) {
        }

        return lst;
    }

    public List<Inventario> obtenerIdInventario(int codigo) {

        String sql = "SELECT I.ID_INVENTARIO, D.ID_DEPARTAMENTO, I.INTERNET_INVENTARIO, I.BANIO_INVENTARIO, I.DORMITORIO_INVENTARIO, I.TELEVISOR_INVENTARIO, I.MESA_INVENTARIO, I.ASIENTO_INVENTARIO, I.MUEBLE_INVENTARIO\n"
                + "FROM DEPARTAMENTO D INNER JOIN INVENTARIO I ON D.ID_DEPARTAMENTO=I.ID_DEPARTAMENTO \n"
                + "WHERE I.ID_INVENTARIO = ?";

        List<Inventario> lst = new ArrayList();
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);

            rs = ps.executeQuery();
            while (rs.next()) {
                Inventario i = new Inventario();

                i.setId_inventario(rs.getInt(1));
                i.setId_departamento(rs.getInt(2));
                i.setInternet_inventario(rs.getInt(3));
                i.setBanio_inventario(rs.getInt(4));
                i.setDormitorio_inventario(rs.getInt(5));
                i.setTelevisor_inventario(rs.getInt(6));
                i.setMesa_inventario(rs.getInt(7));
                i.setAsiento_inventario(rs.getInt(8));
                i.setMueble_inventario(rs.getInt(9));
                lst.add(i);
            }

        } catch (Exception e) {
        }
        return lst;
    }

    public List<Inventario> listarCheckOut() {
        String sql = "SELECT D.ID_DEPARTAMENTO, D.TIPO_DEPARTAMENTO ,D.COSTO_DEPARTAMENTO, DR.ID_DETALLE, R.ID_RESERVA, R.ID_USUARIO,R.FECHAIN_RESERVA||' - '||R.FECHATER_RESERVA \n"
                + "FROM DEPARTAMENTO D INNER JOIN DETALLE_RESERVA DR ON (D.ID_DEPARTAMENTO=DR.ID_DEPARTAMENTO)\n"
                + "INNER JOIN RESERVA R ON (DR.ID_RESERVA=R.ID_RESERVA)";

        List<Inventario> lst = new ArrayList();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Inventario i = new Inventario();

                i.setId_departamento(rs.getInt(1));
                i.setTipo_departamento(rs.getString(2));
                i.setCosto(rs.getInt(3));
                i.setId_detalle(rs.getInt(4));
                i.setId_reserva(rs.getInt(5));
                i.setId_usuario(rs.getInt(6));
                i.setDetalle_fecha(rs.getString(7));
                lst.add(i);
            }
        } catch (Exception e) {
        }

        return lst;
    }

    public List<Inventario> listarIdCheckOut(int codigo) {
        String sql = "SELECT D.ID_DEPARTAMENTO, D.TIPO_DEPARTAMENTO ,D.COSTO_DEPARTAMENTO, DR.ID_DETALLE, R.ID_RESERVA, R.ID_USUARIO FROM DEPARTAMENTO D INNER JOIN DETALLE_RESERVA DR \n"
                + "ON (D.ID_DEPARTAMENTO=DR.ID_DEPARTAMENTO)\n"
                + "INNER JOIN RESERVA R ON (DR.ID_RESERVA=R.ID_RESERVA)\n"
                + "WHERE D.ID_DEPARTAMENTO = ?";

        List<Inventario> lst = new ArrayList();
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);

            rs = ps.executeQuery();
            while (rs.next()) {
                Inventario i = new Inventario();

                i.setId_departamento(rs.getInt(1));
                i.setTipo_departamento(rs.getString(2));
                i.setCosto(rs.getInt(3));
                i.setId_detalle(rs.getInt(4));
                i.setId_reserva(rs.getInt(5));
                i.setId_usuario(rs.getInt(6));
                lst.add(i);
            }

        } catch (Exception e) {
        }
        return lst;
    }
}
