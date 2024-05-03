<%@ page import="java.util.List" %>
<%@ page import="modelo.Vehiculo" %>
<%@ page import="modelo.VehiculoDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detroit Road Kings - Vehiculos</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
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
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup"
                            aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
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
        <div class="container-fluid mt-5 pt-5">
            <div class="row mb-3">
                <div class="col">

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <table class="table table-striped table-bordered">
                        <thead class="thead-dark">
                            <tr>
                                <th>ID</th>
                                <th>Marca</th>
                                <th>Modelo</th>
                                <th>Año</th>
                                <th>Precio</th>
                                <th>Estado</th>
                                <th>Tipo</th>
                                <th>Descripción</th>
                                <th>Acciones</th>
                                <th>Comparar</th>
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
                                <td><%= vehiculo.getTipo() %></td>
                                <td><%= vehiculo.getDescripcion() %></td>
                                <td>
                                    <button type="button" class="btn btn-primary" data-toggle="modal"
                                            data-target="#imagenModal<%= vehiculo.getIdVehiculo() %>">
                                        Ver
                                    </button>
                                    <div class="modal fade" id="imagenModal<%= vehiculo.getIdVehiculo() %>" tabindex="-1"
                                         role="dialog" aria-labelledby="imagenModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="imagenModalLabel">Imagen del Vehículo</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                            aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <img src="<%= vehiculo.getImagen() %>" class="img-fluid"
                                                         alt="Imagen del Vehículo">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <input type="checkbox" class="compare-checkbox" value="<%= vehiculo.getIdVehiculo() %>">
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <button id="compare-btn" class="btn btn-primary">Comparar</button>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <div class="social-buttons">
            <a href="https://wa.me/yourNumber" target="_blank" class="social-button whatsapp"><i
                    class="fab fa-whatsapp"></i></a>
            <a href="https://www.instagram.com/yourUsername" target="_blank" class="social-button instagram"><i
                    class="fab fa-instagram"></i></a>
            <a href="https://www.facebook.com/yourPage" target="_blank" class="social-button facebook"><i
                    class="fab fa-facebook-f"></i></a>
        </div>

        <script>
            $(document).ready(function () {
                $('#compare-btn').on('click', function () {
                    var selectedIds = [];
                    $('.compare-checkbox:checked').each(function () {
                        selectedIds.push($(this).val());
                    });

                    if (selectedIds.length === 2) {
                        var url = 'comparacionVehiculos.jsp?id1=' + selectedIds[0] + '&id2=' + selectedIds[1];
                        window.open(url, '_blank');
                    } else {
                        alert('Seleccione exactamente dos vehículos para comparar.');
                    }
                });
            });
        </script>

    </body>
</html>
