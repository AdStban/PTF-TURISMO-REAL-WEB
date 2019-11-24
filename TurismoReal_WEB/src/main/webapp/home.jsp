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

    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>

        <section id="user">
            <div class="container">
                <h2>Bienvenido/a <c:out value="${email}"></c:out></h2>
                    <div class="dropdown-divider" id="divider"></div>
                    <h2>Recomendados para ti</h2>
                </div>
            </section>
            <section id="form-reserva">

                <div class="container">
                    <div class="col-md-6 topmargin-sm">
                        <h2 >Escriba a que ciudad desea ir</h2>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-gorup">
                                    <label style="margin-top: 5px;">Dónde</label>
                                    <input type="search" id="searchTerm" name="txtComuna" class="form-control" onkeyup="doSearch()" placeholder="Cualquier lugar" required> 
                                </div>
                            </div>
                        </div> 
                    </div>
                </div>
            </section>

            <section id="info-dep" style="padding-top: 60px;">
                <div class="site-section site-section-sm bg-light">
                    <div class="container">

                        <div class="row mb-5">

                        <jsp:useBean class="dao.DepartamentoDAO" id="departamentoDAO"></jsp:useBean>  
                        <c:forEach items="${departamentoDAO.listar()}" var="depto">
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
                                                <span class="property-specs-number">2 <sup>+</sup></span>

                                            </li>
                                            <li>
                                                <span class="property-specs">Baths</span>
                                                <span class="property-specs-number">2</span>

                                            </li>
                                            <li>
                                                <span class="property-specs">SQ FT</span>
                                                <span class="property-specs-number">7,000</span>

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

        <section id="departamentos">
            <div class="container topmargin-lg">
                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="asset/img/1.jpg" class="pv" alt="1">
                            <div class="rating">
                                <ul class="list-inline">
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                </ul>
                                <div class="text">
                                    <p>PUERTO VARAS - 2 DORMITORIOS</p>
                                    <p>Acogedor departamento a solo metros del Puerto de la Ciudad.</p>
                                    <p>$35.000</p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="asset/img/1.jpg" alt="1">
                            <div class="rating">
                                <ul class="list-inline">
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                </ul>
                                <div class="text">
                                    <p>ARICA - 3 DORMITORIOS</p>
                                    <p>$30.000</p>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="asset/img/1.jpg" alt="1">
                            <div class="rating">
                                <ul class="list-inline">
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                    <li class="list-inline-item"><i class="icon ion-md-star"></i></li>
                                </ul>
                                <div class="text">
                                    <p>VIÑA DEL MAR - 1 DORMITORIO</p>
                                    <p>$15.000</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                    <div class="dropdown-divider" id="divider"></div>
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
        <%-- Esto se agrego para el estilo --%>
    </body>
</html>
