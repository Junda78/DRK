package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import modelo.Cita;
import modelo.CitaDao;
import config.Conexion;

@WebServlet(name = "ListarCitasServlet", urlPatterns = {"/listaCitas"})
public class ListarCitasServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conexion = Conexion.getConexion();
            CitaDao citasDao = new CitaDao(conexion);

            List<Cita> listaCitas = citasDao.listarCitasConClientes();

            request.setAttribute("citasConClientes", listaCitas);
            request.getRequestDispatcher("gestioncitas.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error al procesar la solicitud: " + e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para listar citas";
    }
}
