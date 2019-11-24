<%-- 
    Document   : confirmaPago
    Created on : 13-11-2019, 21:46:30
    Author     : Adán Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../js/validar.js" type="text/javascript"></script>
        <title>Confirma-transacción</title>
    </head>
    <body>
        <h1 style="text-align: center">¿Estas seguro de continuar?</h1>
        <form name="confirmaPago" action="${url}" method="post">
            <input type="hidden" name="token_ws" value="${token}">
            <input type="submit" value="Pagar">            
        </form>
    </body>
</html>
