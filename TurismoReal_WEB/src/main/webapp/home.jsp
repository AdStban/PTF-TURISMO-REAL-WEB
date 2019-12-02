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
        <script src="asset/js/validar.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

        <link rel="icon" type="png" href="asset/img/logo.png" />
        <link rel="stylesheet" href="asset/css/style.css">

    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>

        <section id="user">
            <div class="container">
                <h2>Bienvenido(a) <c:out value="${email}"></c:out></h2>
                </div>
            </section>
            <!---------------------------------------------------------------------------------------------->
            <div class="site-loader"></div>



            <div class="slide-one-item home-slider owl-carousel">

                <div class="site-blocks-cover overlay" style="background-image: url(images/reñaca.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                    <div class="container">
                        <div class="row align-items-center justify-content-center text-center">
                            <div class="col-md-10">
                                <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">Premium</span>
                                <h1 class="mb-2">Av. Borgoño 15180</h1>
                                <p class="mb-5"><strong class="h2 text-success font-weight-bold">$100.000</strong></p>
                                <p><a href="#info-dep" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">Ver departamentos</a></p>
                            </div>
                        </div>
                    </div>
                </div>  

                <div class="site-blocks-cover overlay" style="background-image: url(images/serena.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
                    <div class="container">
                        <div class="row align-items-center justify-content-center text-center">
                            <div class="col-md-10">
                                <span class="d-inline-block bg-success text-white px-3 mb-3 property-offer-type rounded">Premium</span>
                                <h1 class="mb-2">Av del Mar 1700</h1>
                                <p class="mb-5"><strong class="h2 text-success font-weight-bold">$120.000</strong></p>
                                <p><a href="#info-dep" class="btn btn-white btn-outline-white py-3 px-5 rounded-0 btn-2">Ver departamentos</a></p>
                            </div>
                        </div>
                    </div>
                </div>  

            </div>

            <div class="site-section site-section-sm pb-0">
                <div class="container">
                    <div class="row">
                        <form name="formBuscar" action="BusquedaController" method="post" class="form-search col-md-12" style="margin-top: -100px;">
                            <div class="row  align-items-end">
                                <div class="col-md-3">
                                    <label for="list-types">Elige el lugar</label>

                                    <div class="select-wrap">
                                        <span class="icon icon-arrow_drop_down"></span>

                                        <select id="lugar" name="slcLugar" id="list-types" class="form-control d-block rounded-0">
                                            <option value="0">Selecione lugar...</option>
                                        <jsp:useBean class="dao.ComunaDAO" id="comunaDAO"></jsp:useBean>  
                                        <c:forEach items="${comunaDAO.listar()}" var="comuna">

                                            <option value="${comuna.getNombre_comuna()}">${comuna.getNombre_comuna()}</option>
                                        </c:forEach>
                                    </select>

                                </div>

                            </div>
                            <div class="col-md-3">
                                <label for="offer-types">Desde</label>
                                <!--<div class="datepicker-inline">
                                    <input type="text" name="txtDesde" class="datepicker" placeholder="Desde">
                                </div>-->
                                <input id="desde" type="date" name="txtDesde">
                            </div>
                            <div class="col-md-3">
                                <label for="offer-types">Hasta</label>
                                <!--<div class="datepicker-inline">
                                    <input type="text" name="txtHasta" class="datepicker" placeholder="Hasta">
                                </div>-->
                                <input id="hasta" type="date" name="txtHasta">
                            </div>
                            <div class="col-md-3">
                                <input type="submit" onclick="return validarBuscador();" class="btn btn-success text-white btn-block rounded-0" name="accion" value="Buscar">
                            </div>
                        </div>
                    </form>
                </div>  

            </div>
        </div>


        <!------------------------------------------------------------------------------------->


        <section id="info-dep" style="padding-top: 60px;">
            <div class="site-section site-section-sm bg-light">
                <div class="container">

                    <div class="row mb-5">

                        <jsp:useBean class="dao.DepartamentoDAO" id="departamentoDAO"></jsp:useBean>  
                        <c:forEach items="${departamentoDAO.listar()}" var="depto">
                            <div class="col-md-6 col-lg-4 mb-4">
                                <div class="property-entry h-100">

                                    <a type="submit" href="DepartamentoController?idDepto=${depto.getId_departamento()}" class="property-thumbnail">
                                        <input type="hidden" name="txtIdDepto" value="${depto.getId_departamento()}">
                                        <div class="offer-type-wrap">
                                            <span class="offer-type bg-success">${depto.getTipo_departamento()}</span>
                                        </div>
                                        <img src="asset/img/img_1.jpg" alt="Image" class="img-fluid">
                                    </a>

                                    <div class="p-4 property-body">
                                        <a href="#" class="property-favorite"><span class="icon-heart-o"></span></a>
                                        <h2 class="property-title"><a href="DepartamentoController?idDepto=${depto.getId_departamento()}">${depto.getNom_comuna()}</a></h2>
                                        <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span>${depto.getDireccion_departamento()}</span>
                                        <strong class="property-price text-primary mb-3 d-block text-success">$${depto.getCosto_departamento()}</strong>
                                        <ul class="property-specs-wrap mb-3 mb-lg-0">
                                            <li>
                                                <span class="property-specs">Dormitorios</span>
                                                <span class="property-specs-number">${depto.getHabitaciones()} <sup>+</sup></span>

                                            </li>
                                            <li>
                                                <span class="property-specs">Baño</span>
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
