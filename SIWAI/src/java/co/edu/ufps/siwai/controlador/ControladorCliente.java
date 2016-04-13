/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.controlador;

import co.edu.ufps.siwai.modelo.fachada.Fachada;
import co.edu.ufps.siwai.modelo.mysql.dto.ClienteDTO;
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
@WebServlet(name = "ControladorCliente", urlPatterns = {"/ControladorCliente"})
public class ControladorCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /* TODO output your page here. You may use following sample code. */
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        int telefono = Integer.parseInt("" + request.getParameter("telefono"));
        String direccion = request.getParameter("direccion");
        String email = request.getParameter("email");
        Fachada fachada = new Fachada();
        String mensaje = "";
        try {
            if (fachada.registrarCliente(dni, nombre, apellido, direccion, email, telefono)) {
                mensaje = "Cliente registrado exitosamente";
            } else {
                mensaje = "Existe otro cliente con el DNI: " + dni;
            }
        } catch (Exception ex) {
            mensaje = "Error en la conexion a la base de datos";
        } finally {
            request.getSession().setAttribute("msjRC", mensaje);
            response.sendRedirect("/SIWAI/Seccion/Cliente/registrar.jsp");
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
    protected void consultarCliente(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        /* TODO output your page here. You may use following sample code. */
        String columna = request.getParameter("sel");
        String informacion = request.getParameter("informacion");
        Fachada fachada = new Fachada();
        ArrayList<ClienteDTO> dtos;
        try {
            dtos = fachada.consultarClientes(columna, informacion);
            if(dtos == null)
                request.getSession().setAttribute("msjCC", "Error en la conexion a la base de datos");
            else if (dtos.isEmpty())
                request.getSession().setAttribute("msjCC", "No se encontro ningún cliente");
            else
                request.getSession().setAttribute("clientes", dtos);
        } catch (Exception ex) {
            request.getSession().setAttribute("msjCC", "Error en la conexion a la base de datos");
        } finally {
            response.sendRedirect("/SIWAI/Seccion/Cliente/consultar.jsp");
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
        if (request.getParameter("registrarCliente") != null) {
            registrarCliente(request, response);
        } else if (request.getParameter("consultarCliente") != null) {
            consultarCliente(request, response);
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