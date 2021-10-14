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
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jesus
 */
@WebServlet(name = "ContadorVisitasCookies", urlPatterns = {"/ContadorVisitasCookies"})
public class ContadorVisitasCookies extends HttpServlet {

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
        Cookie cookie = null;

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("CONTADOR")) {
                    cookie = cookies[i];
                    break;
                }
            }
        }
        if (cookie == null) {
            cookie = new Cookie("CONTADOR", "0");
        } else if (request.getParameter("eliminar") != null) {
            cookie.setValue("0");
        }
        int contador = Integer.parseInt(cookie.getValue());
        cookie.setValue(Integer.toString(contador + 1));
        cookie.setMaxAge(60*60); // Una hora en segundos

        response.addCookie(cookie);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        out.println("<!DOCTYPE html>");
        out.println("<html lang=\"es\">");
        out.println("<head>");
        out.println("<title>Contador de visitas</title>");
        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"/CSS/estilo.css\" media=\"screen\" />");
        out.println("</head>");
        out.println("<body>");
        out.println("<div id=\"contenido\">");
        out.println("<h2>Número de veces que se ha visitado la página " + cookie.getValue() + "</h2>");
        if(cookie.getValue().equals("1")){
            out.println("<h3>Informaci&oacute;n de la cookie</h3>");
            out.println("<ul>");
            out.println("<li>Dominio - " + cookie.getDomain() + "</li>");
            out.println("<li>Nombre - " + cookie.getName() + "</li>");
            out.println("<li>Path - " + cookie.getPath() + "</li>");
            out.println("<li>Segura - " + cookie.getSecure() + "</li>");
            out.println("<li>Versi&oacute;n - " + cookie.getVersion() + "</li>");
            out.println("</ul>");
        }
        out.println("<br />");
        out.println("<form action=\"ContadorVisitasCookies\" method=\"post\">");
        out.println("<span class=\"botones\"><input type=\"submit\" value=\"Recargar\" name=\"recarga\" /></span>");
        out.println("<span class=\"botones\"><input type=\"submit\" value=\"Eliminar\" name=\"eliminar\" /></span>");
        out.println("<span class=\"botones\"><input type=\"button\" name=\"indice\" value=\"Men&uacute; inicial\" onClick=\"location.href = '.'\" /></span>");
        out.println("</form>");

        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
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
