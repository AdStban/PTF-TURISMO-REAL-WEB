<%-- 
    Document   : enviandoCorreo
    Created on : 27-11-2019, 21:14:22
    Author     : Adán Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script>
        window.onload=function(){
                // Una vez cargada la página, el formulario se enviara automáticamente.
		document.forms["enviandoCorreo"].submit();
        };
        </script>
        <title>Enviando correo</title>
    </head>
    <body>
        <form name="enviandoCorreo" action="ReservaController" method="post">
            <input type="hidden" name="txtNomServicio" value="${nomServicio}">
            <input type="hidden" name="txtServicio" value="${servicio}">
            <input type="hidden" name="txtLugar" value="${lugar}">
            <input type="hidden" name="txtDias" value="${dias}">
            <input type="hidden" name="txtTotal" value="${totalWebpay}">
            
            <input type="hidden" name="txtCorreo" value="${email}">
            
   
            
            <input type="hidden" name="accion" value="enviarCorreo">
        </form>
    </body>
</html>
