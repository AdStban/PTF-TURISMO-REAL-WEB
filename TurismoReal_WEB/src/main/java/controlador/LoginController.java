package controlador;

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

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = new Usuario();

    int nivel = 0;
    int r = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");
        if (accion.equals("Ingresar")) {

            String correo = request.getParameter("txtCorreo");
            String pass = request.getParameter("txtPass");

            String passHash = dao.CryptoHash(pass);
            String cryptoPass = passHash.toUpperCase();
            u.setCorreo(correo);
            u.setPass(cryptoPass);

            nivel = dao.validar(u);
            PrintWriter out = response.getWriter();
            //r = dao.validar(u);
            if (nivel != 0) {
                request.getSession().setAttribute("email", correo);
                request.getSession().setAttribute("perfil", nivel);

                //A la variable ID le paso el retorno del metodo retornoId
                u.setCorreo(correo);
                int id = dao.retornoId(u);

                request.getSession().setAttribute("idUsuario", id);

                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                out.println("<script>");
                out.println("$(document).ready(function(){");
                out.println("swal('Logueo exitoso','has iniciado sesión','success');");
                out.println("});");
                out.println("</script>");
                //request.setAttribute("mensaje", "Se ha Logeado correctamente.");
                
                int verificaDatos = dao.existenciaDatosUsuario(id);

                if (verificaDatos != 0) {
                    if (nivel == 2) {
                        RequestDispatcher rd = request.getRequestDispatcher("homeFuncionario.jsp");
                        rd.include(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                        rd.include(request, response);
                    }
                } else {
                    request.getRequestDispatcher("registroDatosPersona.jsp").forward(request, response);
                }

            } else {
                out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>");
                out.println("<script src='https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js'></script>");
                out.println("<script>");
                out.println("$(document).ready(function(){");
                out.println("swal('Datos incorrectos','El correo y/o contraseña no coinciden','error');");
                out.println("});");
                out.println("</script>");
                //request.setAttribute("mensaje", "El correo y/o contraseña no coinciden.");

                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
            }

        } else {
            r = 0;
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
