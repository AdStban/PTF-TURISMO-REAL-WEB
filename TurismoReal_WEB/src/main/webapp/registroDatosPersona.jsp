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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>

        <section id="form-reserva">   
            <div class="container"> 
                <form name="frm" action="RegistroDatosPersona" method="post">
                    <div class="row">
                        <div class="col-md-6" id="blaBla">
                            <h3>¿Estás listo para reservar? <b>Sin duda alguna estás en el mejor lugar.</b></h3>
                            <p>Turismo Real es la empresa <b>N°1</b> del país.</p>
                        </div>
                        <div class="col-md-6 topmargin-sm">
                            <h2 style="text-align: center;">Completar registro de datos</h2>
                            <div class="row">
                                <input type="hidden" name="txtCorreo" value="${email}">
                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Nombre</label>
                                        <input type="text" name="txtNombre" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Apellido Paterno</label>
                                        <input type="text" name="txtApellidoPa" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Apellido Materno</label>
                                        <input type="text" name="txtApellidoMa" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label>Rut</label>
                                        <input type="text" name="txtRut" oninput="checkRut(this)" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Contacto</label>
                                        <input type="number" name="txtTelefono" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Fecha Nacimiento</label>
                                        <input type="date" name="dateFechaNac" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-gorup">
                                        <label style="margin-top: 5px;">Dirección</label>
                                        <input type="text" name="txtDireccion" class="form-control" required> 
                                    </div>
                                </div>

                                <div class="col-md-6" style="margin-top: 10px;">
                                    <input class="btn btn-dark full-width" type="submit" onclick="return validar();" name="accion" value="Guardar" required> 
                                </div>
                                <div class="col-md-6" style="margin-top: 10px;">
                                    <a href="home.jsp" class="btn btn-dark full-width">Volver</a>
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