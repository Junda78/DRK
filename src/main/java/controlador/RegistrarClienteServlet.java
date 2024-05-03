/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import modelo.Cliente;
import modelo.ClienteDao;
import java.io.IOException;

public class RegistrarClienteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String documento = request.getParameter("documento");
        String correo = request.getParameter("correoElectronico");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contraseña");
        String tipoDocumento = request.getParameter("tipo_documento");

        // Realiza algunas validaciones básicas
        if (nombre == null || apellido == null || documento == null || correo == null || telefono == null || direccion == null || usuario == null || contraseña == null || tipoDocumento == null
                || nombre.isEmpty() || apellido.isEmpty() || documento.isEmpty() || correo.isEmpty() || telefono.isEmpty() || direccion.isEmpty() || usuario.isEmpty() || contraseña.isEmpty() || tipoDocumento.isEmpty()) {
            request.setAttribute("mensaje", "Error: Todos los campos son obligatorios"); // Mensaje de error
            request.getRequestDispatcher("error.jsp").forward(request, response); // Redirige a la página de error
            return;
        }

        Cliente cliente = new Cliente();
        cliente.setNombre(nombre);
        cliente.setApellido(apellido);
        cliente.setDocumento(documento);
        cliente.setCorreo(correo);
        cliente.setTelefono(telefono);
        cliente.setDireccion(direccion);
        cliente.setUsuario(usuario);
        cliente.setContraseña(contraseña);
        cliente.setTipo_documento(tipoDocumento);

        ClienteDao clienteDao = new ClienteDao();

        // Intenta registrar al cliente en la base de datos
        if (clienteDao.registrar(cliente)) {
            request.setAttribute("mensaje", "Registro exitoso"); // Mensaje de éxito
            request.getRequestDispatcher("Login.jsp").forward(request, response); // Redirige a la página de login
        } else {
            request.setAttribute("mensaje", "Error al registrar cliente"); // Mensaje de error
            request.getRequestDispatcher("registro_cliente.jsp").forward(request, response); // Redirige a la página de error
        }
    }
}
