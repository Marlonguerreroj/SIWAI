<%-- 
    Document   : registrar
    Created on : 17-mar-2016, 14:34:36
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Registrar Articulo Extra</title>
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
                <h1 class="centrar-texto">Registrar Articulo Extra</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form action="" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p class="letra2">Codigo:  
                        </div>
                        <div class="col-md-3">
                            <input required name="codigo" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p class="letra2">Sucursal: 
                        </div>
                        <div class="col-md-3">
                            <select name="sel1" class="form-control" id="sel1" required>
                                <option value="">Seleccione</option>
                                <option value="">Sucursal 1</option>
                            </select>            </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p class="letra2">Nombre:  
                        </div>
                        <div class="col-md-3">
                            <input required name="nombre" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p class="letra2">Cantidad:
                        </div>
                        <div class="col-md-3">
                            <input required name="cantidad" type="number" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p class="letra2">Fecha de entrada:  
                        </div>
                        <div class="col-md-3">
                            <br>
                            <input required name="fEntrada" type="date" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p class="letra2">Costo por unidad:
                        </div>
                        <div class="col-md-3">
                            <br>
                            <input required name="costo" type="number" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p class="letra2">Valor:  
                        </div>
                        <div class="col-md-3">
                            <input required name="valor" type="number" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p class="letra2">Notas:
                        </div>
                        <div class="col-md-3">
                            <textarea name="notas" class="form-control" ></textarea>
                        </div>
                        <div class="col-md-1"></div>
                    </div>

                    <br>
                    <br>
                    <div class="row centrar-texto">
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <button name="enviarExtra" type="submit" class="btn btn-success btn-lg letra">Registrar
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
