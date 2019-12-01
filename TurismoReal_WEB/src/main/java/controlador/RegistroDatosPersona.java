package controlador;

import clases.Persona;
import clases.Usuario;
import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Adán Esteban
 */
@WebServlet(name = "RegistroDatosPersona", urlPatterns = {"/RegistroDatosPersona"})
public class RegistroDatosPersona extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    Persona p = new Persona();
    Usuario u = new Usuario();
    int id = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {

            //Formateo de fecha para insertar en la BD
            DateFormat df = null;
            String[] fechaDescompuesta = request.getParameter("dateFechaNac").split("/");
            if (fechaDescompuesta.length > 1) {
                if (fechaDescompuesta[0].length() > 2) {
                    df = new SimpleDateFormat("yy/MM/dd");
                } else {
                    df = new SimpleDateFormat("dd/MM/yy");
                }
            } else {
                fechaDescompuesta = request.getParameter("dateFechaNac").split("-");
                if (fechaDescompuesta[0].length() > 2) {
                    df = new SimpleDateFormat("yy-MM-dd");
                } else {
                    df = new SimpleDateFormat("dd-MM-yy");
                }
            }

            //Paso de los parametros desde el HTML a variables
            Date fecha = df.parse(request.getParameter("dateFechaNac"));
            String rut = request.getParameter("txtRut");
            String nombre = request.getParameter("txtNombre");
            String apPaterno = request.getParameter("txtApellidoPa");
            String apMaterno = request.getParameter("txtApellidoMa");
            String contacto = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");

            //Correo para obtener la id de la sesion iniciada
            String correo = request.getParameter("txtCorreo");
            //A la variable ID le paso el retorno del metodo retornoId
            u.setCorreo(correo);
            id = dao.retornoId(u);

            //Seteo las variables
            p.setRut(rut);
            p.setNombre(nombre);
            p.setApellido_pa(apPaterno);
            p.setApellido_ma(apMaterno);
            p.setContacto(contacto);
            p.setDireccion(direccion);
            p.setFecha_nacimiento(fecha);
            p.setId_usuario(id);
            //Envio los datos de la variable P, para insertarlos en la BD    
            dao.registrarDatos(p);

            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('Registro exitoso','Se han registrado correctamente los datos','success');");
            out.println("});");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
            rd.include(request, response);

        } catch (Exception e) {
            out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
            out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("swal('Error','Ha ocurrido un error al registrar los datos','error');");
            out.println("});");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("registroDatosPersona.jsp");
            rd.include(request, response);

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
