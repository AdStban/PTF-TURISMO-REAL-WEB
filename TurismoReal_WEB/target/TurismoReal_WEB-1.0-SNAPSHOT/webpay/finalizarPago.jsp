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
        
         
       <!--<script>
        window.onload=function(){
                // Una vez cargada la página, el formulario se enviara automáticamente.
		document.forms["registrarReserva"].submit();
        };
        </script>-->
        <title>finalizando</title>
    </head>
    <body>
        
        <form name="registrarReserva" action="../ReservaController" method="post">
            <input type="text" name="txtFechaDesde" value="${fechaDesde}">
            <input type="text" name="txtFechaHasta" value="${fechaHasta}">
            <input type="text" name="txtDias" value="${dias}">
            <input type="text" name="txtPersonas" value="${personas}">
            <input type="text" name="txtIdUsuario" value="${idUsuario}">
            
            <input type="text" name="txtIdDepto" value="${idDepartamento}">
            <input type="text" name="txtAbono" value="${abono}">
            <!--<input type="hidden" name="txtRestante" value="${restante}">-->
            <input type="text" name="txtTotal" value="${totalPago}">
            <input type="text" name="txtPago" value="${optionPayment}">
            <input type="submit" name="accion" value="registrarReserva">
        </form>
        
    </body>
</html>
