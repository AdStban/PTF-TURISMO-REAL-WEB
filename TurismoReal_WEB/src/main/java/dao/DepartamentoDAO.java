package dao;

import clases.Conexion;
import clases.Departamento;
import clases.Galeria;
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
    int respuesta;

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

    public List<Departamento> buscarDepartamento(String lugar, Date desde, Date hasta) {

        String sql = "SELECT d.ID_DEPARTAMENTO, d.COSTO_DEPARTAMENTO,d.TIPO_DEPARTAMENTO, d.DIRECCION_DEPARTAMENTO,c.NOMBRE_COMUNA,i.DORMITORIO_INVENTARIO,i.BANIO_INVENTARIO\n"
                + "FROM DEPARTAMENTO d join comuna c on d.ID_COMUNA=c.ID_COMUNA \n"
                + "join INVENTARIO i on d.ID_DEPARTAMENTO=i.ID_DEPARTAMENTO\n"
                + "LEFT join DETALLE_RESERVA dr on d.ID_DEPARTAMENTO = dr.ID_DEPARTAMENTO\n"
                + "left join RESERVA r on dr.ID_RESERVA=r.ID_RESERVA \n"
                + "where r.fechain_reserva not between  ? and ? \n"
                + "and r.fechater_reserva not BETWEEN ? and ? \n"
                + "and LOWER(c.nombre_comuna) = LOWER(?) GROUP by d.ID_DEPARTAMENTO, d.COSTO_DEPARTAMENTO,d.TIPO_DEPARTAMENTO, d.DIRECCION_DEPARTAMENTO,c.NOMBRE_COMUNA,i.DORMITORIO_INVENTARIO,i.BANIO_INVENTARIO";
        List<Departamento> lista = new ArrayList();
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setDate(1, new java.sql.Date(desde.getTime()));
            ps.setDate(2, new java.sql.Date(hasta.getTime()));
            ps.setDate(3, new java.sql.Date(desde.getTime()));
            ps.setDate(4, new java.sql.Date(hasta.getTime()));
            ps.setString(5, lugar);

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

    public int registrarImagen(Galeria ga) {
        String sql = "INSERT INTO GALERIA (ID_GALERIA,UBICACION_GALERIA, ID_DEPARTAMENTO,NOMBRE_GALERIA) VALUES (SQ_IDGALERIA.nextval,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, ga.getUbicacion());
            ps.setInt(2, ga.getId_depto());
            ps.setString(3, ga.getNom_foto());

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

    public List<Galeria> obtenerImagen(int codigo) {

        String sql = "select UBICACION_GALERIA from galeria\n"
                + "where ID_DEPARTAMENTO=? and ROWNUM=1";
        List<Galeria> lista = new ArrayList();
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);

            rs = ps.executeQuery();
            while (rs.next()) {
                Galeria ga = new Galeria();
                ga.setUbicacion(rs.getString(1));
                
                lista.add(ga);
            }

        } catch (Exception e) {
        }
        return lista;
    }
    
    public List<Galeria> obtenerTodasLasImagenes(int codigo) {

        String sql = "select UBICACION_GALERIA from galeria\n"
                + "where ID_DEPARTAMENTO=?";
        List<Galeria> lista = new ArrayList();
        try {
            r = 0;
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, codigo);

            rs = ps.executeQuery();
            while (rs.next()) {
                Galeria ga = new Galeria();
                ga.setUbicacion(rs.getString(1));
                
                lista.add(ga);
            }

        } catch (Exception e) {
        }
        return lista;
    }

}
