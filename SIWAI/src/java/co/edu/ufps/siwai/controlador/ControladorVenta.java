/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package co.edu.ufps.siwai.controlador;

import co.edu.ufps.siwai.modelo.Fachada;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MarlonGuerrero
 */
public class ControladorVenta extends HttpServlet {

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void crearVenta(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      request.setCharacterEncoding("UTF-8");
      String cliente = request.getParameter("cliente");
      String vendedor = request.getParameter("vendedor");
      String sucursal = request.getSession().getAttribute("suc").toString();
      String cajero = request.getSession().getAttribute("cod").toString();
      PrintWriter out = response.getWriter();
          Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
          boolean exito;
          try {
              exito = fachada.crearVenta(cliente, vendedor,sucursal,cajero);
              out.print(exito);
          } catch (Exception ex) {
              ex.printStackTrace();
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
  protected void aniadirArticulo(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      try {
          String referencia = request.getParameter("referencia");
          int cantidad = Integer.parseInt(request.getParameter("cantidad"));
          int valor = Integer.parseInt(request.getParameter("valor"));
          int cantidadMax = Integer.parseInt(request.getSession().getAttribute("cant").toString());
          if(cantidad > 0 ) {
              if(cantidad<=cantidadMax){
                Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
                response.getWriter().print(fachada.aniadirArticuloVenta(referencia, cantidad,valor));
              }else{
                response.getWriter().print("cantidad");
              }
          } else {
              response.getWriter().print("Numero");
              return;
          }
      } catch (NumberFormatException ex) {
          response.getWriter().print("Numero");
      }   catch (Exception ex) {
          ex.printStackTrace();
          response.getWriter().print("Error");
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
  protected void registrarVenta(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
      response.setContentType("text/html;charset=UTF-8");
      /* TODO output your page here. You may use following sample code. */
      PrintWriter out = response.getWriter();
      try {
          Fachada fachada = (Fachada) request.getSession().getAttribute("fachada");
          out.print(fachada.registrarVenta());
      } catch (Exception ex) {
          ex.printStackTrace();
          out.print("Error");
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
              if (request.getParameter("crearVenta") != null) {
                        crearVenta(request, response);
              }else if(request.getParameter("aniadirArticulo") != null) {
                        aniadirArticulo(request, response);
              } else if (request.getParameter("registrarVenta") != null) {
                  registrarVenta(request, response);
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
