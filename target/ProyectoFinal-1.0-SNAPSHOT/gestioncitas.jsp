<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modelo.Cita" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detroit Road Kings</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="css/stylesPP.css">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <a class="navbar-brand" href="paginaPrincipalUsuario.jsp">DRK</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav ml-auto">
                    <a class="nav-link active" href="inventario.jsp">Inventario</a>
                    <a class="nav-link" href="gestioncitas.jsp">Citas</a>
                    <a class="nav-link" href="clientes.jsp">Clientes</a>
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
        <div class="container mt-5 pt-5">
            <h1>Listado de Citas</h1>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID Cita</th>
                        <th>Fecha</th>
                        <th>Hora</th>
                        <th>Tipo de Cita</th>
                        <th>Nombre Cliente</th>
                        <th>Apellido Cliente</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Cita> citasConClientes = (List<Cita>) request.getAttribute("citasConClientes");
                        if (citasConClientes != null && !citasConClientes.isEmpty()) {
                            for (Cita cita : citasConClientes) {
                    %>
                    <tr>
                        <td>${cita.idCita}</td>
                        <td>${cita.fecha}</td>
                        <td>${cita.hora}</td>
                        <td>${cita.tipoCita}</td>
                        <td>${cita.nombreCliente}</td>
                        <td>${cita.apellidoCliente}</td>
                    </tr>

                    <% 
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center">No hay citas disponibles.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <div class="social-buttons fixed-bottom">
            <a href="https://wa.me/yourNumber" target="_blank" class="social-button whatsapp"><i class="fab fa-whatsapp"></i></a>
            <a href="https://www.instagram.com/yourUsername" target="_blank" class="social-button instagram"><i class="fab fa-instagram"></i></a>
            <a href="https://www.facebook.com/yourPage" target="_blank" class="social-button facebook"><i class="fab fa-facebook-f"></i></a>
        </div>
    </body>
</html>
