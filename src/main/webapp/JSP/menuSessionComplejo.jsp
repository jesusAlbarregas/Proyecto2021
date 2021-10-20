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
        <title>Sesiones</title>
    </head>
    <body>
        <form action="controlSessionComplejo.jsp" method="post">
            <div id="contenido">
                <h2>Control de Sesiones</h2>
                <table id="general">
                    <tr>
                        <td colspan="2"><label for="nombre">Nombre del atributo de sesi&oacute;n</label></td>
                        <td colspan="3"><input type="text" name="nombreAtributo" id="nombre" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><label for="nb">Nombre</label></td>
                        <td colspan="3"><input type="text" name="nombre" id="nb" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><label for="fn">Fecha de nacimiento</label></td>
                        <td colspan="3"><input type="date" name="fnac" id="fn" /></td>
                    </tr>
                    <tr>
                        <td colspan="2"><label for="sl">Salario</label></td>
                        <td colspan="3"><input type="text" name="salario" id="sl" /></td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td style="text-align: center;"><input type="submit" name="enviar" value="Crear" /></td>
                        <td style="text-align: center;"><input type="submit" name="enviar" value="Visualizar" /></td>
                        <td style="text-align: center;"><input type="submit" name="enviar" value="Modificar" /></td>
                        <td style="text-align: center;"><input type="submit" name="enviar" value="Eliminar" /></td>
                        <td style="text-align: center;"><input type="submit" name="enviar" value="Inicio" /></td>
                    </tr>
                    <tr>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        
                        <td colspan="5" style="text-align: left;">
                            <%= (request.getSession().getAttribute("mensaje") != null)?request.getSession().getAttribute("mensaje"):"" %>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </body>
</html>