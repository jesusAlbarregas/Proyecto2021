<%-- 
    Document   : menuCookie
    Created on : 04-oct-2018, 13:17:24
    Author     : jesus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/estilo.css" />
        <title>Cookies</title>
    </head>
    <body>
        <form action="controlCookie.jsp" method="post">
            <div id="contenido">
                <h2>Control de Cookies</h2>
                <table>
                    <tr>
                        <td colspan="2"><label for="nombre">Nombre de la cookie</label></td>
                        <td colspan="3"><input type="text" name="nombre" id="nombre"/></td>
                    </tr>
                    <tr>
                        <td colspan="2"><label for="valor">Valor de la cookie</label></td>
                        <td colspan="3"><input type="text" name="valor" id="valor" /></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="enviar" value="Crear" /></td>
                        <td><input type="submit" name="enviar" value="Visualizar" /></td>
                        <td><input type="submit" name="enviar" value="Modificar" /></td>
                        <td><input type="submit" name="enviar" value="Eliminar" /></td>
                        <td><input type="submit" name="enviar" value="Indice" /></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <%
                            String mensaje = (request.getParameter("mensaje") != null) ? request.getParameter("mensaje") : "";
                        %>
                        
                        <td colspan="4"><%= mensaje %></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>