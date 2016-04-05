/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.controlador.servlet;

import co.edu.ufps.siwai.modelo.fachada.Fachada;
import co.edu.ufps.siwai.modelo.mysql.dto.ProveedorDTO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alejandro Ramirez
 */
@WebServlet(name = "ControladorProveedor", urlPatterns = {"/ControladorProveedor"})
public class ControladorProveedor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String codigo = request.getParameter("codigo");
        String nit = request.getParameter("nit");
        String nombre = request.getParameter("nombre");
        String web = request.getParameter("web");
        int telefono = Integer.parseInt("" + request.getParameter("telefono"));
        String tipoCuenta = request.getParameter("tipoCuentaBancaria");
        String email = request.getParameter("email");
        int numeroCuenta = Integer.parseInt("" + request.getParameter("nCuentaBancaria"));
        String cuenta = request.getParameter("cuentaBancaria");
        String nombreContacto = request.getParameter("nombreContacto");
        Fachada fachada = new Fachada();
        String mensaje = "";
        try {
            if (fachada.registrarProveedor(codigo, nit, nombre, cuenta, tipoCuenta, web, nombreContacto, email, numeroCuenta, telefono)) {
                mensaje = "Proveedor registrado exitosamente";
            } else {
                mensaje = "Existe otro proveedor con el codigo: " + codigo;
            }
        } catch (Exception ex) {
            mensaje = "Error en la conexion a la base de datos";
        } finally {
            request.getSession().setAttribute("msjRP", mensaje);
            response.sendRedirect("/SIWAI/Seccion/Proveedor/registrar.jsp");
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
    protected void consultarProveedor(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String columna = request.getParameter("sel");
        String informacion = request.getParameter("informacion");
        Fachada fachada = new Fachada();
        ArrayList<ProveedorDTO> dtos;
        try {
            dtos = fachada.consultarProveedores(columna, informacion);
            if(dtos == null)
                request.getSession().setAttribute("msjCP", "Error en la conexion a la base de datos");
            else if (dtos.isEmpty())
                request.getSession().setAttribute("msjCP", "No se encontro ningún proveedor");
            else
                request.getSession().setAttribute("proveedores", dtos);
        } catch (Exception ex) {
            request.getSession().setAttribute("msjCP", "Error en la conexion a la base de datos");
        } finally {
            response.sendRedirect("/SIWAI/Seccion/Proveedor/consultar.jsp");
        }
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
        request.setCharacterEncoding("UTF-8");
        if (request.getParameter("registrarProveedor") != null) {
            registrarProveedor(request, response);
        } else if (request.getParameter("consultarProveedor") != null) {
            consultarProveedor(request, response);
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
