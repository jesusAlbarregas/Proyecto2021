<%-- 
    Document   : inicio
    Created on : 10-abr-2018, 16:26:54
    Author     : jesus
--%>

<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/CSS/estilo.css" />
        <title>C&aacute;lculo de la edad</title>
    </head>
    
    <body>
        <%

            LocalDate hoy = LocalDate.now();

            String[] fecha = request.getParameter("fnacimiento").split("-");
            

            LocalDate nac = LocalDate.of(Integer.parseInt(fecha[0]), Integer.parseInt(fecha[1]), Integer.parseInt(fecha[2]));
            StringBuilder salida = new StringBuilder("Hola ").append(request.getParameter("nombre"));

            Period edad = Period.between(nac, hoy);
            int year = 0;
            int mes = 0;
            if(!edad.isNegative()) {
                salida.append(" tienes ");
                int contadorComas = 0;

                if(edad.getYears() > 0) {
                    salida.append(edad.getYears()).append(" año");
                    if(edad.getYears() > 1) {
                        salida.append("s, ");
                    } else {
                        salida.append(", ");
                    }
                    contadorComas++;
                }
                if(edad.getMonths() > 0) {
                    salida.append(edad.getMonths()).append(" mes");
                    if(edad.getMonths() > 1) {
                        salida.append("es, ");
                    } else {
                        salida.append(", ");
                    }
                    contadorComas++;
                }
                if(edad.getDays() > 0) {
                    salida.append(edad.getDays()).append(" día");
                    if(edad.getDays() > 1) {
                        salida.append("s, ");
                    } else {
                        salida.append(", ");
                    }
                    contadorComas++;
                }
                salida.replace(salida.length()-2,salida.length()," de edad");
                
                if(contadorComas != 1) {
                    salida.replace(salida.lastIndexOf(","), salida.lastIndexOf(",") + 1, " y ");
                } 
            } else {
                salida.append(" no has nacido todavía");
            }
        %>
        <div id="contenido">
        <h2><%=salida%></h2>
        <p><a href="<%=request.getContextPath()%>">Men&uacute;</a></p>
        </div>
    </body>
</html>
