<%-- 
    Document   : actualizarVehiculo
    Created on : 22/04/2024, 10:59:44 p. m.
    Author     : juand
--%>
<%@ page import="modelo.Vehiculo" %>
<%@ page import="modelo.VehiculoDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Obtener el ID del vehículo a actualizar desde el parámetro de la solicitud
    int idVehiculo = Integer.parseInt(request.getParameter("idVehiculo"));
    // Obtener el vehículo correspondiente al ID
    VehiculoDao vehiculoDao = new VehiculoDao();
    Vehiculo vehiculo = vehiculoDao.obtenerPorId(idVehiculo);
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Actualizar Vehículo</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Actualizar Vehículo</h2>
        <form action="ActualizarVehiculoServlet" method="post">
            <input type="hidden" name="idVehiculo" value="<%= vehiculo.getIdVehiculo() %>">
            <div class="form-group">
                <label for="marca">Marca:</label>
                <input type="text" class="form-control" id="marca" name="marca" value="<%= vehiculo.getMarca() %>">
            </div>
            <div class="form-group">
                <label for="modelo">Modelo:</label>
                <input type="text" class="form-control" id="modelo" name="modelo" value="<%= vehiculo.getModelo() %>">
            </div>
            <div class="form-group">
                <label for="anio">Año:</label>
                <input type="text" class="form-control" id="anio" name="anio" value="<%= vehiculo.getAnio() %>">
            </div>
            <div class="form-group">
                <label for="precio">Precio:</label>
                <input type="text" class="form-control" id="precio" name="precio" value="<%= vehiculo.getPrecio() %>">
            </div>
            <div class="form-group">
                <label for="estado">Estado:</label>
                <input type="text" class="form-control" id="estado" name="estado" value="<%= vehiculo.getEstado() %>">
            </div>
            <div class="form-group">
                <label for="descripcion">Descripción:</label>
                <textarea class="form-control" id="descripcion" name="descripcion" rows="3"><%= vehiculo.getDescripcion() %></textarea>
            </div>
            <div class="form-group">
                <label for="imagen">URL de la Imagen:</label>
                <input type="text" class="form-control" id="imagen" name="imagen" value="<%= vehiculo.getImagen() %>">
            </div>
            <div class="form-group">
                <label for="tipo">Tipo:</label>
                <input type="text" class="form-control" id="tipo" name="tipo" value="<%= vehiculo.getTipo() %>">
            </div>
            <button type="submit" class="btn btn-primary">Actualizar</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
