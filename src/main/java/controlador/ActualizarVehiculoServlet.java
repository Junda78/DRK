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
import modelo.Vehiculo;
import modelo.VehiculoDao;


/**
 *
 * @author juand
 */
public class ActualizarVehiculoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario de actualización
        int idVehiculo = Integer.parseInt(request.getParameter("idVehiculo"));
        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String anio = request.getParameter("anio");
        String precio = request.getParameter("precio");
        String estado = request.getParameter("estado");
        String descripcion = request.getParameter("descripcion");
        String imagen = request.getParameter("imagen");
        String tipo = request.getParameter("tipo");

        // Crear un objeto Vehiculo con los datos actualizados
        Vehiculo vehiculo = new Vehiculo(idVehiculo, marca, modelo, anio, precio, estado, descripcion, imagen, tipo);

        // Actualizar el vehículo en la base de datos
        VehiculoDao vehiculoDao = new VehiculoDao();
        boolean actualizado = vehiculoDao.actualizar(vehiculo);

        // Redireccionar a la página de vehículos con un mensaje de éxito o error
        if (actualizado) {
            response.sendRedirect("inventario.jsp?mensaje=Vehículo actualizado correctamente");
        } else {
            response.sendRedirect("inventario.jsp?error=Error al actualizar el vehículo");
        }
    }
}