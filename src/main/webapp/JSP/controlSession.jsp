<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>



<%
    StringBuilder mensaje = new StringBuilder();
    StringBuilder url = new StringBuilder("menuSession.jsp");
    String nombre = request.getParameter("nombre");
//    HttpSession sesion = request.getSession();

    if (request.getParameter("enviar").equals("Inicio")) {
        url.replace(0, url.length(), request.getContextPath());
    } else {
        if (nombre.length() != 0) {
            String string = (String) request.getSession().getAttribute(nombre);
            switch (request.getParameter("enviar")) {
                case "Crear":
                    if (string == null) {
                        request.getSession().setAttribute(nombre, request.getParameter("valor"));

                        mensaje.append("Atributo de sesión creado con nombre: \"").append(nombre).append("\" y valor: <strong>").append(request.getParameter("valor"));
                        
                    } else {
                        mensaje.append("El atributo de sesión \"").append(nombre).append("\" ya existe y no se puede crear");
                    }

                    break;

                case "Visualizar":
                    if (string != null) {
                        mensaje.append("El atributo de sesión \"").append(nombre).append("\" tiene el valor <strong>").append(request.getSession().getAttribute(nombre));
                        mensaje.append("</strong>");
                    } else {
                        mensaje.append("El atributo de sesión \"").append(nombre).append("\" no existe");
                    }

                    break;

                case "Modificar":
                    if (string != null) {
                        request.getSession().setAttribute(nombre, request.getParameter("valor"));
                        mensaje.append("Se modificó el valor del atributo de sesión \"").append(nombre).append("\"");
                    } else {
                        mensaje.append("El atributo de sesión \"").append(nombre).append("\" no existe y no se puede modificar");
                    }

                    break;

                case "Eliminar":
                    if (string != null) {
                        request.getSession().removeAttribute(nombre);
                        mensaje.append("El atributo de sesión \"").append(nombre).append("\" se eliminó correctamente");
                    } else {
                        mensaje.append("El atributo de sesión \"").append(nombre).append("\" no existe y no se puede eliminar");
                    }
            }

        } else {

            mensaje.append("El campo <em>\"Nombre del atributo de sesión\"</em> es obigatorio");

        }
    }

    request.getSession().setAttribute("mensaje", mensaje.toString());
    response.sendRedirect(url.toString());
%>

