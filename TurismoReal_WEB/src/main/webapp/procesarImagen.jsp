<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>

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
        <link rel="icon" type="png" href="asset/img/logo.png" />
        <title>Subir imagen</title>
        <script>
            window.onload = function () {
                // Una vez cargada la página, el formulario se enviara automáticamente.
                document.forms["finalizar"].submit();
            };
        </script>
    </head>
    <body>
        <form id="finalizar" name="finalizar" action="finalizarSubida.jsp" method="post">
            <%
                FileItemFactory file_factory = new DiskFileItemFactory();
                ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
                List items = servlet_up.parseRequest(request);
                File archivo_server = new File("");
                String img = "";

                for (int i = 0; i < items.size(); i++) {
                    FileItem item = (FileItem) items.get(0);
                    if (!item.isFormField()) {
                        archivo_server = new File("D:\\PROYECTO\\PTF-TURISMO-REAL-WEB\\TurismoReal_WEB\\src\\main\\webapp\\asset\\img\\" + item.getName());

                        try {
                            item.write(archivo_server);
                        } catch (Exception e) {
                        }
                        img = item.getName();

                        request.getSession().setAttribute("nomFoto", img);
                    }

                }


            %>

        </form>

    </body>

</html>


