<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/styles.css">
    </head>
    <body>
        <div class="container">
            <form id="loginForm" action="Validar" method="post">
                <div class="imgCar">
                    <img src="img/drk.png" width="300" height="300">
                </div>
                <div class="mb-3">
                    <label for="usuarioInput" class="form-label">Usuario</label>
                    <input type="text" id="usuarioInput" name="txtusuario" class="form-control" placeholder="...">
                </div>
                <div class="mb-3">
                    <label for="contraseñaInput" class="form-label">Contraseña</label>
                    <input type="password" name="txtcontra" class="form-control" placeholder="...">
                </div>
                <div class="button">
                    <button type="submit" name="accion" value="iniciarSesion" class="btn btn-primary">Iniciar Sesión</button>
                </div>
                <div class="register-link text-center">
                    <a href="registro_cliente.jsp" class="btn btn-link">¿Deseas registrarte?</a>
                </div>
            </form>
        </div>
    </body>
</html>
