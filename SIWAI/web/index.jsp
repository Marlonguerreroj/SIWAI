<%-- 
    Document   : index
    Created on : 17-mar-2016, 14:24:44
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>SIWAI</title>
        <!-- Procurar llamar los archivos .min porque pesan menos -->
        <link rel="stylesheet" href="Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="Css/estilos.css">
        <link rel="shortcut icon" type="image/x-icon" href="Imagenes/icono.ico">
        <script src="../../Ajax/ajax.js"></script>
    </head>
    <body>
        <!--Inicio - Div que contiene la imagen corporativa-->
        <div class="centrarDiv">
            <img src="Imagenes/Logo.png" alt="" class="imagen">
        </div>
        <!--Fin - Div que contiene la imagen corporativa-->
        <!--Inicio - Div que contiene el formulario para iniciar sesion-->
        <div class="centrarLogin well">
            <form  class="form-inline" action="/SIWAI/ControladorEmpleado" method="post">
                <div id="dv1" class="form-group">
                    <a class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-user"></span></a>
                    <input required type="text" class="form-control" name="usuario" placeholder="Usuario">
                </div>
                <div id="dv2" class="form-inline espaciado">
                    <a class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-lock"></span></a>
                    <input required type="password" class="form-control" name="contra" placeholder="Contraseña">
                </div>
                <button class="btn btn-danger espaciado" onclick="iniciarSesion(document)">Ingresar</button>
            </form>
        </div>
        <!-- Pie, no se incluye pie.jsp por diferencia de rutas en la imagen.-->
        <footer class="centrar-texto">
            <img src="Imagenes/logoufps.png" alt="" class="footerImagen"><br>
            <p>&copy Copyright 2016</p>
        </footer>
    </body>
</html>
