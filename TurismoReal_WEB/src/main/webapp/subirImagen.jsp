<%-- 
    Document   : subirImagen
    Created on : 02-12-2019, 1:50:47
    Author     : Adán Esteban
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h2 align="center">Cargar Imagen</h2>
         <table border="0" width="400" align="center">
        <form action="procesarImagen.jsp" enctype="multipart/form-data" method="post">
            <tr bgcolor="skyblue">                         
                <th>Imagen</th>
                <th><input type="file" name="file"/></th>
            </tr><tr> 
                <th colspan="2">                                                                                                       
                    <input type="submit" value="Subir" name="CargarImagen"/>
                </th></tr>
        </form>                
        </table>
    </body>
</html>
