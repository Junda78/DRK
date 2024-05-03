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

import modelo.Cliente;
import modelo.ClienteDao;

/**
 *
 * @author juand
 */
public class ActualizarClienteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener los parámetros del formulario de actualización
        int id = Integer.parseInt(request.getParameter("id"));
        String tipo_documento = request.getParameter("tipo_documento");
        String documento = request.getParameter("documento");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String usuario = request.getParameter("usuario");
        //String contraseña = request.getParameter("contraseña");

        // Crear un objeto Cliente con los datos actualizados
        Cliente cliente = new Cliente(id, tipo_documento, documento, nombre, apellido, correo, telefono, direccion, usuario, "");

        // Actualizar el cliente en la base de datos
        ClienteDao clienteDao = new ClienteDao();
        boolean actualizado = clienteDao.actualizarCliente(cliente);

        // Redireccionar a la página de clientes con un mensaje de éxito o error
        if (actualizado) {
            response.sendRedirect("clientes.jsp?mensaje=Cliente actualizado correctamente");
        } else {
            response.sendRedirect("clientes.jsp?error=Error al actualizar el cliente");
        }
    }
}
