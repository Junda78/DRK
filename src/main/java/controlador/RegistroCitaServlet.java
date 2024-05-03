package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import modelo.CitaDao;
import config.Conexion;

@WebServlet("/RegistroCitaServlet")
public class RegistroCitaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Obtener parámetros del formulario
            String documento = request.getParameter("documento");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String tipoCita = request.getParameter("tipoCita");

            // Verificar si los parámetros son nulos o vacíos
            if (documento == null || fecha == null || hora == null || tipoCita == null ||
                documento.isEmpty() || fecha.isEmpty() || hora.isEmpty() || tipoCita.isEmpty()) {
                out.println("Error: Todos los campos son requeridos");
                return;
            }

            // Convertir fecha y hora a objetos LocalDate y LocalTime
            LocalDate fechaCita = LocalDate.parse(fecha);
            LocalTime horaCita = LocalTime.parse(hora);

            // Crear instancia de CitaDao dentro del método y obtener la conexión
            try (Connection conexion = Conexion.getConexion()) {
                CitaDao citaDao = new CitaDao(conexion);

                // Buscar el ID del cliente en la base de datos
                int idCliente = citaDao.buscarIDCliente(documento);

                // Si no se encuentra el cliente, mostrar un mensaje de error
                if (idCliente == -1) {
                    out.println("Error: Cliente no encontrado");
                    return;
                }

                // Guardar la cita en la base de datos
                boolean citaGuardada = citaDao.guardarCita(idCliente, fechaCita, horaCita, tipoCita);

                // Mostrar mensaje de éxito o error
                if (citaGuardada) {
                    response.sendRedirect("informacion.jsp");
                } else {
                    out.println("Error al agendar la cita");
                }
            } catch (SQLException e) {
                out.println("Error de base de datos: " + e.getMessage());
            }
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
        return "Servlet para registrar una nueva cita";
    }
}
