/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.controlador;

import co.edu.ufps.siwai.modelo.fachada.Fachada;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
public class ControladorArticulo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void registrarArticulo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        System.out.println("llego aqui0");
        /* TODO output your page here. You may use following sample code. */
        String referencia = request.getParameter("referencia");
        String nombre = request.getParameter("nombre");
        String tipo = request.getParameter("tipo");
        String validacion = validarCampos(referencia, nombre, tipo);
        PrintWriter out = response.getWriter();
        if(!validacion.contains("Exito")) {
            out.print(validacion);
            return;
        }
        Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
        String mensaje = "";
        try {
            boolean exito=fachada.registrarAriculo(referencia, nombre, tipo);
            System.out.println("Llego despues de registrar articulo: "+exito);
            if (exito)
               mensaje = "Exito";
            else
                mensaje = "Fallo";
        } catch (Exception ex) {
            out.print("Error");
        }
        out.print(mensaje);
    }
    private String validarCampos(String referencia, String nombre, String tipoArticulo){
        String msj="Exito";
        System.out.println("");
        if(referencia.trim().isEmpty()|| nombre.trim().isEmpty()||tipoArticulo.trim().isEmpty())
            msj = "referencia, nombre y tipo son obligatorios.";
        return msj;
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
        if(request.getParameter("registrarArticulo")!=null){
            this.registrarArticulo(request, response);
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
