<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">-->
        <!--Bootstrap CSS-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <!--Estilo de letra-->
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web&display=swap" rel="stylesheet">
        <!--Iconos-->
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <!--Llamada a hoja de estilos-->
        <link href="../asset/css/estilos.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <c:if test="${perfil==3 || perfil==1}">
                    <a class="navbar-brand" href="home.jsp"><img src="./asset/img/logo.png" class="logo" alt="logo"></a>
                    </c:if>
                    <c:if test="${perfil==2}">
                    <a class="navbar-brand" href="homeFuncionario.jsp"><img src="./asset/img/logo.png" class="logo" alt="logo"></a>
                    </c:if>


                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <c:if test="${perfil==3 || perfil==1}">
                                <a class="nav-link" href="home.jsp"><i class="icon ion-md-home"></i> Home</a>
                            </c:if>
                            <c:if test="${perfil==2}">
                                <a class="nav-link" href="homeFuncionario.jsp"><i class="icon ion-md-home"></i> Home</a>
                            </c:if>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="modificarDatosPersonales.jsp"><i class="icon ion-md-create"></i> Editar perfil</a>
                        </li>



                        <c:if test="${perfil==3}">
                            <li class="nav-item">
                                <a class="nav-link" href="muestraReservas.jsp"><i class="icon ion-md-business"></i> Ver reservas</a>
                            </li>
                        </c:if>
                        <c:if test="${perfil==1 || perfil==2}">
                            <li class="nav-item">
                                <a class="nav-link" href="subirImagen.jsp"><i class="ion ion-md-images"></i> Subir imagen</a>
                            </li>
                        </c:if>

                        <c:if test="${perfil==1 || perfil==2}">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="icon ion-md-folder"></i> Registros
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="checkin.jsp">Check in</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="checkout.jsp">Check out</a>
                                </div>
                            </li>
                           
                        </c:if>
                            <li class="nav-item">
                                <a class="nav-link" href="logout.jsp"><i class="ion ion-md-power"> Cerrar sesión</i></a>
                            </li>
                    </ul>
                </div>
            </div>
        </nav>

        <%-- Esto se agrego para el estilo --%>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <%-- Esto se agrego para el estilo --%>
    </body>
</html>
