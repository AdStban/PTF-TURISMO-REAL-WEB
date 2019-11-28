package controlador;

import clases.DetalleReserva;
import clases.Reserva;
import dao.ReservaDAO;
import clases.Usuario;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ReservaController", urlPatterns = {"/ReservaController"})
public class ReservaController extends HttpServlet {

    ReservaDAO dao = new ReservaDAO();
    Reserva re = new Reserva();
    DetalleReserva dr = new DetalleReserva();
    Usuario u = new Usuario();
    int id = 0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        String accion = request.getParameter("accion");
        String opcionServicio = request.getParameter("opcionServicio");

        int valorServicio = 0;

        switch (accion) {
            case "iniciarReserva":

                request.getSession().setAttribute("valor", request.getParameter("txtCosto"));
                request.getSession().setAttribute("lugar", request.getParameter("txtComuna"));
                request.getSession().setAttribute("direccion", request.getParameter("txtDireccion"));
                request.getSession().setAttribute("idDepartamento", request.getParameter("txtIdDepartamento"));
                request.getRequestDispatcher("reserva.jsp").forward(request, response);
                break;
            case "Siguiente":

                request.getSession().setAttribute("dias", request.getParameter("txtDias"));
                request.getSession().setAttribute("personas", request.getParameter("txtPersonas"));
                request.getSession().setAttribute("servicio", opcionServicio);
                int servicio = 0;
                int idServicio = Integer.parseInt(request.getParameter("opcionServicio"));
                int valor = dao.retornoValorServicio(idServicio);
                String nombreServicio;
                if (opcionServicio != null) {
                    if (opcionServicio.equals("1")) {
                        nombreServicio = "Transporte";
                        servicio = 1;
                        request.getSession().setAttribute("nomServicio", nombreServicio);
                        request.getSession().setAttribute("idServicio", servicio);
                        valorServicio = valor;

                    }
                    if (opcionServicio.equals("2")) {
                        nombreServicio = "Paquete turístico";
                        servicio = 2;
                        request.getSession().setAttribute("nomServicio", nombreServicio);
                        request.getSession().setAttribute("idServicio", servicio);
                        valorServicio = valor;
                    }
                    if (opcionServicio.equals("3")) {
                        nombreServicio = "Paquete transporte + paquete turístico";
                        servicio = 3;
                        request.getSession().setAttribute("nomServicio", nombreServicio);
                        request.getSession().setAttribute("idServicio", servicio);
                        valorServicio = valor;
                    }
                } else {
                    valorServicio = 0;
                }

                request.getSession().setAttribute("valorServicio", valorServicio);
                try {
                    DateFormat format = null;
                    String[] fecha_i = request.getParameter("txtFechaDesde").split("/");
                    String[] fecha_t = request.getParameter("txtFechaHasta").split("/");

                    if (fecha_i.length > 1 && fecha_t.length > 1) {
                        if (fecha_i[0].length() > 2 && fecha_t[0].length() > 2) {
                            format = new SimpleDateFormat("yy/MM/dd");
                        } else {
                            format = new SimpleDateFormat("dd/MM/yy");
                        }
                    } else {
                        fecha_i = request.getParameter("txtFechaDesde").split("-");
                        fecha_t = request.getParameter("txtFechaHasta").split("-");
                        if (fecha_i[0].length() > 2 && fecha_t[0].length() > 2) {
                            format = new SimpleDateFormat("yy-MM-dd");
                        } else {
                            format = new SimpleDateFormat("dd-MM-yy");
                        }
                    }

                    Date fecha_inicio = format.parse(request.getParameter("txtFechaDesde"));
                    Date fecha_termino = format.parse(request.getParameter("txtFechaHasta"));

                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yy");
                    String fechad = sdf.format(fecha_inicio);
                    String fechat = sdf.format(fecha_termino);

                    request.getSession().setAttribute("fechaDesde", fechad);
                    request.getSession().setAttribute("fechaHasta", fechat);
                    request.getRequestDispatcher("detalleReserva.jsp").forward(request, response);

                } catch (Exception e) {
                }

                break;
            case "Pagar":
                String opcionPago = request.getParameter("opcionPago");
                request.getSession().setAttribute("optionPayment", opcionPago);
                int total = Integer.parseInt(request.getParameter("txtTotalPagar"));
                request.getSession().setAttribute("totalPago", total);
                if (opcionPago != null) {
                    int abonoEntero = 0;
                    if (opcionPago.equals("pagoTotal")) {
                        request.getSession().setAttribute("totalWebpay", total);
                        request.getRequestDispatcher("webpay/WebPayNormal.jsp").forward(request, response);
                    }
                    if (opcionPago.equals("abono")) {
                        int abono = (int) Math.round(total * 0.50);
                        abonoEntero = (Integer) abono;
                        request.getSession().setAttribute("totalWebpay", abonoEntero);

                        request.getRequestDispatcher("webpay/WebPayNormal.jsp").forward(request, response);
                    }
                    request.getSession().setAttribute("abono", abonoEntero);
                } else {
                    request.setAttribute("mensaje", "Ha ocurrido un error, ");
                    request.getRequestDispatcher("detalleReserva.jsp").forward(request, response);
                }

                break;
            case "registrarReserva":
                this.registrarReserva(request, response);
                break;
            case "enviarCorreo":
                this.enviarCorreo(request, response);
                break;

            default:
        }

    }

    private void registrarReserva(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //SimpleDateFormat sdf1 = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzzz yyyy",Locale.ENGLISH);
        //SimpleDateFormat sdf2 = new SimpleDateFormat("dd/MM/yy");
        try {

            DateFormat format = null;
            String[] fecha_i = request.getParameter("txtFechaDesde").split("/");
            String[] fecha_t = request.getParameter("txtFechaHasta").split("/");

            if (fecha_i.length > 1 && fecha_t.length > 1) {
                if (fecha_i[0].length() > 2 && fecha_t[0].length() > 2) {
                    format = new SimpleDateFormat("yy/MM/dd");
                } else {
                    format = new SimpleDateFormat("dd/MM/yy");
                }
            } else {
                fecha_i = request.getParameter("txtFechaDesde").split("-");
                fecha_t = request.getParameter("txtFechaHasta").split("-");
                if (fecha_i[0].length() > 2 && fecha_t[0].length() > 2) {
                    format = new SimpleDateFormat("yy-MM-dd");
                } else {
                    format = new SimpleDateFormat("dd-MM-yy");
                }
            }

            Date fecha_inicio = format.parse(request.getParameter("txtFechaDesde"));
            int cantidad_dias = Integer.parseInt(request.getParameter("txtDias"));
            int cantidad_personas = Integer.parseInt(request.getParameter("txtPersonas"));
            Date fecha_termino = format.parse(request.getParameter("txtFechaHasta"));
            int idUsuario = Integer.parseInt(request.getParameter("txtIdUsuario"));

            re.setId_usuario(idUsuario);
            re.setFechain_reserva(fecha_inicio);
            re.setDias_reserva(cantidad_dias);
            re.setCantpersonas_reserva(cantidad_personas);
            re.setFechater_reserva(fecha_termino);

            int verifica = dao.registrarReserva(re);

            if (verifica != 0) {

                this.registrarDetalle(request, response);
            }

        } catch (Exception ex) {
            request.setAttribute("mensaje", "Ha ocurrido un error al ingresar la reserva, " + ex);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    private void registrarDetalle(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String opcionPago = request.getParameter("txtPago");
        int abono = Integer.parseInt(request.getParameter("txtAbono"));
        int restante = 0;
        int totalPago = Integer.parseInt(request.getParameter("txtTotal"));
        int idDepto = Integer.parseInt(request.getParameter("txtIdDepto"));

        int idReserva = dao.retornaIdReserva();
        try {
            //int idReserva = dao.retornaIdReserva();
            if (opcionPago.equals("abono")) {

                restante = totalPago - abono;
            }
            if (opcionPago.equals("pagoTotal")) {
                restante = 0;

            }

            dr.setAbono_detalle(abono);
            dr.setId_departamento(idDepto);
            dr.setRestante_detalle(restante);
            dr.setTotal_detalle(totalPago);
            dr.setId_reserva(idReserva);

            String verifica = dao.registrarDetalle(dr);
            //int idServicio = (Integer) request.getSession().getAttribute("idServicio");

            if (verifica != null) {
                request.getRequestDispatcher("enviandoCorreo.jsp").forward(request, response);

            } else {
                this.registrarServicio(request, response);
            }

        } catch (Exception ex) {
            request.setAttribute("mensaje", "Ha ocurrido un error al ingresar la reserva, " + ex);
            request.getRequestDispatcher("index.jsp").forward(request, response);

        }
    }

    private void registrarServicio(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int idServicio = (Integer) request.getSession().getAttribute("idServicio");
        int idDetalle = dao.retornaIdDetalle();

        int verifica = dao.registrarServicio(idDetalle, idServicio);

        if (verifica == 1) {

            request.getRequestDispatcher("enviandoCorreo.jsp").forward(request, response);

        } else {
            request.setAttribute("mensaje", "Ha ocurrido un error");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    private void enviarCorreo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String USER_NAME = "info.turismoreal";  //CORREO DE TURISMO REAL ANTES DEL @
        String PASSWORD = "Duoc2019"; //LA CONTRASEÑA

        String RECIPIENT = request.getParameter("txtCorreo");

        String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = {RECIPIENT}; // Destinatario

        String pagado = request.getParameter("txtTotal");
        String diasReservados = request.getParameter("txtDias");
        String lugar = request.getParameter("txtLugar");

        String servicioExtra = request.getParameter("txtServicio");
        String nomServicio = request.getParameter("txtNomServicio");
        String subject = "Comprobante de reserva - TURISMO REAL";
        String body;
        if (servicioExtra.equals("0")) {
            body = "Comprobante de reserva por internet\n"
                    + "Estimado Usuario:\n"
                    + "\n"
                    + "Turismo Real agradece su preferencia y le informa que se ha realizado de manera satisfactoria el pago de la reserva"
                    + " por un valor de $ " + pagado + " CLP, el cual ha sido cargado a su tarjeta bancaria.\n"
                    + "\n"
                    + "Detalles de la reserva\n"
                    + "Email del arrendatario :" + RECIPIENT + "\n"
                    + "País : Chile\n"
                    + "Resumen : Se ha reservado " + diasReservados + " días, en la ciudad de " + lugar + ".\n"
                    + "\n"
                    + "NOTA IMPORTANTE: El cargo estará visible en su cuenta bancaria con el nombre de TURISMO-REAL.\n"
                    + "\n"
                    + "Saludos Cordiales,\n"
                    + "EQUIPO CERV\n"
                    + "";
        } else { 
            body = "Comprobante de reserva por internet\n"
                    + "Estimado Usuario:\n"
                    + "\n"
                    + "Turismo Real agradece su preferencia y le informa que se ha realizado de manera satisfactoria el pago de la reserva"
                    + " por un valor de $ " + pagado + " CLP, el cual ha sido cargado a su tarjeta bancaria.\n"
                    + "\n"
                    + "Detalles de la reserva\n"
                    + "Email del arrendatario :" + RECIPIENT + "\n"
                    + "País : Chile\n"
                    + "Resumen : Se ha reservado " + diasReservados + " día/s, en la ciudad de " + lugar + "\n"
                    + "Servicio extra contratado: " + nomServicio + "\n"
                    + "\n"
                    + "NOTA IMPORTANTE: El cargo estará visible en su cuenta bancaria con el nombre de TURISMO-REAL.\n"
                    + "\n"
                    + "Saludos Cordiales,\n"
                    + "EQUIPO CERV\n"
                    + "";
        }

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
            request.setAttribute("mensaje", "Reserva registrada correctamente");
            request.getRequestDispatcher("home.jsp").forward(request, response);

        } catch (AddressException ae) {
            ae.printStackTrace();
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } catch (MessagingException me) {
            me.printStackTrace();
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

        //dao.enviarCorreoReserva(from, pass, to, subject, body);
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
