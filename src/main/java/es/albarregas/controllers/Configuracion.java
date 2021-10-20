package es.albarregas.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ConfigServlet
 */
@WebServlet(name = "Configuracion", urlPatterns = {"/Configuracion"},
        initParams = {
            @WebInitParam(name = "param1", value = "Hola"),
            @WebInitParam(name = "param2", value = "Mundo"),
            @WebInitParam(name = "param3", value = "Servlet")})

public class Configuracion extends HttpServlet {

    Map<String, String> mapa;

    @Override
    public void init(ServletConfig config) {
        Enumeration<String> parametros = config.getInitParameterNames();
        mapa = new LinkedHashMap<>();
        while (parametros.hasMoreElements()) {
            String nombre = parametros.nextElement();
            System.out.println("Nombre " + nombre + " Valor: "
                    + config.getInitParameter(nombre));
            mapa.put(nombre, config.getInitParameter(nombre));
        }
        System.out.println("Contexto de Servlet: " + config.getServletContext());
        System.out.println("Nombre de la instancia del Servlet: " + config.getServletName());

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Configuraci&oacute;n</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"" + request.getContextPath() + "/CSS/estilo.css\" media=\"screen\" />");
            out.println("<meta http-equiv=\"content-type\" content=\"text/html;charset=UTF-8\" />");
            out.println("</head>");
            out.println("<body>");
            out.println("<div id='contenido'>");
            out.println("<h1>Visualización de par&aacute;metros iniciales</h1>");
            for (Map.Entry<String, String> entrada : mapa.entrySet()) {

                out.println("<p>" + entrada.getKey() + ": ");
                out.println(entrada.getValue() + "</p>");

            }
            out.println("<p><a href='" + request.getContextPath() + "'>Men&uacute; inicial</a></p>");
            out.println("</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

}
