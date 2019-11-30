/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import clases.Conexion;
import clases.ServicioExtra;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Adán Esteban
 */
public class ServicioDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<ServicioExtra> listar() {
        String sql = "select ID_SERVICIO,DESCRIPCION_SERVICIO,COSTO_SERVICIO \n"
                + "from SERVICIO_EXTRA\n"
                + "order by COSTO_SERVICIO";
        List<ServicioExtra> lista = new ArrayList();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
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

}
