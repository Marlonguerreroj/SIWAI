/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.controlador;

import co.edu.ufps.siwai.modelo.fachada.Fachada;
import co.edu.ufps.siwai.modelo.mysql.dto.SucursalDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MarlonGuerrero
 */
@WebServlet(name = "ControladorSucursal", urlPatterns = {"/ControladorSucursal"})
public class ControladorSucursal extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarSucursal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String paginaWeb = request.getParameter("paginaWeb");
        String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        String pais = request.getParameter("pais");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        boolean exito;
        PrintWriter out = response.getWriter();
        try {
            exito = fachada.registrarSucursal(codigo, nombre, telefono, email, paginaWeb, direccion, ciudad, pais);
            System.out.println(exito);
            out.print(exito);

        } catch (Exception ex) {
            out.print("Error en la conexion a la base de datos");
        }

    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void actualizarSucursal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String email = request.getParameter("email");
        String paginaWeb = request.getParameter("paginaWeb");
        String direccion = request.getParameter("direccion");
        String ciudad = request.getParameter("ciudad");
        String pais = request.getParameter("pais");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        boolean exito;
        PrintWriter out = response.getWriter();
        try {
            exito = fachada.actualizarSucursal(codigo, nombre, telefono, email,
                    paginaWeb, direccion, ciudad, pais);
            if (exito) {
                request.getSession().setAttribute("msjAS", "La sucursal se actualizó satisfactoriamente");
            }
            out.print(exito);
        } catch (Exception e) {
            out.print("Error en la conexion a la base de datos");
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void consultarSucursal(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String buscarPor = request.getParameter("sel");
        String informacion = request.getParameter("informacion");
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        ArrayList<SucursalDTO> lista = new ArrayList<>();
        try {
            lista = fachada.consultarSucursal(buscarPor, informacion);
        } catch (Exception e) {
            request.getSession().setAttribute("msjCS", "Error en la conexion a la base de datos");
            response.sendRedirect("/SIWAI/Seccion/Sucursal/consultar.jsp");
        }
        if (lista.isEmpty()) {
            request.getSession().setAttribute("msjCS", "No se encontro ningúna sucursal");
        }
        request.getSession().setAttribute("sucursales", lista);
        response.sendRedirect("/SIWAI/Seccion/Sucursal/consultar.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("consultarSucursal") != null) {
            consultarSucursal(request, response);
        }
        if (request.getParameter("registrarSucursal") != null) {
            registrarSucursal(request, response);
        }
        if (request.getParameter("actualizarSucursal") != null) {
            actualizarSucursal(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
