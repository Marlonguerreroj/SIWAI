<%-- 
    Document   : registrar
    Created on : 17-mar-2016, 14:57:15
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../../index.jsp");
    }%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Registrar Sucursal</title>
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

            <!-- Inicio del Alert  -->
            <%
                if (session.getAttribute("msjRS") != null) {
                    String mensaje = "" + session.getAttribute("msjRS");
                    if (mensaje.contains("registrada")) {
            %>           
            <div class="alert alert-success centrarDiv">
                <%
                } else if (mensaje.contains("Existe")) {
                %>
                <div class="alert alert-warning centrarDiv">
                    <%
                    } else {
                    %>
                    <div class="alert alert-danger centrarDiv">

                        <%
                            }
                        %>
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <%=session.getAttribute("msjRS")%>
                    </div>
                    <%
                            session.setAttribute("msjRS", null);
                        }
                    %>
                    <!-- Fin del Alert -->
                    <div>
                        <h1 class="centrar-texto">Registrar Sucursal</h1>
                    </div>
                    <br>
                    <!-- Inicio del formulario -->
                    <form action="/SIWAI/ControladorSucursal" method="post">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-1">
                                    <p >Codigo:</p>  
                                </div>
                                <div class="col-md-3">
                                    <input required name="codigo" type="text" class="form-control">
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-1">
                                    <p>Nombre:</p> 
                                </div>
                                <div class="col-md-3">
                                    <input  required name="nombre" type="text" class="form-control " >
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
                                    <input name="telefono"  type="number" class="form-control " >
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-1">
                                    <p>E-mail:</p> 
                                </div>
                                <div class="col-md-3">
                                    <input name="email" type="email" class="form-control "  >
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-1">
                                    <p>Pagina web:</p>  
                                </div>
                                <div class="col-md-3">
                                    <input name="paginaWeb" type="text" class="form-control "  >
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-1">
                                    <p>Direccion:</p> 
                                </div>
                                <div class="col-md-3">
                                    <input required name="direccion" type="text" class="form-control " >
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-1">
                                    <p>Ciudad:</p>  
                                </div>
                                <div class="col-md-3">
                                    <input required name="ciudad" type="text" class="form-control " >
                                </div>
                                <div class="col-md-2"></div>
                                <div class="col-md-1">
                                    <p>Pais:</p> 
                                </div>
                                <div class="col-md-3">
                                    <input required name="pais" type="text" class="form-control ">
                                </div>
                                <div class="col-md-1"></div>
                            </div>
                            <br>
                            <br>
                            <div class="row centrar-texto">
                                <div class="col-md-4"></div>
                                <div class="col-md-2">
                                    <button name="registrarSucursal" type="submit" class="btn btn-success btn-lg letra">Registrar
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
                        <!-- Fin del formulario -->
                    </form>
                    <!-- Fin del contenido principal-->
                    </section>
                    <!-- Inluye el footer de la pagina a traves de pie.jsp-->
                    <jsp:include page="../pie.jsp" />
                    </body>
                    </html>
