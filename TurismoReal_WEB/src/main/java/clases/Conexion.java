package clases;

import java.sql.Connection;
import java.sql.DriverManager;


public class Conexion {

    Connection con;

    public Connection getConnection() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@ptfawscerv2019.c4m8bxq2fyap.us-east-1.rds.amazonaws.com:1521:ORCL", "admin", "Termicl1");

            if (con != null) {
                System.out.println("Se ha establecido la conexión correctamente a la Base de Datos.");
            } else {
                System.out.println("Ha ocurrido un error al establecer la conexión a la Base de Datos.");
            }
        } catch (Exception e) {
            System.out.println("Error desconocido" + e.getMessage());
        }
        return con;
    }
}
