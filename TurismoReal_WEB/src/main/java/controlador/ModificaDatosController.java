/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.Persona;
import clases.Usuario;
import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ModificaDatosController", urlPatterns = {"/ModificaDatosController"})
public class ModificaDatosController extends HttpServlet {

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

            String rut = request.getParameter("txtRut");
            String nombre = request.getParameter("txtNombre");
            String contacto = request.getParameter("txtTelefono");
            String direccion = request.getParameter("txtDireccion");

            String correo = request.getParameter("txtCorreo");

            u.setCorreo(correo);
            id = dao.retornoId(u);
            
            p.setRut(rut);
            p.setNombre(nombre);
            p.setContacto(contacto);
            p.setDireccion(direccion);
            p.setId_usuario(id);

            int verifica = dao.modificaDatos(p);

            int rol = (Integer) request.getSession().getAttribute("perfil");

            if (verifica == 1) {

                if (rol == 1 || rol == 3) {
                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal('Registro exitoso','Se han modificado correctamente los datos','success');");
                    out.println("});");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                    rd.include(request, response);
                } else {
                    out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                    out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                    out.println("<script>");
                    out.println("$(document).ready(function(){");
                    out.println("swal('Registro exitoso','Se han modificado correctamente los datos','success');");
                    out.println("});");
                    out.println("</script>");
                    RequestDispatcher rd = request.getRequestDispatcher("homeFuncionario.jsp");
                    rd.include(request, response);
                }

            } else {

                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                out.println("<script>");
                out.println("$(document).ready(function(){");
                out.println("swal('Error','Ha ocurrido un error al modificar los datos','error');");
                out.println("});");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("modificarDatosPersonales.jsp");
                rd.include(request, response);
            }

        } catch (Exception e) {
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
