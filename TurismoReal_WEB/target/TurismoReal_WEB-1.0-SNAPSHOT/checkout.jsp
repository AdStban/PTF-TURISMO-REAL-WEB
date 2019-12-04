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
        <link rel="icon" type="png" href="asset/img/logo.png" />



        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link rel="stylesheet" href="asset/fonts/icomoon/style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 


        <link rel="stylesheet" href="asset/css/magnific-popup.css">
        <link rel="stylesheet" href="asset/css/jquery-ui.css">
        <link rel="stylesheet" href="asset/css/owl.carousel.min.css">
        <link rel="stylesheet" href="asset/css/owl.theme.default.min.css">
        <link rel="stylesheet" href="asset/css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="asset/css/mediaelementplayer.css">
        <link rel="stylesheet" href="asset/css/animate.css">
        <link rel="stylesheet" href="asset/fonts/flaticon/font/flaticon.css">
        <link rel="stylesheet" href="asset/css/fl-bigmug-line.css">
        <link rel="stylesheet" href="asset/css/aos.css">

        <script src="asset/js/validar.js" type="text/javascript"></script>

        <link rel="stylesheet" href="asset/css/style.css">

        <link rel="icon" type="png" href="asset/img/logo.png" />
    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>
        
        <div class="mx-auto" style="text-align: center">
            <h1>Sección de Ckeck-Out</h1>
        </div>
        
        <section id="info-dep" style="padding-top: 60px;">
            <div class="site-section site-section-sm bg-light" style="margin-top: -70px;">
                <div class="container">
                    <div class="row mb-5">
                        <jsp:useBean class="dao.InventarioDAO" id="inventarioDAO"></jsp:useBean>  
                        <c:forEach items="${inventarioDAO.listarCheckOut()}" var="i">
                            <div class="col-md-6 col-lg-4 mb-4" data-toggle="modal" data-target="#ModalCheckOUT${i.getId_departamento()}" data-whatever="@mdo">
                                <div class="property-entry h-100">

                                    <jsp:useBean class="dao.DepartamentoDAO" id="departamentoDAO"></jsp:useBean>
                                    <c:forEach items="${departamentoDAO.obtenerImagen(i.getId_departamento())}" var="img">
                                    <a  class="property-thumbnail">
                                        <img src="asset/img/${img.getUbicacion()}" alt="Image" class="img-fluid">
                                    </a>
                                    </c:forEach>
                                    <div class="p-4 property-body">
                                        <span class="property-specs">Fecha de reserva:</span>
                                        <h2 class="property-title">
                                            <a>
                                                ${i.getDetalle_fecha()}
                                            </a>
                                        </h2>

                                        <span class="property-specs">Tipo Departamento:</span>
                                        <h2 class="property-title">
                                            <a>
                                                ${i.getTipo_departamento()}
                                            </a>
                                        </h2>

                                        <span class="property-specs">Costo Departamento:</span>
                                        <h2 class="property-title">
                                            <a>
                                                CLP ${i.getCosto()}
                                            </a>
                                        </h2>    

                                        <ul class="property-specs-wrap mb-3 mb-lg-0">
                                            <li>
                                                
                                                <span class="property-specs-number" hidden>${i.getId_detalle()}</span>
                                            </li>
                                            <li>
                                                
                                                <span class="property-specs-number" hidden>${i.getId_reserva()}</span>
                                            </li>
                                            <li>
                                                
                                                <span class="property-specs-number" hidden>${i.getId_usuario()}</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <c:forEach items="${inventarioDAO.obtenerIdInventario(i.getId_departamento())}" var="f">
                                <div class="modal fade" id="ModalCheckOUT${f.getId_departamento()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Información detallada</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <form action="RevisionController" method="post">
                                                <div class="modal-body">
                                                    <div class="form-check">
                                                        <input type="checkbox" class="form-check-input" name="estado" id="exampleCheck1" value="1">
                                                        <label class="form-check-label" for="chbCorrecto" >Correcto</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input type="checkbox" class="form-check-input" name="estado" id="exampleCheck1" value="0">
                                                        <label class="form-check-label" for="chbRechazado" >Rechazado</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <span id="error" style="color: red;"></span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Código Departamento:</label>
                                                        <input type="text" class="form-control" id="codigoInventario" value="${f.getId_departamento()}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Tipo Departamento:</label>
                                                        <input type="text" class="form-control" id="codigoDepartamento" value="${i.getTipo_departamento()}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Costo Departamento:</label>
                                                        <input type="text" class="form-control" id="internet" value="$ ${i.getCosto()}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Código detalle:</label>
                                                        <input type="text" class="form-control" id="banios" name="txtCodDetalle" value="${i.getId_detalle()}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Código reserva:</label>
                                                        <input type="text" class="form-control" id="dormitorio" value="${i.getId_reserva()}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="recipient-name" class="col-form-label">Código usuario:</label>
                                                        <input type="text" class="form-control" id="asiento" value="${i.getId_usuario()}" readonly>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="message-text" class="col-form-label">Detalle Salida:</label>
                                                        <textarea class="form-control" id="message-text" name="txtDetalleSalida"></textarea>
                                                    </div>
                                            </form>
                                            <div class="modal-footer">
                                                <input type="submit" class="btn btn-primary" onclick="return validarCheckbox();" name="accion" value="Registrar" />
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                                            </div>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div> 
                        </c:forEach>
                    </c:forEach>
                </div>
            </div>
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
