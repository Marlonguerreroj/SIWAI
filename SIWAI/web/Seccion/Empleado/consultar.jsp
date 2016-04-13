<%-- 
    Document   : consultar
    Created on : 17-mar-2016, 14:37:57
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="co.edu.ufps.siwai.modelo.mysql.dto.EmpleadoDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../../index.jsp");
    }%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Consultar Empleado</title>
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
            <div>
                <h1 class="centrar-texto">Consultar Empleado</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form action="/SIWAI/ControladorEmpleado" method="post" name="form">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-4">
                            <label for="sel" >Buscar por: </label>
                            <select name="sel" class="tamañoConsultar" id="sel" required onchange="capturar()" >
                                <option value="">Seleccione</option>
                                <option value="Todos">Todos</option>
                                <option value="Sucursal">Sucursal</option>
                                <option value="Dni">Dni</option>
                                <option value="Nombre">Nombre</option>
                                <option value="Codigo">Codigo</option>
                            </select>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-4">
                            <label for="informacion">Informacion: </label>
                            <input required name="informacion" type="text" class="tamañoConsultar">
                        </div>
                        <div class="col-md-1">
                            <button name="consultarEmpleado" type="submit" class="btn btn-success  letra">
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
            <%
                if (session.getAttribute("empleados") != null) {
            %>
            <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Dni</th>
                                        <th>Nombre</th>
                                        <th>Sucursal</th>
                                        <th>Cargo</th>
                                        <th>Fecha Ingreso</th>
                                        <th>Fecha Salida</th>
                                        <th>Celular</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <%
                                    ArrayList<EmpleadoDTO> lista = (ArrayList) session.getAttribute("empleados");
                                    for (int i = 0; i < lista.size(); i++) {
                                %>
                                <tr>
                                    <td><%=lista.get(i).getDni()%></td>
                                    <td><%=lista.get(i).getNombre()%></td>
                                    <td><%=lista.get(i).getSucursal()%></td>
                                    <td><%=lista.get(i).getCargo()%></td>
                                    <td><%=lista.get(i).getfIngreso()%></td>
                                    <td><%=lista.get(i).getfSalida()%></td>
                                    <td><%=lista.get(i).getCelular()%></td>

                                    <td>
                                        <a href="actualizar.jsp">
                                            <span class="glyphicon glyphicon-edit asd "></span>
                                        </a>
                                        <a href="mas.jsp">
                                            <span class="glyphicon glyphicon-info-sign asd "></span>
                                        </a>
                                    </td>
                                </tr>
                                <% }
                                    session.setAttribute("empleados", null);
                                %>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <%}%>
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
