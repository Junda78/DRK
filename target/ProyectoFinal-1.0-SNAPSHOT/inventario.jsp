<%@ page import="java.util.List" %>
<%@ page import="modelo.Vehiculo" %>
<%@ page import="modelo.VehiculoDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detroit Road Kings - Inventario</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <!-- Estilos personalizados -->
        <link rel="stylesheet" href="css/stylesPP.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <a class="navbar-brand" href="paginaPrincipalUsuario.jsp">DRK</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                    aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto">
                    <a class="nav-link active" href="inventario.jsp">Inventario</a>
                    <a class="nav-link" href="gestioncitas.jsp">Citas</a>
                    <a class="nav-link" href="clientes.jsp">Clientes</a>
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <!-- Aquí mostramos el nombre del usuario -->
                            Usuario
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="perfil.jsp">Perfil</a>
                            <a class="dropdown-item" href="Login.jsp">Cerrar Sesión</a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
        <div class="container mt-5">
            <!-- Botón para registrar un nuevo vehículo -->
            <div class="mb-5 pt-4">
                <a href="registrarVehiculo.jsp" class="btn btn-primary">Registrar Vehículo</a>
            </div>
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Año</th>
                        <th>Precio</th>
                        <th>Estado</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        VehiculoDao vehiculoDao = new VehiculoDao();
                        List<Vehiculo> vehiculos = vehiculoDao.obtenerTodos();
                        for (Vehiculo vehiculo : vehiculos) {
                    %>
                    <tr>
                        <td><%= vehiculo.getIdVehiculo() %></td>
                        <td><%= vehiculo.getMarca() %></td>
                        <td><%= vehiculo.getModelo() %></td>
                        <td><%= vehiculo.getAnio() %></td>
                        <td>$ <%= vehiculo.getPrecio() %></td>
                        <td><%= vehiculo.getEstado() %></td>
                        <td><%= vehiculo.getDescripcion() %></td>
                        <td>
                            <form action="actualizarVehiculo.jsp" method="post" style="display: inline;">
                                <input type="hidden" name="idVehiculo" value="<%= vehiculo.getIdVehiculo() %>">
                                <button type="submit" class="btn btn-warning">Actualizar</button>
                            </form>
                            <form action="EliminarVehiculoServlet" method="post">
                                <input type="hidden" name="idVehiculo" value="<%= vehiculo.getIdVehiculo() %>">
                                <button type="submit" class="btn btn-danger">Eliminar</button>
                            </form>


                        </td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </div>


        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


    </body>
</html>
