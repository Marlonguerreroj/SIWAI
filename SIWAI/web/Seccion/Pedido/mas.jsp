<%-- 
    Document   : mas
    Created on : 17-mar-2016, 14:45:27
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Registrar Pedido</title>
        <meta charset="UTF-8">
        <!-- Procurar llamar los archivos .min porque pesan menos -->
        <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../Css/estilos.css">
        <link rel="shortcut icon" type="image/x-icon" href="../../Imagenes/icono.ico">
        <script src="../../Js/javascript.js"></script>
        <!-- Script de Jquery 1.12-->
        <script src="../../Bootstrap/js/jquery.js"></script>
        <!-- Script de Bootstrap, agrega funcionalidad a la barra de navegacion -->
        <script src="../../Bootstrap/js/bootstrap.min.js"></script>
    </head>
    <body>
        <!-- Incluye la barra de navegacion que se encuentra en navegador.jsp -->
        <jsp:include page="../navegador.jsp" />
        <!-- Contenido principal contiene el formulario -->
        <section>
            <div>
                <h1 class="centrar-texto">Informacion del Pedido</h1>
            </div>
            <br>
            <br>
            <!-- Inicio Div que contiene el formulario de solo lectura -->
            <div class="container"> 
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                        <p>Codigo:</p>  
                    </div>
                    <div class="col-md-3">
                        <input readOnly  required  type="text" class="form-control ">
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-1">
                        <p>Proveedor:</p> 
                    </div>
                    <div class="col-md-3">
                        <input readOnly required type="text" class="form-control ">
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                        <p>Fecha:</p>  
                    </div>
                    <div class="col-md-3">
                        <input  readOnly  required  type="text" class="form-control ">
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-1">
                        <p>Referencia:</p> 
                    </div>
                    <div class="col-md-3">
                        <input readOnly  required  type="text" class="form-control ">
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                        <p>Cantidad:</p>  
                    </div>
                    <div class="col-md-3">
                        <input readOnly   type="text" class="form-control ">
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-1">
                        <p>Notas:</p> 
                    </div>
                    <div class="col-md-3">
                        <textarea readOnly  name="notas" class="form-control" ></textarea>

                    </div>
                    <div class="col-md-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-10"></div>
                    <div class="col-md-2">
                        <a href="consultar.jsp" class="btn btn-success btn-lg ">Volver
                        </a>
                    </div>
                    <div class="col-md-4"></div>

                </div>
            </div>
            <!-- Fin Div que contiene el formulario de solo lectura -->

            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
