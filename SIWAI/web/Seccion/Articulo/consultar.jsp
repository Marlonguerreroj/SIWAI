<%--
    Document   : consultar
    Created on : 17-mar-2016, 14:29:27
    Author     : Alejandro Ramirez; Marlon Guerrero.
--%>

<%@page import="co.edu.ufps.siwai.modelo.dto.ArticuloDTO"%>
<%@page import="co.edu.ufps.siwai.modelo.dto.SucursalDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="co.edu.ufps.siwai.modelo.Fachada"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../../index.jsp");
    }%>
<%
    Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
    ArrayList<SucursalDTO> lista = fachada.consultarSucursal("Todos", "");
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Consultar Articulo</title>
        <meta charset="UTF-8">
        <!-- Procurar llamar los archivos .min porque pesan menos -->
        <link rel="stylesheet" href="../../Bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="../../Css/estilos.css">
        <link rel="shortcut icon" type="image/x-icon" href="../../Imagenes/icono.ico">
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
                <h1 class="centrar-texto">Consultar Articulo</h1>
            </div>
            <br>
            <!-- Inicio del formulario -->
            <form name="form" action="/SIWAI/ControladorArticulo" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-md-1">
                            <p>Sucursal:</p>
                        </div>
                        <div class="col-md-2">
                            <select required name="sucursal" class="form-control" id="sel" >
                                <option value="" >Seleccione</option>
                                <option value="Todos" >Todas</option>
                                <% for (int i = 0; i < lista.size(); i++) {%>
                                <option value="<%=lista.get(i).getCodigo()%>"><%=lista.get(i).getNombre()%></option>
                                <% }
                                %>
                            </select>
                        </div>

                        <div class="col-md-2">
                            <p>Buscar por:</p>
                        </div>
                        <div class="col-md-2">
                            <select required name="sel" class="form-control" id="sel" onchange="capturar()">
                                <option value="" >Seleccione</option>
                                <option value="Tipo" >Tipo</option>
                                <option value="Referencia" >Referencia</option>
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
                            <button name="consultarArticulo" type="submit" class="btn btn-success  letra">
                                <span class="glyphicon glyphicons glyphicon-search"></span>
                            </button>
                        </div>

                    </div>
                </div>
            </form>
            <br>
            <br>
            <%
                if (request.getSession().getAttribute("articulos") != null) {
                    ArrayList<ArticuloDTO> lis = (ArrayList<ArticuloDTO>) request.getSession().getAttribute("articulos");
                    System.out.println(lis.size());
            %>
            <div class="container">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Sucursal</th>
                                        <th>Referencia</th>
                                        <th>Nombre</th>
                                        <th>Tipo</th>
                                        <th>Cantidad</th>
                                        <th>Valor</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <%for (int i = 0; i < lis.size(); i++) {
                                    System.out.print("entro 0");
                                    String ref=lis.get(i).getReferencia();
                                    String nom=lis.get(i).getNombre();
                                    String tipo=lis.get(i).getTipoArticulo();
                                %>
                                    <tr>

                                    <td>Sucursal xxx</td>
                                    <td><%=ref%></td>
                                    <td><%=nom%></td>
                                    <td><%=tipo%></td>
                                    <td>0</td>
                                    <td>0000000</td>
                                    <td>
                                        <a href="actualizar.jsp" style="cursor: pointer;">
                                            <span class="glyphicon glyphicon-edit asd "></span>
                                        </a>
                                        <a href="mas.jsp" style="cursor:pointer;">
                                            <span class="glyphicon glyphicon-info-sign asd "></span>
                                        </a>
                                    </td>

                                    </tr>
                                <%
                                    }
                                %>
                                
                            </table>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <%
                }
            %>


            <!-- Fin del contenido principal-->
        </section>
        <!-- Inluye el footer de la pagina a traves de pie.jsp-->
        <jsp:include page="../pie.jsp" />
    </body>
</html>
