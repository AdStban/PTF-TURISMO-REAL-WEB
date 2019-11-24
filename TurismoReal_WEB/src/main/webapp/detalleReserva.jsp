<%-- 
    Document   : detalleReserva
    Created on : 25-10-2019, 16:27:29
    Author     : Adán Esteban
--%>


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
        <script src="asset/js/validar.js" type="text/javascript"></script>
        <link href="WebPayNormal.jsp">
        <title>Resumen reserva</title>
    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>
        <section id="form-reserva">   
            <div class="container"> 
                <form action="ReservaController" method="post">

                    <div class="row">
                        <div class="col-md-6" id="blaBla">
                            <h3>¿Estás listo para reservar? <b>Sin duda alguna estás en el mejor lugar.</b></h3>
                            <p>Turismo Real es la empresa <b>N°1</b> del país.</p>
                        </div>
                        <div class="col-md-6 topmargin-sm">
                            <h2 style="text-align: center;">Detalle reserva</h2>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Fecha reservada</label>

                                        <input type="text" id="cldFechaDesde" name="txtFechaDesde"  required readonly="true" value="${fechaDesde} - ${fechaHasta}" > 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>cantidad de dias</label>
                                        <input type="text" name="txtDias" class="form-control" required readonly="true" value="${dias}"> 
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Lugar</label>
                                        <input type="text" name="txtLugar" class="form-control" required readonly="true" value="${lugar}"> 
                                    </div>
                                </div>
                                <div class="dropdown-divider" id="divider"></div>
                                <h2 style="text-align: center;">Detalle a pagar</h2>
                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Valor por noche</label>


                                        <input type="number" name="txtValor" class="form-control" value="${valor}" readonly="true">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Servicio extra</label>

                                        <div class="form-gorup">   
                                            <input type="number" name="txtValorServicio" class="form-control" value="${valorServicio}" readonly="true">
                                        </div>


                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Total a pagar</label>


                                        <input type="number" name="txtTotalPagar" class="form-control" value="${(valor*dias)+valorServicio}" required readonly="true">
                                    </div>
                                </div>

                                <div class="dropdown-divider" id="divider"></div>

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label>Opcion de pago</label>
                                        <select name="opcionPago">         
                                            <option value="pagoTotal">Pago completo</option>
                                            <option value="abono">Abonar 50%</option>
                                        </select>
                                    </div>
                                </div> 
                                <div class="col-md-12" style="margin-top: 10px;">
                                    <input class="btn btn-dark full-width" type="submit" name="accion" value="Pagar" required> 
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
