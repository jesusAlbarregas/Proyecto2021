<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calculadora</title>
        <link rel="stylesheet" type="text/css" href="../CSS/estilo.css" />
    </head>
    <body>
        <div id="contenido">

            <%
                int operando1 = 0;
                int operando2 = 0;
                String signo = null;
                int resultado = 0;
                boolean error = false;
                String mensaje = new String();
                SimpleDateFormat formateador = new SimpleDateFormat();
                if (request.getParameter("enviar") != null) {

                    try {
                        operando1 = Integer.parseInt(request.getParameter("operando1"));
                        operando2 = Integer.parseInt(request.getParameter("operando2"));

                        switch (request.getParameter("operacion")) {

                            case "suma":
                                resultado = operando1 + operando2;
                                signo = "+";
                                break;

                            case "resta":
                                resultado = operando1 - operando2;
                                signo = "-";
                                break;

                            case "producto":
                                resultado = operando1 * operando2;
                                signo = "*";
                                break;

                            case "division":
                                if (operando2 == 0) {
                                    mensaje = "Se está intentando dividir por cero";

                                    error = true;
                                } else {
                                    resultado = operando1 / operando2;
                                    signo = "/";
                                }
                        }
                        if (!error) {
                            formateador = new SimpleDateFormat("EEEE d 'de' MMMM 'de' yyyy");
                        }
                    } catch (NumberFormatException e) {
                        mensaje = "Algún dato de entrada no es un número válido";
                        error = true;
                    }
                }
                if (request.getParameter("enviar") != null && !error) {
            %>
            <p><%=formateador.format(new Date())%></p>

            <h2 class="ok">El resultado de <%=operando1%> <%=signo%> <%=operando2%> = <%=resultado%></h2>
                
            
            <%
                } else {
            %>
            <h2 class="error"><%= mensaje%></h2>
            <%
                }
            %>
            <form action="calculadora.jsp" method="post">
                <table>
                    <caption>Calculadora básica</caption>
                    <tr>
                        <td><label for="o1">Primer operando:</label></td>
                        <td><input type="text" name="operando1" id="o1" /></td>

                        <td><label for="o2">Segundo operando:</label></td>
                        <td><input type="text" name="operando2" id="o2" /></td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="operacion" value="suma" 
                                   checked="checked" />&nbsp;Sumar</td>
                        <td><input type="radio" name="operacion" value="resta" />&nbsp;Restar</td>
                        <td><input type="radio" name="operacion" value="producto" />&nbsp;Mutiplicar</td>
                        <td><input type="radio" name="operacion" value="division" />&nbsp;Dividir</td>
                    </tr>
                    <tr><td colspan="4">&nbsp;</td></tr>
                    <tr>
                        <td colspan="2"><input type="submit" name="enviar" value="Enviar" 
                                               id="idenviar" /></td>
                        <td><input type="reset" name="limpiar" value="Limpiar" /></td>
                        <td><input type="button" name="indice" value="Men&uacute; inicial" onClick="location.href = '<%= request.getContextPath()%>';" /></td>
                    </tr>
                </table>
            </form>

        </div>


    </body>
</html>