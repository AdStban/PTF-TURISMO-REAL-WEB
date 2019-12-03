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

        <title>Sección de Reserva</title>
    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>


        <section id="form-reserva">   
            <div class="container"> 
                <form name="frm" action="ReservaController" method="post">
                    <div class="row">
                        <div class="col-md-6" id="blaBla" style="margin-top: -75px;">
                            <img src="http://imgcf.ecn.cl/600/1a/1a66f532621a11ded945caee51b923dc1dc6d078.bin.jpg" alt="Image" width="430" height="430" class="img-fluid rounded mb-4" style="border: 7px #08c solid">
                            <h3>¿Estás listo para reservar? <b>Sin duda alguna estás en el mejor lugar.</b></h3>
                            <p>Turismo Real es la empresa <b>N°1</b> del país.</p>
                        </div>

                        <div class="col-md-6" style="margin-top: -80px;">
                            <h2 style="margin-left: 60px;">Formulario Reserva</h2>
                            <br>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Fecha Desde</label>
                                        <input id="txtDesde" type="date" name="txtFechaDesde" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Fecha Hasta</label>
                                        <input id="txtHasta"  type="date" name="txtFechaHasta" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Valor x día</label>
                                        <input type="number" name="txtValor" class="form-control" value="${valor}" required readonly="true">
                                        <br>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Cant.Personas</label>
                                        <input id="txtPersonas" type="number" name="txtPersonas" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="dropdown-divider" id="divider"></div>
                                <h2 style="text-align: center;">Servicio adicional</h2>
                                <div class="col-md-12 " style="margin-top: -20px;">
                                    <div class="form-gorup">
                                        <label>Seleccione servicio</label>
                                        <select name="opcionServicio" class="form-control">
                                            <option value="0">Elija una opción...</option>
                                            <jsp:useBean class="dao.ServicioDAO" id="servicioDAO"></jsp:useBean>  
                                            <c:forEach items="${servicioDAO.listar()}" var="servicio">

                                                <option value="${servicio.getId_servicio()}">${servicio.getDescripcion()}, Valor: $ ${servicio.getCosto_servicio()}</option>

                                            </c:forEach>
                                        </select>

                                    </div>

                                </div> 



                                <div class="col-md-12" style="margin-top: 10px;">
                                    <input class="btn btn-dark full-width" type="submit" onclick="return validarFormularioReserva();" name="accion" value="Siguiente" required> 
                                </div>

                                <div class="mensaje">
                                    <%=request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : ""%>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div> 
            <div class="dropdown-divider" id="divider"></div>
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
