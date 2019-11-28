/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import clases.Comuna;
import clases.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Adán Esteban
 */
public class ComunaDAO {

    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public List<Comuna> listar() {
        String sql = "select c.ID_COMUNA,c.NOMBRE_COMUNA,c.id_region \n"
                + "from comuna c \n"
                + "join DEPARTAMENTO d on c.ID_COMUNA = d.ID_COMUNA\n"
                + "order by NOMBRE_COMUNA";
        List<Comuna> lista = new ArrayList();

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Comuna c = new Comuna();
                c.setId_comuna(rs.getInt(1));
                c.setNombre_comuna(rs.getString(2));
                c.setId_region(rs.getInt(3));

                lista.add(c);
            }
        } catch (Exception e) {
        }

        return lista;
    }

}
