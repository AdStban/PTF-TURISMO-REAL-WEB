<%-- 
    Document   : muestraReservas
    Created on : 01-12-2019, 17:41:39
    Author     : Adán Esteban
--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--Estilo de letra-->
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web&display=swap" rel="stylesheet">
        <!--Iconos-->
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        <!--Llamada a hoja de estilos-->
        <link href="asset/css/estilos.css" rel="stylesheet">

        <script src="asset/js/validar.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="icon" type="png" href="asset/img/logo.png" />
        <title>Reservas realizadas</title>
    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>
        <c:if test="${reservaDAO.obtenerDatosReserva(email).isEmpty}">
            <h1 class="text-info">No hay reservas registradas...</h1>
        </c:if>

        <table class="table" style="margin-bottom: 310px">

            <thead class="thead-dark">
                <tr>
                    <th scope="col">Fecha reserva</th>
                    <th scope="col">Lugar</th>
                    <th scope="col">Total</th>
                    <th scope="col">Abono</th>
                    <th scope="col">Por pagar</th>
                    <th scope="col">Fechas reservadas</th>
                </tr>
            </thead>

            <tbody>


                
                <jsp:useBean class="dao.ReservaDAO" id="reservaDAO"></jsp:useBean>
                <c:forEach items="${reservaDAO.obtenerDatosReserva(email)}" var="reserva">

                    <tr>
                        <td>${reserva.getFecha_reserva()}</td>
                        <td>${reserva.getNombre_comuna()}</td>
                        <td>${reserva.getTotal_detalle()}</td>
                        <td>${reserva.getRestante_detalle()}</td>
                        <td>${reserva.getAbono()}</td>
                        <td>${reserva.getFecha_detallada()}</td>
                    </tr>    

                </c:forEach>

            </tbody>

        </table>

        <div id="footer">
            <%@ include file="cabeceras/footer.jsp" %>
        </div>                     
        <%--
        Esto se agrego para el estilo
        --%>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <%--
        Esto se agrego para el estilo
        --%>
    </body>
</html>
