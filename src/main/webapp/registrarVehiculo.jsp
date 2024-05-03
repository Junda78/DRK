<%-- 
    Document   : registrarVehiculo
    Created on : 15/04/2024, 7:47:17 p. m.
    Author     : juand
--%>

<%@ page import="modelo.Vehiculo" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro de Vehículo</title>
        <link rel="stylesheet" href="css/stylesRV.css">
    </head>
    <body>
        <div class="container">
            <h2>Registro de Vehículo</h2>
            <form action="RegistrarVehiculo" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="marca">Marca:</label>
                    <input type="text" class="form-control" id="marca" name="marca" required>
                </div>
                <div class="form-group">
                    <label for="modelo">Modelo:</label>
                    <input type="text" class="form-control" id="modelo" name="modelo" required>
                </div>
                <div class="form-group">
                    <label for="anio">Año:</label>
                    <input type="number" class="form-control" id="anio" name="anio" required>
                </div>
                <div class="form-group">
                    <label for="precio">Precio:</label>
                    <input type="number" class="form-control" id="precio" name="precio" required min="0" step="0.01">
                </div>
                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <select class="form-control" id="estado" name="estado" required>
                        <option value="Nuevo">Nuevo</option>
                        <option value="Usado">Usado</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <textarea class="form-control" id="descripcion" name="descripcion" required></textarea>
                </div>
                <div class="form-group">
                    <label for="tipo">Tipo:</label>
                    <select class="form-control" id="tipo" name="tipo" required>
                        <option value="Carro">Carro</option>
                        <option value="Camion">Camion</option>
                        <option value="Camioneta">Camioneta</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="imagen">Imagen:</label>
                    <input type="file" class="form-control" id="imagen" name="imagen" required>
                </div>
                <button type="submit" class="btn btn-primary">Registrar</button>
            </form>
        </div>
    </body>
</html>
