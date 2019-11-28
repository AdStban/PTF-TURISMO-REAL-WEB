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
        
         
       <script>
        window.onload=function(){
                // Una vez cargada la página, el formulario se enviara automáticamente.
		document.forms["registrarReserva"].submit();
        };
        </script>
        <title>finalizando</title>
    </head>
    <body>
        
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
            <input type="hidden" name="accion" value="registrarReserva">
        </form>
        
    </body>
</html>
