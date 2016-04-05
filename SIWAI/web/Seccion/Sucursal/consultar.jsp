<%-- 
    Document   : consultar
    Created on : 17-mar-2016, 14:58:14
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page import="co.edu.ufps.siwai.modelo.mysql.dto.SucursalDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Consultar Sucursal</title>
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
                <h1 class="centrar-texto">Consultar Sucursal</h1>
            </div>
            <br>
            <!-- Formulario para consultar la sucursal -->
            <form name="form" action="/SIWAI/ControladorSucursal" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-2">
                            <p>Buscar por:</p>  
                        </div>
                        <div class="col-md-2">
                            <select name="sel" id="sel" class="form-control"  onchange="capturar()" required>
                                <option value="" >Seleccione</option>
                                <option value="Todos" >Todos</option>
                                <option value="Codigo" >Codigo</option>
                                <option value="Nombre" >Nombre</option>
                            </select>
                        </div>
                        <div class="col-md-1"></div>
                        <div class="col-md-2">
                            <p>Informacion:</p>  
                        </div>
                        <div class="col-md-2">
                            <input required id="informacion" name="informacion" type="text" class="form-control ">
                        </div>
                        <div class="col-md-2">
                            <button name="consultarSucursal" type="submit" class="btn btn-success  letra">
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
            <!-- Finalizacion del formulario para consultar -->
            <%
            if(session.getAttribute("sucursales")!=null){    
            %>
            <!-- Div que contiene la tabla de sucursales -->
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
                                        <th>Telefono</th>
                                        <th>Email</th>
                                        <th>Pagina Web</th>
                                        <th>Direccion</th>
                                        <th>Ciudad</th>
                                        <th>Pais</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <%
                                    ArrayList<SucursalDTO> lista = (ArrayList) session.getAttribute("sucursales");
                                    if (lista != null) {
                                        for (int i = 0; i < lista.size(); i++) {
                                %> 
                                <tr>
                                    <td><%= lista.get(i).getCodigo()%></td>
                                    <td><%= lista.get(i).getNombre()%></td>
                                    <td><%= lista.get(i).getTelefono()%></td>
                                    <td><%= lista.get(i).getEmail()%></td>
                                    <td><%= lista.get(i).getPaginaWeb()%></td>
                                    <td><%= lista.get(i).getDireccion()%></td>
                                    <td><%= lista.get(i).getCiudad()%></td>
                                    <td><%= lista.get(i).getPais()%></td>                          
                                    <td>
                                        <a href="actualizar.jsp?codigo=<%=i %>" style="cursor:pointer;">
                                            <span class="glyphicon glyphicon-edit asd "></span>
                                        </a>
                                    </td>
                                </tr> 
                                <% }
                                        session.setAttribute("sucursales", null);
                                    }
                                    
                                %>
                            </table>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
                <!-- Fin del div que contiene la tabla de sucursales -->
                <% } %>
            </div>
            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
