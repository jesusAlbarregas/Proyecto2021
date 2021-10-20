/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 *
 * @author jesus
 */
@WebFilter(filterName = "Auditoria", urlPatterns = {"/*"})
public class Auditoria implements Filter {

    

    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        
    }

    /**
     * @see Filter#destroy()
     */
    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @param request
     * @param response
     * @param chain
     * @throws java.io.IOException
     * @throws javax.servlet.ServletException
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        long antes = System.currentTimeMillis();
                
        chain.doFilter(request, response);
        
        long despues = System.currentTimeMillis();
        
        long espera = despues - antes;
        
        System.out.println("Tiempo de espera " + espera + " milisegundos");
    }

}
