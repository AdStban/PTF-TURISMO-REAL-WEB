<%-- 
    Document   : modificarDatosPersonales
    Created on : 01-12-2019, 19:29:00
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
        <title>Editar datos</title>
    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>
        <section id="form-reserva">   
            <div class="container"> 
                <jsp:useBean class="dao.UsuarioDAO" id="usuarioDAO"></jsp:useBean>
                <c:forEach items="${usuarioDAO.datosPersona(email)}" var="per">
                    <form name="frm" action="ModificaDatosController" method="post">
                        <div class="row">
                            <div class="col-md-6" id="blaBla">
                                <h3>Mantén actualizados tus datos</h3>
                                <h2><b>para contactarnos y mandarte resumen de tus reservas.</b></h2>
                                <p><b>Turismo Real</b></p>
                            </div>
                            <div class="col-md-6" style="margin-top: -80px;">
                                <h2 style="margin-left: 60px;">Editar datos personales</h2>
                                <br>

                                <div class="row">
                                    <input id="txtCorreo" type="hidden" name="txtCorreo" value="${email}">

                                    <div class="col-md-6">
                                        <div class="form-gorup">
                                            <label>Rut:</label>
                                            <input id="txtRut" type="text" name="txtRut" class="form-control" value="${per.getRut()}" readonly="true"> 
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-gorup">
                                            <label>Nombre</label>
                                            <input id="txtNombre" type="text" name="txtNombre" class="form-control" value="${per.getNombre()}"> 
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-gorup">
                                            <label style="margin-top: 5px;">Contacto</label>
                                            <input id="txtTelefono" type="number" name="txtTelefono" class="form-control" value="${per.getContacto()}"> 
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-gorup">
                                            <label style="margin-top: 5px;">Dirección</label>
                                            <input id="txtDireccion" type="text" name="txtDireccion" class="form-control" value="${per.getDireccion()}"> 
                                        </div>
                                    </div>


                                    <div class="col-md-6" style="margin-top: 10px;">
                                        <input class="btn btn-dark full-width" type="submit" onclick="return validarModificarDatos();" name="accion" value="Guardar">

                                    </div>

                                    <div class="col-md-6" style="margin-top: 10px;">

                                        <c:if test="${perfil==3 || perfil==1}">
                                            <input class="btn btn-dark full-width" type="button" onclick="window.location = 'home.jsp'"  name="accion" value="Cancelar" >
                                        </c:if>
                                        <c:if test="${perfil==2}">
                                            <input class="btn btn-dark full-width" type="button" onclick="window.location = 'homeFuncionario.jsp'"  name="accion" value="Cancelar" >
                                        </c:if>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </form>
                </c:forEach>
            </div> 

        </section>

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
