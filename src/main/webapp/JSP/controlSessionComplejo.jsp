<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="es.albarregas.beans.Empleado" %>
<%@page import="java.text.SimpleDateFormat" %>

<%
    StringBuilder mensaje = new StringBuilder();
    StringBuilder url = new StringBuilder("menuSessionComplejo.jsp");
    String nombreAtributo = request.getParameter("nombreAtributo");
    // Para pasar la fecha del formulario que es un String a Date
    SimpleDateFormat parseador = null;
    // Para visualizar la fecha de nacimiento con el formato requerido
    SimpleDateFormat formateador = null;

    if (request.getParameter("enviar").equals("Inicio")) {
        url.replace(0, url.length(), request.getContextPath());
    } else {

        if (nombreAtributo.length() != 0) {
            parseador = new SimpleDateFormat("yyyy-MM-dd");
            formateador = new SimpleDateFormat("EEEE d 'de' MMMM 'de' yyyy");
            // Obtenemos el atributo de sesión
            Empleado empleadoSesion = (Empleado) request.getSession().getAttribute(nombreAtributo);
            switch (request.getParameter("enviar")) {
                case "Crear":
                    // Comprobamos la existencia del nuevo atributo de sesión
                    if (empleadoSesion == null) {
                        // Comprobamos que todos los datos del empleado estén rellenos
                        Enumeration<String> controles = request.getParameterNames();
                        Boolean vacio = false;
                        while (controles.hasMoreElements() && !vacio) {
                            String nombreControl = controles.nextElement();
                            if (request.getParameter(nombreControl).length() == 0) {
                                vacio = Boolean.TRUE;
                            }
                        }
                        if (!vacio) { // En el caso de que el formulario esté correcto
                            // Creamos el objeto empleado con los datos que vienen en el formulario
                            Empleado empleado = new Empleado();
                            empleado.setNombre(request.getParameter("nombre"));
                            empleado.setFnac(parseador.parse(request.getParameter("fnac")));
                            try {
                                empleado.setSalario(Double.parseDouble(request.getParameter("salario")));
                                // Guardamos los datos del nuevo empleado en el atributo de sesión
                                request.getSession().setAttribute(nombreAtributo, empleado);
                                // Componemos el mensaje que aparecerá en el menú
                                mensaje.append("Atributo de sesión creado con nombre: \"").append(nombreAtributo).append("\" y valor: <ul><li>").
                                        append("Nombre: ").append(empleado.getNombre()).append("</li><li>Fecha de nacimiento: ").
                                        append(formateador.format(empleado.getFnac())).append("</li><li>Salario: ").append(empleado.getSalario()).append("</li></ul>");
                            } catch (NumberFormatException ex) {
                                // En el caso de que en el campo salario no venga con un número válido para el proceso
                                mensaje.append("El salario no es un número válido para el proceso");
                            }
                        } else {
                            // En el caso de que todos los campos no estén rellenos
                            mensaje.append("<span class=\"error\">Todos los datos del empleado son obligatorios</span>");
                        }

                    } else {
                        // En el caso de que el atributo de sesión que se pretende crear ya exista
                        mensaje.append("El atributo de sesión \"").append(nombreAtributo).append("\" ya existe y no se puede crear");
                    }

                    break;

                case "Visualizar":
                    if (empleadoSesion != null) {
                        // Componemos el mensaje que aparecerá en el menú
                        mensaje.append("El atributo de sesión \"").append(nombreAtributo).append("\" tiene el valor <ul><li>").append("Nombre: ").
                                append(empleadoSesion.getNombre()).append("</li><li>Fecha de nacimiento: ").
                                append(formateador.format(empleadoSesion.getFnac())).append("</li><li>Salario: ").append(empleadoSesion.getSalario()).append("</li></ul>");
                    } else {
                        // En el casode el atributo de sesión no exista y por lo tanto no podemos visualizar su contenido
                        mensaje.append("El atributo de sesión \"").append(nombreAtributo).append("\" no existe");
                    }

                    break;

                case "Modificar":
                    if (empleadoSesion != null) {
                        // Comprobamos quue todos los datos del empleado estén rellenos
                        Enumeration<String> controles = request.getParameterNames();
                        Boolean vacio = false;
                        while (controles.hasMoreElements() && !vacio) {
                            String nombreControl = controles.nextElement();
                            if (request.getParameter(nombreControl).length() == 0) {
                                vacio = Boolean.TRUE;
                            }
                        }
                        if (!vacio) {
                            // Creamos el objeto empleado con los datos que vienen en el formulario
                            Empleado empleado = new Empleado();
                            empleado.setNombre(request.getParameter("nombre"));
                            empleado.setFnac(parseador.parse(request.getParameter("fnac")));
                            try {
                                empleado.setSalario(Double.parseDouble(request.getParameter("salario")));
                                // Guardamos los nuevos datos del atributo de sesión
                                request.getSession().setAttribute(nombreAtributo, empleado);
                                mensaje.append("Se modificó el valor del atributo de sesión \"").append(nombreAtributo).append("\"");
                            } catch (NumberFormatException ex) {
                                // En el caso de que en el campo salario no venga con un número válido para el proceso
                                mensaje.append("El salario no es un número válido para el proceso");
                            }
                        } else {
                            // En el caso de que todos los campos no estén rellenos
                            mensaje.append("<span class=\"error\">Todos los datos del empleado son obligatorios</span>");
                        }
                    } else {
                        // En el caso de que el atributo de sesión no exista y por lo tanto no se puede modificar
                        mensaje.append("El atributo de sesión \"").append(nombreAtributo).append("\" no existe y no se puede modificar");
                    }

                    break;

                case "Eliminar":
                    if (empleadoSesion != null) {
                        // En el caso de existir eliminamos el atributo de sesión
                        request.getSession().removeAttribute(nombreAtributo);
                        // Componemos el mensaje de salida
                        mensaje.append("El atributo de sesión \"").append(nombreAtributo).append("\" se eliminó correctamente");
                    } else {
                        // // En el caso de que el atributo de sesión no exista y por lo tanto no lo podemos eliminar
                        mensaje.append("El atributo de sesión \"").append(nombreAtributo).append("\" no existe y no se puede eliminar");
                    }
            }

        } else {
            // En el caso de que no haber especificado el nombre del atributo de sesión
            mensaje.append("<span class=\"error\">El campo \"Nombre del atributo de sesión\" es obigatorio</span>");

        }
    }

    request.getSession().setAttribute("mensaje", mensaje.toString());
    response.sendRedirect(url.toString());


%>