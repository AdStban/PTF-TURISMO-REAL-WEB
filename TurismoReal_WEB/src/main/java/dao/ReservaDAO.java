package dao;

import clases.Conexion;
import clases.DetalleReserva;
import clases.Reserva;
import clases.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.*;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
    
     public int registrarServicio(int de,int se) {
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
    
    public void enviarCorreoReserva(String from, String pass, String[] to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";

        props.put("mail.smtp.starttls.enable", "true");

        props.put("mail.smtp.ssl.trust", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {

            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for (int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            message.setSubject(subject);
            message.setText(body);

            Transport transport = session.getTransport("smtp");

            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

        } catch (AddressException ae) {
            ae.printStackTrace();
        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }
}
