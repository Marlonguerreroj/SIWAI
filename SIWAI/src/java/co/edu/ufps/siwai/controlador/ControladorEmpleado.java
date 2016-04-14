    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.controlador;

import co.edu.ufps.siwai.modelo.fachada.Fachada;
import co.edu.ufps.siwai.modelo.mysql.dto.EmpleadoDTO;
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
@WebServlet(name = "ControladorEmpleado", urlPatterns = {"/ControladorEmpleado"})
public class ControladorEmpleado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String codigo = request.getParameter("codigo");
        String dni = request.getParameter("dni");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String celular = request.getParameter("celular");
        String contrasena = request.getParameter("contrasena");
        String email = request.getParameter("email");
        String direccion = request.getParameter("direccion");
        String fIngreso = request.getParameter("fIngreso");
        String cargo = request.getParameter("sel2");
        String sucursal = request.getParameter("sel1");
        Fachada fachada = new Fachada();
        String mensaje;
        boolean exito = false;
        try {
            exito = fachada.registrarEmpleado(codigo, dni, nombre, apellido, telefono, celular, contrasena, email, direccion, fIngreso, cargo, sucursal);
        } catch (Exception ex) {
            mensaje = "Error en la conexion a la base de datos";
        }
        if (exito) {
            mensaje = "Empleado registrado exitosamente";
        } else {
            mensaje = "Existe otro empleado con el DNI ingresado";
        }
        request.getSession().setAttribute("msjRE", mensaje);
        response.sendRedirect("/SIWAI/Seccion/Empleado/registrar.jsp");
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
    protected void consultarEmpleado(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String buscarPor = request.getParameter("sel");
        String informacion = request.getParameter("informacion");
        Fachada fachada = new Fachada();
        ArrayList<EmpleadoDTO> lista = null;
        try {
            lista = fachada.consultarEmpleado(buscarPor, informacion);
        } catch (Exception e) {
            request.getSession().setAttribute("msjCE", "Error en la conexion a la base de datos");
            response.sendRedirect("/SIWAI/Seccion/Empleado/consultar.jsp");
        }
        if (lista.isEmpty()) {
            request.getSession().setAttribute("msjCE", "No se encontro ningún Empleado");
        }
        request.getSession().setAttribute("empleados", lista);
        response.sendRedirect("/SIWAI/Seccion/Empleado/consultar.jsp");

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
    protected void iniciarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");
        Fachada fachada = new Fachada();
        request.getSession().setAttribute("fachada", fachada);
        String ingreso = "";
        PrintWriter out = response.getWriter();
        try {
            ingreso = fachada.iniciarSesion(usuario, contraseña);
            out.print(ingreso);
            if (!ingreso.equals("nulo") || (ingreso.isEmpty())) {
                String[] ingreso2 = ingreso.split("-");
                request.getSession().setAttribute("usuario", ingreso2[0]);
                request.getSession().setAttribute("cargo", ingreso2[1]);
            }

        } catch (Exception e) {
            out.print("Error en la base de datos");
        }
    }

    protected void cerrarSesion(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        request.getSession().invalidate();
        response.sendRedirect("/SIWAI/index.jsp");
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
        if (request.getParameter("cerrarSesion") != null) {
            cerrarSesion(request, response);
        }
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
        if (request.getParameter("consultarEmpleado") != null) {
            consultarEmpleado(request, response);
        }
        if (request.getParameter("registrarEmpleado") != null) {
            registrarEmpleado(request, response);
        }
        if (request.getParameter("iniciarSesion") != null) {
            iniciarSesion(request, response);
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
