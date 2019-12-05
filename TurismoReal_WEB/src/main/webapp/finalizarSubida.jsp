<%-- 
    Document   : finalizarSubida
    Created on : 02-12-2019, 14:01:07
    Author     : Adán Esteban
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <title>Finalizar subida</title>
    </head>
    <body>
        

        <section id="form-reserva">   
            <div class="container"> 
                <form name="frm" action="SubirImagenesController" method="post">

                    <div class="row">
                        <div class="col-md-6" id="blaBla" style="margin-top: -75px;">
                            <img src="asset/img/logo.png" alt="Image" width="430" height="430" class="img-fluid rounded mb-4">

                        </div>
                        

                        <div class="col-md-6" style="margin-top: -80px;">
                            <h2 style="margin-left: 60px;">Formulario Reserva</h2>
                            <br>

                            <div class="row">
                                <div class="col-md-12 " style="margin-top: -20px;">
                                    <div class="form-gorup">
                                        <label>Seleccione el departamento</label>
                                        <select name="opcionDepto" class="form-control">
                                            <option value="0">Elija un departamento...</option>
                                            <jsp:useBean class="dao.DepartamentoDAO" id="deptoDAO"></jsp:useBean>  
                                            <c:forEach items="${deptoDAO.listar()}" var="depto">

                                                <option value="${depto.getId_departamento()}">${depto.getNom_comuna()}, Dirección: ${depto.getDireccion_departamento()}</option>

                                            </c:forEach>
                                        </select>

                                    </div>

                                </div> 

                                <div class="col-md-12">
                                    <div class="form-gorup">
                                        <label>Ruta imagen</label>
                                        <input id="txtImagen"  type="text" name="txtImagen" class="form-control" value="${nomFoto}" readonly="true"> 
                                    </div>
                                </div>





                                <div class="col-md-12" style="margin-top: 10px;">
                                    <input class="btn btn-dark full-width" type="submit"  name="accion" value="Subir imagen" required> 
                                </div>


                            </div>
                        </div>

                    </div>
                </form>
            </div> 
            
        </section>

                          
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
