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
       
        
        
        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Confirma-transacción</title>
    </head>
    <body>
        
       
        
        <form id="confirmaPago" name="confirmaPago" action="${url}" method="post">
            <input type="hidden" name="token_ws" value="${token}">
            <!--<input type="submit" value="Pagar">-->            
        </form>
        <script>

            swal({title: "¿Estás seguro de continuar?",
                text: "Se procedera a realizar el pago de la reserva!",
                icon: "warning",
                buttons: true,
                dangerMode: true})
                    .then((willDelete) => {
                        if (willDelete) {
                            document.forms['confirmaPago'].submit();
                        } else {
                            window.location = "home.jsp";
                        }

                        
                    }
                    );

        </script>
      
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
