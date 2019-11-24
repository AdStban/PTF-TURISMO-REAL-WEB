<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <script src="js/validar.js" type="text/javascript"></script>
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
                        <div class="col-md-6" id="blaBla">
                            <h3>¿Estás listo para reservar? <b>Sin duda alguna estás en el mejor lugar.</b></h3>
                            <p>Turismo Real es la empresa <b>N°1</b> del país.</p>
                        </div>
                        <div class="col-md-6 topmargin-sm">
                            <h2 style="text-align: center;">Formulario Reserva</h2>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Fecha Desde</label>
                                        <input type="date" name="txtFechaDesde" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Fecha Hasta</label>
                                        <input type="date" name="txtFechaHasta" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Cant.Días</label>
                                        <input type="number" name="txtDias" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">valor</label>


                                        <input type="number" name="txtValor" class="form-control" value="${valor}" required readonly="true">
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Cant.Personas</label>
                                        <input type="number" name="txtPersonas" class="form-control" required> 
                                    </div>
                                </div>
                                <div class="dropdown-divider" id="divider"></div>
                                <h3 style="text-align: center;">Servicio adicional</h3>
                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label>Seleccione servicio</label>
                                        <select name="opcionServicio">
                                            <option value="0">Elija una opción...</option>
                                            <option value="1">Transporte</option>
                                            <option value="2">Paquete turístico</option>
                                            <option value="3">Transporte + Paquete turístico</option>
                                        </select>
                                    </div>
                                </div> 


                                <div class="col-md-12" style="margin-top: 10px;">
                                    <input class="btn btn-dark full-width" type="submit" onclick="return validar();" name="accion" value="Siguiente" required> 
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
