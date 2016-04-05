<%-- 
    Document   : actualizar
    Created on : 17-mar-2016, 14:49:01
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Actualizar Proveedor</title>
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
                <h1 class="centrar-texto">Actualizar Proveedor</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form  action="" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Codigo:</p> 
                        </div>
                        <div class="col-md-3">
                            <input required readOnly name="codigo" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>NIT:</p> 
                        </div>
                        <div class="col-md-3">
                            <input required name="nit" type="number" class="form-control ">
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
                            <input required name="nombre" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Pagina web:</p> 
                        </div>
                        <div class="col-md-3">
                            <input name="pagina" type="text" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Telefono:</p>  
                        </div>
                        <div class="col-md-3">
                            <input required name="telefono" type="number" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>E-mail:</p> 
                        </div>
                        <div class="col-md-3">
                            <input required name="email" type="email" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Tipo cuenta bancaria:</p>  
                        </div>
                        <div class="col-md-3">
                            <br>
                            <input required name="tipoCuentaBancaria" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>N&ordm; cuenta bancaria:</p> 
                        </div>
                        <div class="col-md-3">
                            <br>
                            <input required name="nCuentaBancaria" type="number" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Cuenta Bancaria:</p>  
                        </div>
                        <div class="col-md-3">
                            <input required name="cuentaBancaria" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Nombre contacto:</p> 
                        </div>
                        <div class="col-md-3">
                            <input required name="nombreContacto" type="text" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <br>
                    <div class="row centrar-texto">
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <button name="enviar" type="submit" class="btn btn-success btn-lg letra">Actualizar
                            </button>
                        </div>
                        <div class="col-md-2">
                            <a href="consultar.jsp" class="btn btn-danger btn-lg letra">Cancelar
                            </a>
                        </div>
                        <div class="col-md-4"></div>

                    </div>
                </div>
                <br>
                <!-- Fin del formulario -->
            </form>
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
