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
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!---<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">--->
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--Estilo de letra-->
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web&display=swap" rel="stylesheet">
        <!--Iconos-->
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">
        <!--Llamada a hoja de estilos-->
        <link href="asset/css/estilos.css" rel="stylesheet">
        <!--LLamada al buscador de la tabla-->
        <script src="asset/js/buscadorTabla.js" type="text/javascript"></script>

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


        <link rel="stylesheet" href="asset/css/style.css">

        <title>Detalles departamento</title>
    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>




        <div class="site-section site-section-sm">
            <jsp:useBean class="dao.DepartamentoDAO" id="departamentoDAO"></jsp:useBean>  
            <c:forEach items="${departamentoDAO.obtenerDepartamento(idDepartamento)}" var="d">
                <div class="container">

                    <div class="row">

                        <div class="col-lg-8">
                            <div>
                                <div class="slide-one-item home-slider owl-carousel">
                                    <div><img src="images/hero_bg_1.jpg" alt="Image" class="img-fluid"></div>
                                    <div><img src="images/hero_bg_2.jpg" alt="Image" class="img-fluid"></div>
                                    <div><img src="images/hero_bg_3.jpg" alt="Image" class="img-fluid"></div>
                                </div>
                            </div>
                            <div class="bg-white property-body border-bottom border-left border-right">
                                <div class="row mb-5">
                                    <div class="col-md-6">
                                        <strong class="text-success h1 mb-3">$${d.getCosto_departamento()}</strong>
                                    </div>
                                    <div class="col-md-6">
                                        <ul class="property-specs-wrap mb-3 mb-lg-0  float-lg-right">
                                            <li>
                                                <span class="property-specs">Dormitorios</span>
                                                <span class="property-specs-number">${d.getHabitaciones()}<sup>+</sup></span>

                                            </li>
                                            <li>
                                                <span class="property-specs">Baños</span>
                                                <span class="property-specs-number">2</span>

                                            </li>

                                        </ul>
                                    </div>
                                </div>
                                <div class="row mb-5">
                                    <div class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
                                        <span class="d-inline-block text-black mb-0 caption-text">Categoría</span>
                                        <strong class="d-block">${d.getTipo_departamento()}</strong>
                                    </div>
                                    <div class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
                                        <span class="d-inline-block text-black mb-0 caption-text">Ubicación</span>
                                        <strong class="d-block">${d.getNom_comuna()}</strong>
                                    </div>

                                </div> 


                                <h2 class="h4 text-black">Descripción</h2>
                                <p>Departamento con la mejor ubicación de la ciudad, cercano a centros comerciales y transporte a la puerta.</p>
                                <p>Contamos con servicio de seguridad en el edificio, ademas de limpieza en los alrededores, disponibilidad de piscinas y quincho para el uso duarante su estadía.</p>


                                <div class="row no-gutters mt-5">
                                    <div class="col-12">
                                        <h2 class="h4 text-black mb-3">Galería</h2>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_1.jpg" class="image-popup gal-item"><img src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_2.jpg" class="image-popup gal-item"><img src="images/img_2.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_3.jpg" class="image-popup gal-item"><img src="images/img_3.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_4.jpg" class="image-popup gal-item"><img src="images/img_4.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_5.jpg" class="image-popup gal-item"><img src="images/img_5.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_6.jpg" class="image-popup gal-item"><img src="images/img_6.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_7.jpg" class="image-popup gal-item"><img src="images/img_7.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_8.jpg" class="image-popup gal-item"><img src="images/img_8.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_1.jpg" class="image-popup gal-item"><img src="images/img_1.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_2.jpg" class="image-popup gal-item"><img src="images/img_2.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_3.jpg" class="image-popup gal-item"><img src="images/img_3.jpg" alt="Image" class="img-fluid"></a>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-3">
                                        <a href="images/img_4.jpg" class="image-popup gal-item"><img src="images/img_4.jpg" alt="Image" class="img-fluid"></a>
                                    </div>

                                </div>

                            </div>

                        </div>
                        <div class="col-lg-4">

                            <div class="bg-white widget border rounded">


                                <h3>¿Estás listo para reservar? <b> Vive la experiencia de</b></h3>
                                <p>Turismo Real la empresa <b>N°1</b> del país.</p>
                                <form method="post" action="ReservaController">  

                                    <input type="hidden" name="txtIdDepartamento"  value="${d.getId_departamento()}">
                                    <input type="hidden" name="txtCosto" value="${d.getCosto_departamento()}" readonly="true">
                                    <input type="hidden" name="txtCategoria" value="${d.getTipo_departamento()}" readonly="true">
                                    <input type="hidden" name="txtComuna" value="${d.getNom_comuna()}" readonly="true"></td>
                                    <input type="hidden" name="txtDireccion" value="${d.getDireccion_departamento()}" readonly="true">
                                    <input type="hidden" name="txtHabitaciones" value="${d.getHabitaciones()}" readonly="true">
                                    <input type="hidden" name="accion" value="iniciarReserva"/>
                                    


                                    <input type="submit" name="btnReservar" class="btn btn-primary" value="Reservar">

                                </c:forEach>
                            </form>


                        </div>



                    </div>

                </div>

            </div>

            <div id="footer">
                <%@ include file="cabeceras/footer.jsp" %>
            </div>

            <%-- Esto se agrego para el estilo --%>
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
            <script src="asset/js/jquery-3.3.1.min.js"></script>
            <script src="asset/js/jquery-migrate-3.0.1.min.js"></script>
            <script src="asset/js/jquery-ui.js"></script>
            <script src="asset/js/popper.min.js"></script>
            <script src="asset/js/bootstrap.min.js"></script>
            <script src="asset/js/owl.carousel.min.js"></script>
            <script src="asset/js/mediaelement-and-player.min.js"></script>
            <script src="asset/js/jquery.stellar.min.js"></script>
            <script src="asset/js/jquery.countdown.min.js"></script>
            <script src="asset/js/jquery.magnific-popup.min.js"></script>
            <script src="asset/js/bootstrap-datepicker.min.js"></script>
            <script src="asset/js/aos.js"></script>

            <script src="asset/js/main.js"></script>
            <%-- Esto se agrego para el estilo --%>
    </body>
</html>
