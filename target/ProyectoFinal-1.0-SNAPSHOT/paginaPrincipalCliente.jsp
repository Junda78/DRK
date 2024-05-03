<%-- 
    Document   : paginaPrincipal
    Created on : 6/04/2024, 6:47:13 p. m.
    Author     : juand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

    <!-- Carrusel de Bootstrap -->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="vehiculos.jsp"><img src="img/ford.jpg" class="d-block w-100" alt="Vehículo 1"></a>
            </div>
            <div class="carousel-item">
                <a href="vehiculos.jsp"><img src="img/mazda1.jpg" class="d-block w-100" alt="Vehículo 2"></a>
            </div>
            <div class="carousel-item">
                <a href="vehiculos.jsp"><img src="img/camaro.jpg" class="d-block w-100" alt="Vehículo 3"></a>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </a>
    </div>

    <!-- Bootstrap JS -->
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
