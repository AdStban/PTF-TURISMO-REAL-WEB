<%-- 
    Document   : verificandoPago
    Created on : 14-11-2019, 18:11:33
    Author     : Adán Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--<meta http-equiv="refresh" content="5;url=">-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script>
        window.onload=function(){
                // Una vez cargada la página, el formulario se enviara automáticamente.
		document.forms["enviar"].submit();
        };
        </script>
        
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Se esta verificando el pago...</h1>
        
        <form name="enviar" action="${urlRedirecciona}" method="post">
                <input type="hidden" name="token_ws" value="${token}">
                
                
        </form>
        
    </body>
</html>
