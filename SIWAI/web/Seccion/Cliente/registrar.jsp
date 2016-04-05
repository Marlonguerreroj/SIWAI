<%-- 
    Document   : registrar
    Created on : 17-mar-2016, 14:35:46
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Registrar Cliente</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <%
                String mensaje = session.getAttribute("msjRC") + "";
                if (!mensaje.equalsIgnoreCase("null")) {
            %>
            <div class="row">
                <% if (mensaje.contains("registrado")) {%>
                <div class="alert alert-success centrar-texto" role="alert" arial >
                    <%=mensaje%>
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                </div>
                <% } else if (mensaje.contains("Existe")) {%>
                <div class="alert alert-warning centrar-texto" role="alert">
                    <%=mensaje%>
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                </div>
                <% } else {%>
                <div class="alert alert-danger centrar-texto" role="alert">
                    <%=mensaje%>
                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                </div>
                <% } %>
            </div>
            <%
                    session.removeAttribute("msjRC");
                }
            %>
            <div>
                <h1 class="centrar-texto">Registrar Cliente</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form action="/SIWAI/ControladorCliente" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Nombres:</p>
                        </div>
                        <div class="col-md-3">
                            <input required name="nombre" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Apellidos:</p>
                        </div>
                        <div class="col-md-3">
                            <input required name="apellido" type="text" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Dni:</p>
                        </div>
                        <div class="col-md-3">
                            <input required name="dni" type="number" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>Telefono:</p>
                        </div>
                        <div class="col-md-3">
                            <input required name="telefono" type="number" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-1">
                            <p>Direccion:</p>
                        </div>
                        <div class="col-md-3">
                            <input name="direccion" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-1">
                            <p>E-mail:</p>
                        </div>
                        <div class="col-md-3">
                            <input name="email" type="text" class="form-control ">
                        </div>
                        <div class="col-md-1"></div>
                    </div>
                    <br>
                    <br>
                    <div class="row centrar-texto">
                        <div class="col-md-4"></div>
                        <div class="col-md-2">
                            <button name="registrarCliente" type="submit" class="btn btn-success btn-lg letra">
                                Registrar
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
