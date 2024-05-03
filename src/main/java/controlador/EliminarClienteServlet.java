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
import modelo.ClienteDao;

/**
 *
 * @author juand
 */
public class EliminarClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el ID del cliente a eliminar desde el parámetro de la solicitud
        int id = Integer.parseInt(request.getParameter("id"));

        // Eliminar el cliente de la base de datos
        ClienteDao clienteDao = new ClienteDao();
        boolean eliminado = clienteDao.eliminarCliente(id);

        // Redireccionar a la página de clientes con un mensaje de éxito o error
        if (eliminado) {
            response.sendRedirect("clientes.jsp?mensaje=Cliente eliminado correctamente");
        } else {
            response.sendRedirect("clientes.jsp?error=Error al eliminar el cliente");
        }
    }
}