<%-- 
    Document   : menuCookie
    Created on : 04-oct-2018, 13:17:24
    Author     : jesus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../CSS/estilo.css" />
        <title>Sesiones</title>
    </head>
    <body>
        <form action="../JSP/controlSession.jsp" method="post">
            <div id="contenido">
                <h2>Control de Sesiones</h2>
                <table>
                    <tr>
                        <td colspan="2"><label for="nombre">Nombre del atributo de sesi&oacute;n</label></td>
                        <td colspan="3"><input type="text" name="nombre" id="nombre" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><label for="valor">Valor del atributo</label></td>
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
                        <td><input type="submit" name="enviar" value="Inicio" /></td>
                    </tr>
                    <tr>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        
                        <td colspan="4"><%= (request.getSession().getAttribute("mensaje") != null)?request.getSession().getAttribute("mensaje"):"" %></td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>