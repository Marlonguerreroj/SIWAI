<%--
    Document   : registrar
    Created on : 17-mar-2016, 14:46:37
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Registrar Comparacion</title>
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
                <h1 class="centrar-texto">Registrar Comparacion</h1>
            </div>
            <br>
            <br>
            <!-- Inicio del formulario para registrar una comparacion -->
            <form  action="" method="post" name="form2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Codigo:</p>
                        </div>
                        <div class="col-md-3">
                            <input readOnly  required name ="codigo" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Sucursal:</p>
                        </div>
                        <div class="col-md-3">
                            <select name="sel1" class="form-control" id="sel1" required>
                                <option value="">Seleccione</option>
                                <option ></option>
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
                            <input required name="fecha" type="date" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Cantidad articulos:</p>
                        </div>
                        <div class="col-md-3">
                            <input required name="articulos" type="number" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Cantidad unidades:</p>
                        </div>
                        <div class="col-md-3">
                            <input required name="unidades" type="number" class="form-control ">
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
                                            <th>Cantidad</th>
                                            <th>Valor</th>
                                            <th>Valor Transporte</th>
                                            <th>Costo</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td>
                                            <input readOnly  required name="referencia[]" type="text" class="form-control ">
                                        </td>
                                        <td>
                                            <input required   name="cantidad[]" type="number" class="form-control ">
                                        </td>
                                        <td>
                                            <input required name="valor[]"  type="number" class="form-control ">
                                        </td>
                                        <td>
                                            <input required name="valorTrans[]" type="number" class="form-control ">
                                        </td>
                                        <td>
                                            <input required name="costo[]" type="number" class="form-control ">
                                        </td>
                                        <td>
                                            <a  data-toggle="modal"  data-target="#myModal"  style="cursor:pointer;">
                                                <span class="glyphicon glyphicon-plus-sign"></span>
                                            </a>
                                        </td>
                                    </tr>


                                </table>
                            </div>
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row centrar-texto">
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <button  name="enviarComparacion" type="submit" class="btn btn-success btn-lg letra">Registrar
                            </button>
                        </div>
                        <div class="col-md-2">
                            <a  href="consultar.jsp" class="btn btn-danger btn-lg letra">Cancelar
                            </a>
                        </div>
                        <div class="col-md-4"></div>
                    </div>
                    <br>
                </div>
            </form>
            <!-- Fin del formulario para registrar una comparacion-->
            <!-- Inicio modal para añadir seriales -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Registrar Serial</h4>
                        </div>
                        <form>
                            <div class="modal-body">

                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-1">
                                            <p>Codigo:</p>
                                        </div>
                                        <div class="col-md-2">
                                            <input  required  name="cod" id="cod" type="text" class="form-control ">
                                        </div>
                                        <div class="col-md-1">
                                            <p>Referencia:</p>
                                        </div>
                                        <div class="col-md-2">
                                            <select name="ref" class="form-control" id="ref" required>
                                                <option value="">Seleccione</option>
                                                <option value=""></option>
                                            </select>                            </div>
                                        <div class="col-md-1"></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <p>Sucursal:</p>
                                        </div>
                                        <div class="col-md-2">
                                            <select name="suc" class="form-control" id="suc" required>
                                                <option value="">Seleccione</option>
                                                <option ></option>
                                            </select>
                                        </div>
                                        <div class="col-md-1">
                                            <p>Pedido:</p>
                                        </div>
                                        <div class="col-md-2">
                                            <input readOnly name="pedi" value="" id="pedi" type="text" class="form-control ">
                                        </div>
                                        <div class="col-md-1"></div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1">
                                            <p>Descripcion:</p>
                                        </div>
                                        <div class="col-md-5">
                                            <input required name="desc" id="desc" type="text" class="form-control ">
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <a class="btn btn-success" >Registrar</a>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
            <!-- Fin modal para añadir seriales -->
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
