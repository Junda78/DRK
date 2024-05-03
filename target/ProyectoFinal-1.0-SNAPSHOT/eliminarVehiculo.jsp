<%-- 
    Document   : eliminarVehiculo
    Created on : 22/04/2024, 11:13:33 p. m.
    Author     : juand
--%>

<%@ page import="modelo.VehiculoDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Obtener el ID del vehículo a eliminar desde el parámetro de la solicitud
    int idVehiculo = Integer.parseInt(request.getParameter("idVehiculo"));
    // Crear una instancia de VehiculoDao
    VehiculoDao vehiculoDao = new VehiculoDao();
    // Eliminar el vehículo con el ID especificado
    boolean eliminado = vehiculoDao.eliminarVehiculo(idVehiculo);
    // Redirigir a la página de inventario después de eliminar el vehículo
    response.sendRedirect("inventario.jsp");
%>

