<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder" %>
<%@page import="java.net.URLDecoder" %>


<%
    /*  Creamos la variable mensaje cargada inicialmente con la URL del menú y el nombre del parámetro que se le pasará 
        y el valor lo iremos componiendo a lo largo del proceso  */
    StringBuilder mensaje = new StringBuilder("menuCookie.jsp?mensaje=");
    //System.out.println("El valor del botón es " + request.getParameter("enviar") + " y el nombre es " + request.getParameter("nombre"));
    if (!request.getParameter("enviar").equals("Indice")) {
        // En el caso de que no hayamos pulsado el botón de Menú inicial
        if (request.getParameter("nombre").length() != 0) {
            // Cuando hemos introducido el nombre de la cookie a buscar
            String nombreCookie = request.getParameter("nombre");
            // Creamos un objeto auxiliar cookie
            Cookie cookie = null;
            // Accedemos a todas las cookies creadas por nuestro servidor
            Cookie[] cookies = request.getCookies();
            
            if (cookies != null) {
                // Si existen cookies buscamos la que nos han pedido, su nombre está almacenado en la variable nombreCookie
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals(nombreCookie)) {
                        // Cuando la encontramos la guardamos en el objeto cookie y rompemos el for
                        cookie = cookies[i];
                        break;
                    }
                }
            }
            // Ahora investigamos el botón pulsado desde el menú
            if (request.getParameter("enviar").equals("Crear")) {
                // Queremos crear una nueva cookie
                if (cookie == null) {
                    // La operación de crear la cookie se podrá hacer en el caso de que no exista
                    // Creamos la cookie con el nombre introducido por el usuario y el valor que podrá ser cualquier texto
                    cookie = new Cookie(nombreCookie, URLEncoder.encode(request.getParameter("valor"), "UTF-8"));
                    // Añadimos la caducidad de una hora en segundos
                    cookie.setMaxAge(60 * 60);
                    // Añadimos la cookie a la respuesta
                    response.addCookie(cookie);
                    // Componemos el mensaje que aparecerá en el menú informando de lo sucedido
                    mensaje.append("Cookie creada <ul><li>nombre: <strong>").append(nombreCookie).append("</strong></li><li>contenido: <strong>").
                            append(request.getParameter("valor")).append("</strong></li></ul>");

                } else {
                    // En el caso de que la cookie exista se informará al usuario a través del mensaje
                    mensaje.append("La cookie <strong>").append(nombreCookie).append("</strong> ya existe y no se puede crear");
                }
            } else if (request.getParameter("enviar").equals("Visualizar")) {
                // Queremos visualizar el contenido de una cookie
                if (cookie != null) {
                    // En el caso de existir se muestra su contenido
                    mensaje.append("La cookie <strong>").append(nombreCookie).append("</strong> tiene el contenido <strong>").
                            append(URLDecoder.decode(cookie.getValue(), "UTF-8")).append("</strong>");
                } else {
                    // En el caso de no existir se compone el mensaje que aparecerá en el menú
                    mensaje.append("La cookie <strong>").append(nombreCookie).append("</strong> no existe y no se puede visualizar");
                }
            } else if (request.getParameter("enviar").equals("Modificar")) {
                // Queremos modificar el valor de una cookie
                if (cookie != null) {
                    // En el caso de existir modificamos su valor por el introducido por el usuario
                    cookie.setValue(URLEncoder.encode(request.getParameter("valor"), "UTF-8"));
                    // Añadimos la cookie a la respuesta
                    response.addCookie(cookie);
                    // Componemos el mensaje que se le mostrará al usuario
                    mensaje.append("El valor de la cookie <strong>").append(nombreCookie).append("</strong> se ha modificado");
                } else {
                    // En el caso de no existir se compone el mensaje de error que se mostrará al usuario
                    mensaje.append("La cookie <strong>").append(nombreCookie).append("</strong> no existe y no se puede modificar");
                }
            } else if (request.getParameter("enviar").equals("Eliminar")) {
                // Queremos eliminar una cookie
                if (cookie != null) {
                    // En el caso de existir se podrá proceder a su elimnación
                    // Para ello ponemos como fecha de caducidad 0
                    cookie.setMaxAge(0);
                    // Añadimos la cookie a la respuesta
                    response.addCookie(cookie);
                    // Componemos el mensaje que le aparecerá al usuario
                    mensaje.append("La cookie <strong>").append(nombreCookie).append("</strong> se ha eliminado correctamente");
                } else {
                    // En el caso de no existir se compone el mensaje de error que se mostrará al usuario
                    mensaje.append("La cookie <strong>").append(nombreCookie).append("</strong> no existe y no se puede eliminar");
                }
            }
        } else {
            // En el caso de que el usuario no haya especificado el nombre de la cookie se vuelve al menú avisándolo de tal hecho
            mensaje.append("El nombre de la cookie es necesario");
        }
    } else {
        // En el caso de que queramos volver al menú inicial se sustituye en la variable mensaje el valor que tuviera por el contexto de la aplicación
        mensaje.replace(0, mensaje.length(), request.getContextPath());
        
    }
    // Se realiza una petición del recurso que aparece en la variable mensaje
    response.sendRedirect(mensaje.toString());
%>

