<%-- 
    Document   : detalleDepartamento
    Created on : 21-10-2019, 18:56:11
    Author     : Adán Esteban
--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post" action="ReservaController">
            <section id="info-dep">
                <div class="container">
                    <table border="1">
                        <tr>
                            <!--<th>ID_DEPARTAMENTO</th>-->
                            <th>Valor</th>
                            <th>Categoría</th>
                            <th>Lugar</th>
                            <th>Dirección</th>
                            <th>Cant. habitaciones</th>
                            <th>Reserva</th>
                        </tr>
                        <jsp:useBean class="dao.DepartamentoDAO" id="departamentoDAO"></jsp:useBean>  
                        <c:forEach items="${departamentoDAO.obtenerDepartamento(idDepartamento)}" var="d">
                            <tr>
                            <input type="hidden" name="txtIdDepartamento"  value="${d.getId_departamento()}">
                            <td><input type="text" name="txtCosto" value="${d.getCosto_departamento()}" readonly="true"></td>
                            <td><input type="text" name="txtCategoria" value="${d.getTipo_departamento()}" readonly="true"></td>
                            <td><input type="text" name="txtComuna" value="${d.getNom_comuna()}" readonly="true"></td>
                            <td><input type="text" name="txtDireccion" value="${d.getDireccion_departamento()}" readonly="true"></td>
                            <td><input type="text" name="txtHabitaciones" value="${d.getHabitaciones()}" readonly="true"></td>
                            <td>
                                <input type="submit" name="btnReservar" value="Reservar" >
                            </td>
                            <input type="hidden" name="accion" value="iniciarReserva"/>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </section>
        </form>
    </body>
</html>
