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
@WebServlet(name = "InfoCliente", urlPatterns = {"/InfoCliente"})
public class InfoCliente extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
		response.setContentType("text/html;charset=UTF-8");
		// Declaración del objeto PrintWriter para la salida
            
            // Obtención de información de la peticición del cliente
            
            String metodo = request.getMethod();
            String uriPeticion = request.getRequestURI();
            StringBuffer url = request.getRequestURL();
            String protocolo = request.getProtocol();
            String proto = request.getScheme();
            String ruta = request.getPathInfo();
            String direccionRemota = request.getRemoteAddr();
            String autenticacion = request.getAuthType();
            String contexto = request.getContextPath();
            
            String sesionID = request.getRequestedSessionId(); 
            Enumeration<String> parametros = request.getParameterNames();
            // Escritura del documento html
            out.println("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\"");
            out.println(" \"http://www.w3c.org/TR/xhtml11/DTD/xhtml11.dtd\">");
            out.println("<html xmlns='http://www.w3.org/1999/xhtml' lang='es' xml:lang='es'>");
            out.println("<head>");
            out.println("<title>Informaci&oacute;n</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + request.getContextPath() + "/CSS/estilo.css\" media=\"screen\" />");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='contenido' style='width: 80%; left: 10%;'>");
            out.println("<h2>Informaci&oacute;n de petici&oacute;n</h2>");
            out.println("<div style=\"border-top: 2px ridge black;\">");
            
            out.println("<p>Metodo: " + metodo + "</p>");
            out.println("<p>URI de la petici&oacute;n: " + uriPeticion + "</p>");
            out.println("<p>URL de la petici&oacute;n: " + url + "</p>");
            out.println("<p>Protocolo: " + protocolo + "</p>");
            out.println("<p>Protocolo de prueba: " + proto + "</p>");
            out.println("<p>Ruta: " + ruta + "</p>");
            out.println("<p>Direcci&oacute;n remota: " + direccionRemota + "</p>");
            out.println("<p>Esquema de autenticaci&oacute;n: " + autenticacion + "</p>");
            out.println("<p>Contexto: " + contexto + "</p>");
            
            out.println("<p>ID de sesi&oacute;n: especificado por el cliente " + sesionID + "</p>");
            StringBuilder sb = new StringBuilder("<p>Parámetros: </p>"); 
            while (parametros.hasMoreElements()) {
                String nombre = parametros.nextElement();
                String valor = (String) request.getParameter(nombre);
                sb.append(nombre).append(": ").append(valor).append(", ");
            }
            sb = sb.replace(sb.length() - 2, sb.length(), "");
            out.println(sb.toString());
            out.println("</p>");
            out.println("</div>");
            out.println("<br /><br />");
            out.println("<p><a href=\"" + request.getContextPath() + "\">Men&uacute; inicial</a></p>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
            // Cerramos el flujo de salida
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
