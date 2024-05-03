<%-- 
    Document   : citas
    Created on : 10/04/2024, 6:46:23 p. m.
    Author     : juand
--%>
<%@ page import="java.util.List" %>
<%@ page import="modelo.CitaDao" %>
<%@ page import="modelo.Cita" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detroit Road Kings - Agendar Citas</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/vehiculoscss.css">
        <link rel="stylesheet" href="css/stylesPP.css">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="js/comparar.js"></script>
    </head>
    <body>
        <div class="navbar">
            <nav class="navbar navbar-expand-lg navbar-light bg-white fixed-top">
                <div class="container-fluid">
                    <a class="navbar-brand" href="paginaPrincipalCliente.jsp">DRK</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav ml-auto">
                            <a class="nav-link active" href="vehiculos.jsp">Vehículos</a>
                            <a class="nav-link" href="citas.jsp">Citas</a>
                            <a class="nav-link" href="informacion.jsp">Información</a>
                            <div class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Usuario
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="perfil.jsp">Perfil</a>
                                    <a class="dropdown-item" href="Login.jsp">Cerrar Sesión</a>
                                </div>
                            </div>
                        </div>
                        <img src="img/car.gif" alt="Logo" width="80" height="80" class="ml-auto">
                    </div>
                </div>
            </nav>
        </div>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form action="RegistroCitaServlet" method="post" class="form-horizontal shadow p-3 mb-5 bg-white rounded">
                        <h2 class="text-center">Agendar Cita</h2>
                        <div class="form-group">
                            <label for="documento">Número de Documento:</label>
                            <input type="text" class="form-control" id="documento" name="documento" required>
                        </div>

                        <div class="form-group">
                            <label for="fecha">Fecha:</label>
                            <input type="date" class="form-control" id="fecha" name="fecha" required>
                        </div>
                        <div class="form-group">
                            <label for="hora">Hora:</label>
                            <input type="time" class="form-control" id="hora" name="hora" required>
                        </div>
                        <div class="form-group">
                            <label for="tipoCita">Tipo de Cita:</label>
                            <select class="form-control" id="tipoCita" name="tipoCita" required>
                                <option value="Mantenimiento">Mantenimiento</option>
                                <option value="Prueba de manejo">Prueba de manejo</option>
                            </select>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Agendar Cita</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <div class="social-buttons">
            <a href="https://wa.me/yourNumber" target="_blank" class="social-button whatsapp"><i class="fab fa-whatsapp"></i></a>
            <a href="https://www.instagram.com/yourUsername" target="_blank" class="social-button instagram"><i class="fab fa-instagram"></i></a>
            <a href="https://www.facebook.com/yourPage" target="_blank" class="social-button facebook"><i class="fab fa-facebook-f"></i></a>
        </div>
    </body>
</html>
