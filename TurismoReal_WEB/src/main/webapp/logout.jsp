<%-- 
    Document   : logout
    Created on : 16-10-2019, 19:09:38
    Author     : jcarl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="png" href="asset/img/logo.png" />
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            session.invalidate();
            request.getRequestDispatcher("login.jsp").forward(request, response);
            //response.sendRedirect("login.jsp");
            
        %>
    </body>
</html>
