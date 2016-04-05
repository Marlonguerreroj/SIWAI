<%-- 
    Document   : consultar
    Created on : 17-mar-2016, 14:36:13
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page import="co.edu.ufps.siwai.modelo.mysql.dto.ClienteDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Consultar Cliente</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                String mensaje = session.getAttribute("msjCC") + "";
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
                    session.removeAttribute("msjCC");
                }
            %>
            <div>
                <h1 class="centrar-texto">Consultar Cliente</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form action="/SIWAI/ControladorCliente" method="post" name="form">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2">
                            <p>Buscar por:</p>  
                        </div>
                        <div class="col-md-2">
                            <select name="sel" class="form-control" id="sel" required onchange="capturar()" >
                                <option value="" >Seleccione</option>
                                <option value="Todos" >Todos</option>
                                <option value="nom" >Nombre</option>
                                <option value="dni">Dni</option>
                            </select>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <p>Informacion:</p>  
                        </div>
                        <div class="col-md-2">
                            <input required name="informacion" type="text" class="form-control">
                        </div>
                        <div class="col-md-2">
                            <button name="consultarCliente" type="submit" class="btn btn-success  letra">
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
            <% if (session.getAttribute("clientes") != null) { %>
            <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Dni</th>
                                        <th>Telefono</th>
                                        <th>Direccion</th>
                                        <th>E-mail</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <%
                                    ArrayList<ClienteDTO> dtos = (ArrayList) session.getAttribute("clientes");
                                    for (int i = 0; i < dtos.size(); i++) {
                                %>
                                <tr>
                                    <td><%=dtos.get(i).getNombre()%></td>
                                    <td><%=dtos.get(i).getApellido()%></td>
                                    <td><%=dtos.get(i).getDni()%></td>
                                    <td><%=dtos.get(i).getTelefono()%></td>
                                    <td><%=dtos.get(i).getDireccion()%></td>
                                    <td><%=dtos.get(i).getEmail()%></td>
                                    <td>
                                        <a href="actualizar.jsp" style="cursor: pointer;">
                                            <span class="glyphicon glyphicon-edit asd "></span>
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
            <%  session.removeAttribute("clientes");
                } %>                
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
