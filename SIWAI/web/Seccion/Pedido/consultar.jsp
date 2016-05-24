<%--
    Document   : consultar
    Created on : 17-mar-2016, 14:45:05
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Consultar Pedido</title>
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
        <script src="../../Js/blockUI.js"></script>
    </head>
    <body>
        <!-- Incluye la barra de navegacion que se encuentra en navegador.jsp -->
        <jsp:include page="../navegador.jsp" />
        <!-- Contenido principal contiene el formulario -->
        <section>
            <div>
                <h1 class="centrar-texto">Consultar Pedido</h1>
            </div>
            <br>
            <!-- Inicio del formulario para consultar el pedido-->
            <form action="../Script/ScriptPedido.php" method="post" name="form">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2">
                            <p>Buscar por:</p>
                        </div>
                        <div class="col-md-2">
                            <select name="sel" class="form-control" id="sel" required onchange="capturar()">
                                <option value="">Seleccione</option>
                                <option value="Fecha">Fecha</option>
                                <option value="CodigoProv">Codigo Proveedor</option>
                                <option value="CodigoPedi">Codigo Pedido</option>
                            </select>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <p>Informacion:</p>
                        </div>
                        <div class="col-md-2">
                            <input required name="informacion" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2">
                            <button name="buscar" type="submit" class="btn btn-success  letra">
                                <span class="glyphicon glyphicons glyphicon-search"></span>
                            </button>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>
                </div>
                <br>
                <br>
            </form>
            <!-- Fin del formulario para consultar el pedido-->
            <!-- Inicio del div que contiene la tabla de pedidos -->
            <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Proveedor</th>
                                        <th>Fecha</th>
                                        <th>Referencia</th>
                                        <th>Cantidad</th>
                                        <th></th>
                                    </tr>
                                </thead>

                                <tr>
                                    <td>1234</td>
                                    <td>Yamaha</td>
                                    <td>13/02/16</td>
                                    <td>G001</td>
                                    <td>20</td>
                                    <td>

                                        <a href="registrarComparacion.jsp" style="cursor:pointer;">
                                            <span class="glyphicon glyphicon-download-alt"></span>
                                        </a>
                                        <a href="mas.jsp" style="cursor:pointer;">
                                            <span class="glyphicon glyphicon-info-sign"></span>
                                        </a>
                                    </td>
                                </tr>
                                <?php endfor; ?>

                            </table>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <!-- Fin del div que contiene la tabla de pedidos -->
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
