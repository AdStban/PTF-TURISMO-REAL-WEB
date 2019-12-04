package dao;

import clases.Conexion;
import clases.Revision;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RevisionDAO {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    int respuesta;
    Revision r = new Revision();
    
    public int registrarRevision(Revision re) {
        String sql = "INSERT INTO REVISION (ID_REVISION, ESTADO_REVISION, DETALLE_SALIDA, ID_DETALLE) VALUES (SQ_IDREVISION.nextval,?,?,?)";

        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, re.getEstado_revision());
            ps.setString(2, re.getDetalle_salida());
            ps.setInt(3, re.getId_detalle());
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
}
