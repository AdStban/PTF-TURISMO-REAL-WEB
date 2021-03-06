<%-- 
    Document   : homeFuncionario
    Created on : 30-11-2019, 17:48:14
    Author     : Adán Esteban
--%>

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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link rel="icon" type="png" href="asset/img/logo.png" />
        <title>Home funcionario</title>
    </head>
    <body>
        <div id="header">
            <%@ include file="cabeceras/header.jsp" %>
        </div>

        <section id="form-reserva" style="margin-bottom: 150px">   
            <div class="container"> 

                <div class="row">
                    <div class="col-md-6" id="blaBla">
                        <h2 class="text-info">Sistema web interno</h2>
                        <h4 class="text-info"><i>"El éxito no se logra sólo con cualidades especiales. Es sobre todo un trabajo de constancia, de método y de organización"</i></h4>
                        <p class="text-info"><b>Turismo Real</b></p>
                    </div>
                    <div class="col-md-6 topmargin-sm">
                        <img src="asset/img/logo.png" class="image">
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
