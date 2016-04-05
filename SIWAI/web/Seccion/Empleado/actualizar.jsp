<%-- 
    Document   : actualizar
    Created on : 17-mar-2016, 14:39:01
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Actualizar Empleado</title>
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
                <h1 class="centrar-texto">Actualizar Empleado</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form  action="" method="post" name="form2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-4">
                            <select name="sel1" class="form-control" id="sel1" required>
                                <option value="">Seleccione</option>
                            </select>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-4">
                            <select name="sel2" class="form-control" id="sel2" required onchange="habilitar()">
                                <option value="">Seleccione</option>
                            </select>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>DNI:</p>
                        </div>
                        <div class="col-md-3">
                            <input readOnly value="" required name="dni" type="number" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Nombre:</p>
                        </div>
                        <div class="col-md-3">
                            <input value="" required name="nombre" type="text" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>

                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Apellido:</p>
                        </div>
                        <div class="col-md-3">
                            <input value="" required name="apellido" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Telefono:</p>
                        </div>
                        <div class="col-md-3">
                            <input value="" name="telefono" type="number" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Celular:</p>
                        </div>
                        <div class="col-md-3">
                            <input value="" required name="celular" type="number" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Contraseña:</p>
                        </div>
                        <div class="col-md-3">
                            <input id="contraseña" name="contraseña" type="text" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>E-mail:</p>
                        </div>
                        <div class="col-md-3">
                            <input value="" name="email" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Direccion:</p>
                        </div>
                        <div class="col-md-3">
                            <input  value="" name="direccion" type="text" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Fecha ingreso:</p>
                        </div>
                        <div class="col-md-3">
                            <input value="" required  name="fIngreso" type="date" class="form-control">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-2">
                            <div class="radio">
                                <label><input value ="0" type="radio" name="radio">Habilitado</label>
                            </div>
                        </div>
                        <div class="col-md-2">
                            <div class="radio">
                                <label><input value="1" type="radio" name="radio">Deshabilitado</label>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                    </div>

                    <br>
                    <br>
                    <div class="row centrar-texto">
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <button  name="enviar2" type="submit" class="btn btn-success btn-lg letra">Actualizar
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
            </form>
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
