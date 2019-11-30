/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import clases.Departamento;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.DepartamentoDAO;

import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.Date;

import java.util.List;

/**
 *
 * @author Adán Esteban
 */
@WebServlet(name = "BusquedaController", urlPatterns = {"/BusquedaController"})
public class BusquedaController extends HttpServlet {

    DepartamentoDAO dao = new DepartamentoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        try {
            DateFormat format = null;
            String[] fecha_i = request.getParameter("txtDesde").split("/");

            String[] fecha_t = request.getParameter("txtHasta").split("/");

            if (fecha_i.length > 1 && fecha_t.length > 1) {
                if (fecha_i[0].length() > 2 && fecha_t[0].length() > 2) {
                    format = new SimpleDateFormat("yy/MM/dd");
                } else {
                    format = new SimpleDateFormat("dd/MM/yy");
                }
            } else {
                fecha_i = request.getParameter("txtDesde").split("-");
                fecha_t = request.getParameter("txtHasta").split("-");
                if (fecha_i[0].length() > 2 && fecha_t[0].length() > 2) {
                    format = new SimpleDateFormat("yy-MM-dd");
                } else {
                    format = new SimpleDateFormat("dd-MM-yy");
                }
            }

            Date desde = format.parse(request.getParameter("txtDesde"));
            //Date desde2 = desde1;
            Date hasta = format.parse(request.getParameter("txtHasta"));
            //Date hasta2 = hasta1;
            String lugar = request.getParameter("slcLugar");

            request.getSession().setAttribute("fechadesde", desde);
            request.getSession().setAttribute("fechahasta", hasta);
            request.getSession().setAttribute("nomlugar", lugar);

            //
            String textoResultado;
            List<Departamento> verifica = dao.buscarDepartamento(lugar, desde, hasta);

            if (verifica != null) {
                textoResultado = "Resultados de la búsqueda";
                request.getSession().setAttribute("msgResultado", textoResultado);
                request.getRequestDispatcher("resultadoBusqueda.jsp").forward(request, response);
            } else {
                textoResultado = "No existe disponibilidad para la fecha ingresada";
                request.getSession().setAttribute("msgResultado", textoResultado);
                request.getRequestDispatcher("resultadoBusqueda.jsp").forward(request, response);
            }

            /*
                textoResultado = "Resultados de la busqueda";
                request.getSession().setAttribute("msgResultado", textoResultado);
                request.getRequestDispatcher("resultadoBusqueda.jsp").forward(request, response);
            }else{
                textoResultado = "No se encontraron resultados";
                request.getSession().setAttribute("msgResultado", textoResultado);
                request.getRequestDispatcher("resultadoBusqueda.jsp").forward(request, response);
            }*/
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
