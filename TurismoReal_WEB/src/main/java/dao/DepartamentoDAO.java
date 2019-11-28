package dao;

import clases.Conexion;
import clases.Departamento;
import clases.Usuario;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import java.util.List;

public class DepartamentoDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<Departamento> listar() {
        String sql = "SELECT d.ID_DEPARTAMENTO, d.COSTO_DEPARTAMENTO,d.TIPO_DEPARTAMENTO, d.DIRECCION_DEPARTAMENTO,c.NOMBRE_COMUNA,i.DORMITORIO_INVENTARIO,i.BANIO_INVENTARIO\n"
                + "FROM DEPARTAMENTO d join comuna c on d.ID_COMUNA=c.ID_COMUNA \n"
                + "join INVENTARIO i on d.ID_DEPARTAMENTO=i.ID_DEPARTAMENTO";
        List<Departamento> lista = new ArrayList();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Departamento d = new Departamento();
                d.setId_departamento(rs.getInt(1));
                d.setCosto_departamento(rs.getInt(2));
                d.setTipo_departamento(rs.getString(3));
                d.setDireccion_departamento(rs.getString(4));
                d.setNom_comuna(rs.getString(5));
                d.setHabitaciones(rs.getInt(6));
                d.setBanio(rs.getInt(7));
                lista.add(d);
            }
        } catch (Exception e) {
        }

        return lista;
    }

    public List<Departamento> obtenerDepartamento(int codigo) {

        String sql = "SELECT d.ID_DEPARTAMENTO, d.COSTO_DEPARTAMENTO,d.TIPO_DEPARTAMENTO, d.DIRECCION_DEPARTAMENTO,c.NOMBRE_COMUNA,i.DORMITORIO_INVENTARIO\n"
                + "FROM DEPARTAMENTO d join comuna c on d.ID_COMUNA=c.ID_COMUNA \n"
                + "join INVENTARIO i on d.ID_DEPARTAMENTO=i.ID_DEPARTAMENTO\n"
                + "where d.ID_departamento =?";
        List<Departamento> lista = new ArrayList();
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);

            rs = ps.executeQuery();
            while (rs.next()) {
                Departamento d = new Departamento();
                d.setId_departamento(rs.getInt(1));
                d.setCosto_departamento(rs.getInt(2));
                d.setTipo_departamento(rs.getString(3));
                d.setDireccion_departamento(rs.getString(4));
                d.setNom_comuna(rs.getString(5));
                d.setHabitaciones(rs.getInt(6));
                lista.add(d);
            }

        } catch (Exception e) {
        }
        return lista;
    }

    public List<Departamento> buscarDepartamento(String lugar, Date fecha) {

        String sql = "select d.ID_DEPARTAMENTO,d.COSTO_DEPARTAMENTO,d.TIPO_DEPARTAMENTO,d.DIRECCION_DEPARTAMENTO,c.NOMBRE_COMUNA,i.DORMITORIO_INVENTARIO,i.BANIO_INVENTARIO\n"
                + "from reserva r \n"
                + "join REGISTRO_RESERVA rr on r.ID_RESERVA = rr.ID_RESERVA\n"
                + "join DEPARTAMENTO d on rr.ID_DEPARTAMENTO = d.ID_DEPARTAMENTO\n"
                + "join comuna c on d.ID_COMUNA = c.ID_COMUNA \n"
                + "join INVENTARIO i on d.ID_DEPARTAMENTO = i.ID_DEPARTAMENTO\n"
                + "where lower(c.NOMBRE_COMUNA) = lower(?) \n"
                + "and ? not between r.fechain_reserva and r.fechater_reserva";
        List<Departamento> lista = new ArrayList();
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, lugar);
            ps.setDate(2, new java.sql.Date(fecha.getTime()));
            

            rs = ps.executeQuery();
            while (rs.next()) {
                Departamento d = new Departamento();
                d.setId_departamento(rs.getInt(1));
                d.setCosto_departamento(rs.getInt(2));
                d.setTipo_departamento(rs.getString(3));
                d.setDireccion_departamento(rs.getString(4));
                d.setNom_comuna(rs.getString(5));
                d.setHabitaciones(rs.getInt(6));
                d.setBanio(rs.getInt(7));
                lista.add(d);
            }

        } catch (Exception e) {
        }
        return lista;
    }

}
