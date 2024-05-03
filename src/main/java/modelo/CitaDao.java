package modelo;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CitaDao {

    private Connection conexion;

 
    public CitaDao(Connection conexion) {
        this.conexion = conexion;
    }

    // Otros métodos de la clase CitaDao...
    public boolean insertarCita(Cita cita) {
        String sql = "INSERT INTO citas (ID_Cliente, Fecha, Hora, TipoCita) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = conexion.prepareStatement(sql)) {
            stmt.setInt(1, cita.getIdCliente());
            stmt.setDate(2, Date.valueOf(cita.getFecha()));
            stmt.setTime(3, Time.valueOf(cita.getHora()));
            stmt.setString(4, cita.getTipoCita());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public int buscarIDCliente(String documento) {
        int idCliente = -1;
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/concesionario", "root", "")) {
            String sql = "SELECT ID_Cliente FROM clientes WHERE Documento = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, documento);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        idCliente = rs.getInt("ID_Cliente");
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(CitaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idCliente;
    }

    // Método para guardar la cita en la base de datos
    public boolean guardarCita(int idCliente, LocalDate fecha, LocalTime hora, String tipoCita) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/concesionario", "root", "")) {
            String sql = "INSERT INTO citas (ID_Cliente, Fecha, Hora, TipoCita) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, idCliente);
                stmt.setDate(2, Date.valueOf(fecha));
                stmt.setTime(3, Time.valueOf(hora));
                stmt.setString(4, tipoCita);
                int filasAfectadas = stmt.executeUpdate();
                return filasAfectadas > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CitaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public List<Cita> listarCitasConClientes() throws SQLException {
        List<Cita> citas = new ArrayList<>();
        String consulta = "SELECT citas.ID_Cita, citas.ID_Cliente, citas.Fecha, citas.Hora, c.TipoCita, clientes.Nombre AS NombreCliente, clientes.Apellido AS ApellidoCliente "
                + "FROM citas citas "
                + "INNER JOIN clientes clientes ON clientes.ID_Cliente = clientes.ID_Cliente";
        try (PreparedStatement pstmt = conexion.prepareStatement(consulta); ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                int idCita = rs.getInt("ID_Cita");
                int idCliente = rs.getInt("ID_Cliente");
                LocalDate fecha = rs.getDate("Fecha").toLocalDate();
                LocalTime hora = rs.getTime("Hora").toLocalTime();
                String tipoCita = rs.getString("TipoCita");
                String nombreCliente = rs.getString("NombreCliente");
                String apellidoCliente = rs.getString("ApellidoCliente");
                citas.add(new Cita(idCita, idCliente, fecha, hora, tipoCita, nombreCliente, apellidoCliente));
            }
        } catch (SQLException ex) {
            throw new SQLException("Error al recuperar la lista de citas con clientes: " + ex.getMessage(), ex);
        }
        return citas;
    }


}
