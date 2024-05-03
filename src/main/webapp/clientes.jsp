<%@ page import="java.util.List" %>
<%@ page import="modelo.ClienteDao" %>
<%@ page import="modelo.Cliente" %>


<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detroit Road Kings</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/stylesPP.css">
        <link rel="stylesheet" href="js/functions.js">
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
            <!-- Agregamos un botón para registrar un nuevo cliente -->
            <div class="mb-5 pt-4">
                <a href="RegistroClienteAd.jsp" class="btn btn-success">Registrar Cliente</a>
            </div>
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tipo de Documento</th>
                        <th>Documento</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Correo</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Usuario</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        ClienteDao clienteDao = new ClienteDao();
                        List<Cliente> clientes = clienteDao.listaClientes();
                        for (Cliente cliente : clientes) {
                    %>
                    <tr>
                        <td><%= cliente.getId() %></td>
                        <td><%= cliente.getTipo_documento() %></td>
                        <td><%= cliente.getDocumento() %></td>
                        <td><%= cliente.getNombre() %></td>
                        <td><%= cliente.getApellido() %></td>
                        <td><%= cliente.getCorreo() %></td>
                        <td><%= cliente.getTelefono() %></td>
                        <td><%= cliente.getDireccion() %></td>
                        <td><%= cliente.getUsuario() %></td>
                        <td>
                            <a href="actualizarCliente.jsp?id=<%= cliente.getId() %>" class="btn btn-primary">Editar</a>
                            <!-- Agregar este formulario dentro del bucle que muestra los clientes -->
                            <form action="EliminarClienteServlet" method="post">
                                <input type="hidden" name="id" value="<%= cliente.getId() %>">
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


        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
