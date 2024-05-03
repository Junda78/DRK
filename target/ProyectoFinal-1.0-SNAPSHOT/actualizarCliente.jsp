<%-- 
    Document   : actualizarCliente
    Created on : 27/04/2024, 4:05:13 p. m.
    Author     : juand
--%>

<%@ page import="modelo.Cliente" %>
<%@ page import="modelo.ClienteDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Obtener el ID del vehículo a actualizar desde el parámetro de la solicitud
    int id = Integer.parseInt(request.getParameter("id"));
    // Obtener el vehículo correspondiente al ID
    ClienteDao clienteDao = new ClienteDao();
    Cliente cliente = clienteDao.obtenerPorId(id);
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detroit Road Kings - Actualizar Cliente</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesPP.css">
        <link rel="stylesheet" href="js/functions.js">
    </head>
    <body>
        <div class="container mt-5">
            <h1>Actualizar Cliente</h1>
            <form action="ActualizarClienteServlet" method="post">
                <input type="hidden" name="id" value="<%= cliente.getId() %>">
                <div class="form-group">
                    <label for="tipoDocumento">Tipo de Documento:</label>
                    <input type="text" class="form-control" id="tipoDocumento" name="tipo_documento" value="<%= cliente.getTipo_documento() %>" required>
                </div>
                <div class="form-group">
                    <label for="documento">Documento:</label>
                    <input type="text" class="form-control" id="documento" name="documento" value="<%= cliente.getDocumento() %>" required>
                </div>
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="<%= cliente.getNombre() %>" required>
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value="<%= cliente.getApellido() %>" required>
                </div>
                <div class="form-group">
                    <label for="correo">Correo:</label>
                    <input type="email" class="form-control" id="correo" name="correo" value="<%= cliente.getCorreo() %>" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="text" class="form-control" id="telefono" name="telefono" value="<%= cliente.getTelefono() %>" required>
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" value="<%= cliente.getDireccion() %>" required>
                </div>
                <div class="form-group">
                    <label for="usuario">Usuario:</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" value="<%= cliente.getUsuario() %>" required>
                </div>
                
                <button type="submit" class="btn btn-primary">Actualizar</button>
            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>

