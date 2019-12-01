<%-- 
    Document   : finalizarPago
    Created on : 14-11-2019, 20:07:19
    Author     : Adán Esteban
--%>

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
        <link href="../asset/css/estilos.css" rel="stylesheet">


        <script>
            window.onload = function () {
                // Una vez cargada la página, el formulario se enviara automáticamente.
                document.forms["registrarReserva"].submit();
            };
        </script>
        <title>finalizando</title>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand"><img src="../asset/img/logo.png" class="logo" alt="logo"></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="icon ion-md-menu"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">




                    </ul>
                </div>
            </div>
        </nav>

        <h1 style="margin-left: 50px" class="text-info">Estamos finalizando el proceso de reserva...</h1>
        <div class="spinner-border text-info" role="status" style="margin-left: 50px">
            <span style="margin-left: 300px" class="sr-only">Estamos finalizando el proceso de reserva...</span>
        </div>

        <form name="registrarReserva" action="../ReservaController" method="post">
            <input type="hidden" name="txtFechaDesde" value="${fechaDesde}">
            <input type="hidden" name="txtFechaHasta" value="${fechaHasta}">
            <input type="hidden" name="txtDias" value="${dias}">
            <input type="hidden" name="txtPersonas" value="${personas}">
            <input type="hidden" name="txtIdUsuario" value="${idUsuario}">

            <input type="hidden" name="txtIdDepto" value="${idDepartamento}">
            <input type="hidden" name="txtAbono" value="${abono}">
            <!--<input type="hidden" name="txtRestante" value="${restante}">-->
            <input type="hidden" name="txtTotal" value="${totalPago}">
            <input type="hidden" name="txtPago" value="${optionPayment}">
            <input type="hidden" name="txtOpcionServicio" value="${servicio}">

            <input type="hidden" name="accion" value="registrarReserva">
        </form>

    </body>
</html>
