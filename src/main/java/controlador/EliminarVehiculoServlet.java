/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import modelo.VehiculoDao;

/**
 *
 * @author juand
 */
public class EliminarVehiculoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del vehículo a eliminar desde el parámetro de la solicitud
        int idVehiculo = Integer.parseInt(request.getParameter("idVehiculo"));

        // Eliminar el vehículo de la base de datos
        VehiculoDao vehiculoDao = new VehiculoDao();
        boolean eliminado = vehiculoDao.eliminarVehiculo(idVehiculo);

        // Redireccionar a la página de vehículos con un mensaje de éxito o error
        if (eliminado) {
            response.sendRedirect("inventario.jsp?mensaje=Vehículo eliminado correctamente");
        } else {
            response.sendRedirect("inventario.jsp?error=Error al eliminar el vehículo");
        }
    }
}
