<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalTime" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath()%>/CSS/estilo.css" />
        <title>Saludo diario</title>
    </head>
    <body>
        <%
            String tratamiento = null;
            tratamiento = request.getParameter("sexo").equals("hombre") ? "señor" : "señora";

            int hora = LocalTime.now().getHour();
            String saludo = null;
            if (hora >= 8 && hora < 13) {
                saludo = "os días";
            } else if (hora >= 13 && hora < 19) {
                saludo = "as tardes";
            } else {
                saludo = "as noches";
            }
        %>
        <div id="contenido">
        <h2>Buen<%= saludo%> <%= tratamiento%> <%=request.getParameter("nombre")%></h2>


        <br /><br />
        <p><a href=" <%= request.getContextPath()%>">Men&uacute; inicial</a></p>
        </div>
    </body>
</html>