package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import modelo.ClienteDao;
import modelo.Cliente;
import modelo.Usuarios;
import modelo.UsuarioDao;

public class Validar extends HttpServlet {

    ClienteDao cldao = new ClienteDao();
    UsuarioDao usDao = new UsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null && accion.equalsIgnoreCase("iniciarSesion")) {
            String usuario = request.getParameter("txtusuario");
            String contraseña = request.getParameter("txtcontra");

            // Intentar autenticar como cliente
            Cliente cl = cldao.validar(usuario, contraseña);
            if (cl != null && cl.getUsuario() != null) {
                // Si las credenciales son válidas para un cliente, redirige a la página principal de clientes
                request.getRequestDispatcher("paginaPrincipalCliente.jsp").forward(request, response);
                return; // Importante: terminar la ejecución del método después de redirigir
            }

            // Si no se autentica como cliente, intentar autenticar como usuario
            Usuarios us = usDao.obtenerUsuarioPorCredenciales(usuario, contraseña);
            if (us != null && us.getNombreUsuario() != null) {
                // Si las credenciales son válidas para un usuario, redirige a la página principal de usuarios
                request.getRequestDispatcher("paginaPrincipalUsuario.jsp").forward(request, response);
                return; // Importante: terminar la ejecución del método después de redirigir
            }
        }

        // Si no se proporciona un valor de acción válido o ninguna autenticación tiene éxito,
        // redirige de nuevo al formulario de inicio de sesión
        request.getRequestDispatcher("Login.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
