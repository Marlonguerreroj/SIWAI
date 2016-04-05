<%-- 
    Document   : consultar
    Created on : 17-mar-2016, 14:48:26
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="co.edu.ufps.siwai.modelo.mysql.dto.ProveedorDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Consultar Proveedor</title>
        <meta charset="UTF-8">
        <!-- Procurar llamar los archivos .min porque pesan menos -->
        <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../Css/estilos.css">
        <link rel="shortcut icon" type="image/x-icon" href="../../Imagenes/icono.ico">
        <!-- Script de Jquery 1.12-->
        <script src="../../Bootstrap/js/jquery.js"></script>
        <!-- Script de Bootstrap, agrega funcionalidad a la barra de navegacion -->
        <script src="../../Bootstrap/js/bootstrap.min.js"></script>
        <script src="../../Js/javascript.js"></script>
    </head>
    <body>
        <!-- Incluye la barra de navegacion que se encuentra en navegador.jsp -->
        <jsp:include page="../navegador.jsp" />
        <!-- Contenido principal contiene el formulario -->
        <section>
            <%
                String mensaje = session.getAttribute("msjCP") + "";
                if (!mensaje.equals("null")) {
                    if(mensaje.contains("Error")){
            %>
            <div class="alert alert-danger centrar-texto" role="alert" arial >
                <%=mensaje%>
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>
            <%
                    } else { %>
            <div class="alert alert-warning centrar-texto" role="alert" arial >
                <%=mensaje%>
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            </div>            
            <%      }
                    session.removeAttribute("msjCP");
                }
            %>
            <div>
                <h1 class="centrar-texto">Consultar Proveedor</h1>
            </div>
            <br>
            <form name="form" action="/SIWAI/ControladorProveedor" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2">
                            <p>Buscar por:</p>  
                        </div>
                        <div class="col-md-2">
                            <select name="sel" class="form-control" id="sel" required onchange="capturar()" >
                                <option value="" >Seleccione</option>
                                <option value="Todos" >Todos</option>
                                <option value="cod" >Código</option>
                                <option value="nom" >Nombre</option>
                            </select>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <p>Información:</p>  
                        </div>
                        <div class="col-md-2">
                            <input required id="informacion" name="informacion" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2">
                            <button name="consultarProveedor" type="submit" class="btn btn-success  letra">
                                <span class="glyphicon glyphicons glyphicon-search"></span>
                            </button>
                        </div>
                        <div class="col-md-1">
                        </div>
                    </div>
                </div>
            </form>
            <br>
            <br>
            <% if (session.getAttribute("proveedores") != null) { %>
            <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="table-responsive">
                            <table  class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Codigo</th>
                                        <th>Nombre</th>
                                        <th>Teléfono</th>
                                        <th>Email</th>
                                        <th>Pagina Web</th>
                                        <th>Cuenta</th>
                                        <th>Tipo de Cuenta</th>
                                        <th>Número de Cuenta</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <%
                                    ArrayList<ProveedorDTO> dtos = (ArrayList) session.getAttribute("proveedores");
                                    for (int i = 0; i < dtos.size(); i++) {
                                %>
                                <tr>
                                    <td><%=dtos.get(i).getCodigo()%></td>
                                    <td><%=dtos.get(i).getNombre()%></td>
                                    <td><%=dtos.get(i).getTelContacto()%></td>
                                    <td><%=dtos.get(i).getEmailContacto()%></td>
                                    <td><%=dtos.get(i).getSitioWeb()%></td>
                                    <td><%=dtos.get(i).getCuenta()%></td>
                                    <td><%=dtos.get(i).getTipoCuenta()%></td>
                                    <td><%=dtos.get(i).getNumCuenta()%></td>
                                    <td>
                                        <a href="actualizar.jsp" style="cursor:pointer;">
                                            <span class="glyphicon glyphicon-edit"></span>
                                        </a>
                                        <a href="mas.jsp" style="cursor:pointer;">
                                            <span class="glyphicon glyphicon-info-sign"></span>
                                        </a>
                                    </td>
                                </tr>
                                <%  } %>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <%  session.removeAttribute("proveedores");
                } %>
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
