<%-- 
    Document   : RegistroClienteAdmin
    Created on : 16/04/2024, 1:48:10 p. m.
    Author     : juand
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro de Cliente</title>
        <link rel="stylesheet" href="css/stylesRC.css">
    </head>
    <body>
        <div class="container">
            <h2>Registro de Cliente</h2>
            <form action="registrarClienteAdmin" method="post">
                <div class="form-group">
                    <label for="nombre">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" required>
                </div>
                <div class="form-group">
                    <label for="apellido">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" required>
                </div>
                <div class="form-group">
                    <label for="tipo_documento">Tipo de Documento:</label>
                    <select class="form-control" id="tipo_documento" name="tipo_documento" required>
                        <option value="Cedula de Ciudadanía">Cedula de Ciudadanía</option>
                        <option value="Pasaporte">Pasaporte</option>
                        <option value="Permiso Temporal de Permanencia">Permiso Temporal de Permanencia</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="numero_identidad">Número de Identidad:</label>
                    <input type="text" class="form-control" id="documento" name="documento" required>
                </div>
                <div class="form-group">
                    <label for="correo">Correo:</label>
                    <input type="email" class="form-control" id="correoElectronico" name="correoElectronico" required>
                </div>
                <div class="form-group">
                    <label for="telefono">Teléfono:</label>
                    <input type="tel" class="form-control" id="telefono" name="telefono" required>
                </div>
                <div class="form-group">
                    <label for="direccion">Dirección:</label>
                    <input type="text" class="form-control" id="direccion" name="direccion" required>
                </div>
                <div class="form-group">
                    <label for="usuario">Usuario:</label>
                    <input type="text" class="form-control" id="usuario" name="usuario" required>
                </div>
                <div class="form-group">
                    <label for="contraseña">Contraseña:</label>
                    <input type="password" class="form-control" id="contraseña" name="contraseña" required>
                </div>
                <button type="submit" class="btn btn-primary">Registrar</button>
            </form>
        </div>

    </body>
</html>
