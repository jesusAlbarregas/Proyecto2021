/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author jesus
 */
@WebServlet(name = "ContadorVisitasSesiones", urlPatterns = {"/ContadorVisitasSesiones"})
public class ContadorVisitasSesiones extends HttpServlet {

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
        HttpSession sesion = request.getSession(true);
        int contador = 0;
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html>");
       
        out.println("<html lang='es'>");
        out.println("<head>");
        out.println("<title>Contador con sesiones</title>");
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"CSS/estilo.css\" media=\"screen\" />");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"contenido\">");
        boolean isInvalidate = false;
        if (request.getParameter("eliminar") != null && request.getParameter("eliminar").equals("true")) {
            sesion.invalidate();
            isInvalidate = true;
        } else {
            if (sesion.getAttribute("contaSesion") != null) {
                contador = ((Integer) sesion.getAttribute("contaSesion"));

            }
            sesion.setAttribute("contaSesion", new Integer(contador + 1));
        }
        out.println("<form action=\"ContadorVisitasSesiones\" method=\"post\">");
        if (!isInvalidate) {
            out.println("<p>Número de visitas en esta página " + (contador + 1) + "</p>");
            out.println("<p>Invalidar sesión: <input type=\"checkbox\" "
                    + "name=\"eliminar\" value=\"true\" /></p>");
        } else {
            out.println("<p>Contador inicializado</p>");
        }

        out.println("<span class=\"botones\"><input type=\"submit\" value=\"Recargar\" name=\"recarga\" /></span>");
        out.println("<span class=\"botones\"><input type=\"button\" name=\"indice\" value=\"Men&uacute; inicial\" onClick=\"location.href = '.';\" /></span>");
        out.println("</form>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
        out.close();
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
        doGet(request, response);
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
