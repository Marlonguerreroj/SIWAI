<%-- 
    Document   : mas
    Created on : 17-mar-2016, 14:35:04
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Informacion del Articulo Extra</title>
        <meta charset="UTF-8">
        <!-- Procurar llamar los archivos .min porque pesan menos -->
        <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../Css/estilos.css">
        <link rel="shortcut icon" type="image/x-icon" href="../../Imagenes/icono.ico">
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
                <h1 class="centrar-texto">Informacion del Articulo Extra</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                        <p>Codigo:</p>  
                    </div>
                    <div class="col-md-3">
                        <input readOnly value="" name="codigo" type="text" class="form-control ">
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-1">
                        <p>Sucursal:</p> 
                    </div>
                    <div class="col-md-3">
                        <select name="sel1" class="form-control" id="sel1" required disabled>
                            <option value="">Seleccione</option>
                        </select> 
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                        <p>Nombre:</p>  
                    </div>
                    <div class="col-md-3">
                        <input readOnly value="" name="nombre" type="text" class="form-control ">
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-1">
                        <p>Cantidad:</p>
                    </div>
                    <div class="col-md-3">
                        <input readOnly value="" name="cantidad" type="text" class="form-control ">
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                        <p>Fecha de entrada:</p>  
                    </div>
                    <div class="col-md-3">
                        <br>
                        <input readOnly value="" name="fEntrada" type="text" class="form-control ">
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-1">
                        <p>Costo por unidad:</p>
                    </div>
                    <div class="col-md-3">
                        <br>
                        <input readOnly value="" name="costo" type="text" class="form-control ">
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <br>
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-1">
                        <p>Valor:</p>  
                    </div>
                    <div class="col-md-3">
                        <input readOnly value="" name="valor" type="text" class="form-control ">
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
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>