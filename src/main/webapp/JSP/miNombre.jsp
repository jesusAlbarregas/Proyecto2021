<%-- 
    Document   : miNombre
    Created on : 13-oct-2020, 17:01:38
    Author     : jesus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.net.URLDecoder" %>
<%
    // Objeto cookie
    Cookie cookie = null;
    // Variable que nos indica si existe
    Boolean existe = false;
    
    // Accedemos a todas las cookies de nuestro servidor
    Cookie[] cookies = request.getCookies();
    // En el caso de que existan cookies buscamos la que nos interesa
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("nombreConCookie")) {
                // Cuando la encontramos la guardamos en el objeto cookie y rompemos el for
                cookie = cookies[i];
                break;
            }
        }
    }
    if (cookie == null) {
        // En el caso de no haberla encontrado, la creamos
        // Hay que tener en cuenta que en una cookie sólo se puede almacenar texto y hay que reemplazar los espacios por %20 igual que en la URL
        cookie = new Cookie("nombreConCookie", URLEncoder.encode("Jesús García Garijo", "UTF-8"));
        
    } else {
        // En el caso de encontrarla ponemos la variable auxiliar a true
        existe = Boolean.TRUE;
    }
    
    cookie.setMaxAge(3600); // Un día en segundos  
    // Agregamos la cookie a la respuesta para que se almacene en el cliente
    response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nombre</title>
    </head>
    <body>
        <%
            if(existe) {
        %>
    <%-- Sustituimos los %20 por espacios --%>
    <h1>Hola <%= URLDecoder.decode(cookie.getValue(), "UTF-8") %></h1>
    <%
            } else {
    %>
    <h1>Todav&iacute;a no tenemos datos tuyos</h1>
    <%
        }
    %>
        <form action="miNombre.jsp" method="post">
                <span class="botones"><input type="submit" value="Recargar" name="recarga" /></span>
                
                <span class="botones"><input type="button" name="indice" value="Men&uacute; inicial" onClick="location.href = '<%= request.getContextPath() %>';" /></span>
            </form>
    </body>
</html>
