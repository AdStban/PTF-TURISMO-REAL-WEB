<%-- 
    Document   : resultadoBusqueda
    Created on : 28-11-2019, 16:42:42
    Author     : Adán Esteban
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <title>JSP Page</title>
    </head>
    <body>
        <h1>${msgResultado}</h1>
        <section id="info-dep" style="padding-top: 60px;">
            <div class="site-section site-section-sm bg-light">
                <div class="container">

                    <div class="row mb-5">

                        <jsp:useBean class="dao.DepartamentoDAO" id="departamentoDAO"></jsp:useBean>  
                        <c:forEach items="${departamentoDAO.buscarDepartamento(lugar, desde, hasta)}" var="depto">
                            <div class="col-md-6 col-lg-4 mb-4">
                                <div class="property-entry h-100">

                                    <a href="DepartamentoController?idDepto=${depto.getId_departamento()}" class="property-thumbnail">

                                        <div class="offer-type-wrap">
                                            <span class="offer-type bg-success">${depto.getTipo_departamento()}</span>
                                        </div>
                                        <img src="asset/img/img_1.jpg" alt="Image" class="img-fluid">
                                    </a>
                                    <div class="p-4 property-body">
                                        <a href="#" class="property-favorite"><span class="icon-heart-o"></span></a>
                                        <h2 class="property-title"><a href="property-details.html">${depto.getNom_comuna()}</a></h2>
                                        <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span>${depto.getDireccion_departamento()}</span>
                                        <strong class="property-price text-primary mb-3 d-block text-success">$${depto.getCosto_departamento()}</strong>
                                        <ul class="property-specs-wrap mb-3 mb-lg-0">
                                            <li>
                                                <span class="property-specs">Beds</span>
                                                <span class="property-specs-number">${depto.getHabitaciones()} <sup>+</sup></span>

                                            </li>
                                            <li>
                                                <span class="property-specs">Baths</span>
                                                <span class="property-specs-number">${depto.getBanio()}</span>

                                            </li>

                                        </ul>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                </div>
            </div>
        </section>

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