<%--
    Document   : registrar
    Created on : 17-mar-2016, 14:44:37
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
        <script src="../../Js/blockUI.js"></script>
    </head>
    <body>
        <!-- Incluye la barra de navegacion que se encuentra en navegador.jsp -->
        <jsp:include page="../navegador.jsp" />
        <!-- Contenido principal contiene el formulario -->
        <section>
            <div>
                <h1 class="centrar-texto">Registrar Pedido</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form action="" method="post" id="form" name="form" onkeypress="return anular(event)">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Codigo:</p>
                        </div>
                        <div class="col-md-3">
                            <input required name="codigo0" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Proveedor:</p>
                        </div>
                        <div class="col-md-3">
                            <select name="sel1" class="form-control" id="sel1" required>
                                <option value="">Seleccione</option>
                                <option>Yamaha</option>
                            </select>
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
                            <input required  name="fecha" type="date" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Notas:</p>
                        </div>
                        <div class="col-md-3">
                            <textarea name="notas" class="form-control" ></textarea>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
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
                                            <input  onkeypress="chequearEnter(event)"  required name="cantidad[]" id='cantidad1' type="number" class="form-control ">
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
                            <button  name="enviarPedido" type="submit" class="btn btn-success btn-lg letra">Registrar
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
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
