<%--
    Document   : registrar
    Created on : 17-mar-2016, 14:59:31
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Registrar Venta</title>
        <meta charset="UTF-8">
        <!-- Procurar llamar los archivos .min porque pesan menos -->
        <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../Css/estilos.css">
        <link rel="shortcut icon" type="image/x-icon" href="../../Imagenes/icono.ico">
        <script src="../../Js/javascript.js"></script>
        <script src="../../Js/blockUI.js"></script>
    </head>
    <body>
        <!-- Incluye la barra de navegacion que se encuentra en navegador.jsp -->
        <jsp:include page="../navegador.jsp" />
        <!-- Contenido principal contiene el formulario -->
        <section>
            <div>
                <h1 class="centrar-texto">Registrar Venta</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form action="" method="post" >
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Codigo:</p>
                        </div>
                        <div class="col-md-3">
                            <input required name="nFactura" type="number" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Sucursal:</p>
                        </div>
                        <div class="col-md-3">
                            <select name="sel1" class="form-control" id="sel1" required>
                                <option value="">Seleccione</option>
                                <option value=""></option>
                            </select>            </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Empleado:</p>
                        </div>
                        <div class="col-md-3">
                            <select name="sel1" class="form-control" id="sel1" required>
                                <option value="">Seleccione</option>
                                <option value=""></option>
                            </select>             </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>
                        </div>
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <div class="table-responsive">
                                <table class="table" id="table">
                                    <thead>
                                        <tr>
                                            <th>Referencia</th>
                                            <th>Nombre</th>
                                            <th>Cantidad</th>
                                            <th>Precio</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td>
                                            <input id="codigo1" required name="codigo[]" type="text" class="form-control ">
                                        </td>
                                        <td>
                                            <input readOnly id="nombre1" name="nombre" type="text" class="form-control ">
                                        </td>
                                        <td>
                                            <input  onkeypress="chequearEnter2(event)"  required name="cantidad[]" id='cantidad1' type="number" class="form-control ">
                                        </td>
                                        <td>
                                            <input readOnly id="total"  required name="cantidad[]" id='cantidad1' type="number" class="form-control ">
                                        </td>

                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <br>
                    <div class="row centrar-texto">
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <button name="enviar" type="submit" class="btn btn-success btn-lg letra">Registrar
                            </button>
                        </div>
                        <div class="col-md-2">
                            <a href="../Menu/menu.jsp" class="btn btn-danger btn-lg letra">Cancelar
                            </a>
                        </div>
                        <div class="col-md-4"></div>

                    </div>
                </div>
                <br>
                <br>
            </form>
            <!-- Fin del formulario -->

            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
        <!-- Script de Jquery 1.12-->
        <script src="../../Bootstrap/js/jquery.js"></script>
        <!-- Script de Bootstrap, agrega funcionalidad a la barra de navegacion -->
        <script src="../../Bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>
