/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jesus
 */
@WebServlet(name = "MetodoEnvio", urlPatterns = {"/MetodoEnvio"})
public class MetodoEnvio extends HttpServlet {

    

    
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MetodoEnvio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Estoy en doGet</h1>");
            Enumeration<String> nombres = request.getParameterNames();
            while(nombres.hasMoreElements()) {
                String nombre = nombres.nextElement();
                out.println("<p>El valor del parámetro " + nombre + " tiene un valor de " 
                        + request.getParameter(nombre) + "</p>");
                if(nombre.equalsIgnoreCase("numero")) {
                    out.println("El producto de 4 por " + request.getParameter(nombre) + 
                            " es igual a " + Double.valueOf(request.getParameter(nombre)) * 4);
                }
                if(nombre.equalsIgnoreCase("error") && request.getParameter("error").equalsIgnoreCase("1")) {
                    out.println("Todos los campos son obligatorios");
                }
            }
            out.println("<p><a href=\".\">Menú</a></p>");
            out.println("</body>");
            out.println("</html>");
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MetodoEnvio</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Estoy en doPost</h1>");
            Enumeration<String> nombres = request.getParameterNames();
            while(nombres.hasMoreElements()) {
                String nombre = nombres.nextElement();
                out.println("<p>El valor del parámetro " + nombre + " tiene un valor de " 
                        + request.getParameter(nombre) + "</p>");
                
            }
            out.println("<p><a href=\".\">Menú</a></p>");
            out.println("</body>");
            out.println("</html>");
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
