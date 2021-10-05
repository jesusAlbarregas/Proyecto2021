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
 * @author Jesus
 */
@WebServlet(name = "CabecerasPeticion", urlPatterns = {"/CabecerasPeticion"})
public class CabecerasPeticion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
        String[] spanish = {"Nombre del dominio", "Conexión", "Solicitudes de actualización inseguras", "Información del cliente", "Tipos de contenido",
            "Sitios de búsqueda", "Modos de recuperación", "Buscar usuario", "Buscar destino", "Árbitro", "Codificaciones aceptadas", "Idiomas aceptados"
        };
        try (PrintWriter out = response.getWriter()) {

            response.setContentType("text/html;charset=UTF-8");
            Enumeration<String> cabeceras = request.getHeaderNames();

            out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"");
            out.println(" \"http://www.w3c.org/TR/xhtml11/DTD/xhtml11.dtd\">");
            out.println("<html xmlns='http://www.w3.org/1999/xhtml' lang='es' xml:lang='es'>");
            out.println("<head>");
            out.println("<title>Cabeceras</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + request.getContextPath() + "/CSS/estilo.css\" media=\"screen\" />");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='contenido' style='width: 80%; left: 10%;'>");
            out.println("<h2>Cabeceras de petici&oacute;n</h2>");
            out.println("<div style=\"border-top: 2px ridge black; text-align: left;\">");
            out.println("<ul>");
            int i = -1;
            boolean flag = false;
            while (cabeceras.hasMoreElements() && !flag) {
                String nombre = (String) cabeceras.nextElement();
                String valor = request.getHeader(nombre);
                try {
                    out.println("<li><strong>" + spanish[++i] + ":</strong> " + valor + "</li>");
                } catch (ArrayIndexOutOfBoundsException ex) {
                    flag = true;
                }

            }

            out.println("</ul>");
            out.println("</div>");
            out.println("<br /><br />");
            out.println("<p><a href='" + request.getContextPath() + "'>Men&uacute; inicial</a></p>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
            out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
