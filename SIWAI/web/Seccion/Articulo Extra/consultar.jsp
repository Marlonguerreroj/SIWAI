<%-- 
    Document   : consultar
    Created on : 17-mar-2016, 14:34:19
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Consultar Articulo Extra</title>
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
                <h1 class="centrar-texto">Consultar Articulo Extra</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form name="form" action="" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1">
                            <p>Sucursal:</p>  
                        </div>
                        <div class="col-md-2">
                            <select required name="sel0" class="form-control" id="sel0" onchange="capturar()">
                                <option value="" >Seleccione</option>
                                <option value="Todos" >Todas</option>
                                <option value="">Sucursal 1</option>
                            </select>
                        </div>

                        <div class="col-md-2">
                            <p>Buscar por:</p>  
                        </div>
                        <div class="col-md-2">
                            <select required name="sel" class="form-control" id="sel" onchange="capturar()">
                                <option value="" >Seleccione</option>
                                <option value="Todos" >Todos</option>
                                <option value="Codigo" >Codigo</option>
                                <option value="Nombre">Nombre</option>
                            </select>
                        </div>
                        <div class="col-md-1">
                            <p>Informacion:</p>  
                        </div>
                        <div class="col-md-2">
                            <input required id="informacion" name="informacion" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2">
                            <button name="buscarExtra" type="submit" class="btn btn-success  letra">
                                <span class="glyphicon glyphicons glyphicon-search"></span>
                            </button>
                        </div>

                    </div>
                </div>
            </form>
            <br>
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Sucursal</th>
                                        <th>Nombre</th>
                                        <th>Valor</th>
                                        <th>Cantidad</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td>1</td>
                                    <td>Sucursal 1</td>
                                    <td>Adorno Musical</td>
                                    <td>15.000</td>
                                    <td>8</td>
                                    <td>

                                        <a href="mas.jsp" style="cursor:pointer;">
                                            <span class="glyphicon glyphicon-info-sign asd "></span>
                                        </a>
                                    </td>

                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
