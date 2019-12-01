/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
import clases.Conexion;
import clases.Galeria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import org.apache.commons.net.ftp.FTPClient;
import java.util.List;
import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPReply;

/**
 *
 * @author joser
 */
public class GaleriaDAO {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    FTPClient ftp;
    String urlFtp ="ftp://ftp.webcindario.com/imgDepartamentos/";
    String usuario="ptfarriendos2019";
    String pass="Termicl1";
    String rutaLocal="./TurismoReal_WEB/src/main/webapp/0sset/img/";
    
    public List<Galeria> ListaGaleria(){
        String sql = "select ID_GALERIA,UBICACION_GALERIA,ID_DEPARTAMENTO,NOMBRE_GALERIA from galeria;";
        List<Galeria> lista = new ArrayList();
        
        try{
            con = cn.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                Galeria g = new Galeria();
                g.setId_galeria(rs.getInt(1));
                g.setUbicacion_galeria(rs.getString(2));
                g.setId_departamento(rs.getInt(3));
                g.setNombre_galeria(rs.getString(4));
                
                lista.add(g);
            }
            
            
        }catch(Exception ex){
        }
        return lista;
    }

    public void CargaCarpetaGaleria() throws IOException{
        ConectarYDescargar(usuario, pass, urlFtp);
    }
    
    public void ConectarYDescargar(String usuario,String pass,String server) throws IOException{
        ftp = new FTPClient();
        int reply;
        try{
            ftp.connect(server);
            ftp.login(usuario, pass);
            reply = ftp.getReplyCode();
            ftp.enterLocalPassiveMode();
            ftp.setFileType(FTP.BINARY_FILE_TYPE);
            
            if(FTPReply.isPositiveCompletion(reply)){
                DescargarFTP("5-depa005.jpg",rutaLocal+"5-depa005.jpg");
            }else{
                ftp.disconnect();
            }
            
        }catch(Exception ex){
            
        }finally{
            ftp.disconnect();
        }

    }
    
    public void DescargarFTP(String source,String destination){
        try (FileOutputStream fos = new FileOutputStream(destination)) {
            this.ftp.retrieveFile(source, fos);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    

}
