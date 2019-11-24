<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Inicio de sesión</title>
        <link href="asset/css/estilos_viejos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="center">
            <h1>
                <a href="index.jsp"><img src="asset/img/logo.png" height="100" width="100"/></a>
                <br/>
                Iniciar Sesión
            </h1>

            <form action="LoginController" method="post">
                <div class="txt_field">
                    <input type="text" name="txtCorreo" required>
                    <span></span>
                    <label>Correo</label>
                </div>
                <div class="txt_field">
                    <input type="password" name="txtPass" required>
                    <span></span>
                    <label>Contraseña</label>
                </div>
                <div class="pass">¿He olvidado la contraseña?</div>
                <input type="submit" name="accion" value="Ingresar" required>
                <div class="signup_link">
                    ¿No tienes una cuenta? <a href="register.jsp">Regístrate</a>
                </div>

                <div class="mensaje">
                    <%=request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : ""%>
                </div>
            </form>
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
