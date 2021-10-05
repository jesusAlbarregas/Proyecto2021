/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "CicloVida", urlPatterns = {"/CicloVida"})
public class CicloVida extends HttpServlet {

    public CicloVida() {
        super();
        System.out.println("Se crea el Servlet");

    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        System.out.println("Se inicializa el Servlet " + config.getServletName());
        
        
    
    }

    @Override
    public void destroy() {
        System.out.println("Se destruye el Servlet");
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Se accede al Servlet " + request.getServletPath() + " con el método " + request.getMethod());
    }

}
