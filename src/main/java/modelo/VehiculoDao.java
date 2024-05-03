package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VehiculoDao {

    private Conexion cn;

    public VehiculoDao() {
        this.cn = new Conexion();
    }

    public List<Vehiculo> obtenerTodos() {
        String sql = "SELECT ID_Vehiculo, Marca, Modelo, Anio, Precio, Estado, Descripcion, Imagen,Tipo FROM vehiculos";
        List<Vehiculo> vehiculos = new ArrayList<>();
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Vehiculo vehiculo = new Vehiculo(
                        rs.getInt("ID_Vehiculo"),
                        rs.getString("Marca"),
                        rs.getString("Modelo"),
                        rs.getString("Anio"),
                        rs.getString("Precio"),
                        rs.getString("Estado"),
                        rs.getString("Descripcion"),
                        rs.getString("Imagen"),
                        rs.getString("Tipo")
                );
                vehiculos.add(vehiculo);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener los vehículos: " + e.getMessage());
            e.printStackTrace();
        }
        return vehiculos;
    }

    public boolean registrarVehiculo(Vehiculo vehiculo) {
        String sql = "INSERT INTO vehiculos (Marca, Modelo, Anio, Precio, Estado, Descripcion, Imagen, Tipo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, vehiculo.getMarca());
            ps.setString(2, vehiculo.getModelo());
            ps.setString(3, vehiculo.getAnio());
            ps.setString(4, vehiculo.getPrecio());
            ps.setString(5, vehiculo.getEstado());
            ps.setString(6, vehiculo.getDescripcion());
            ps.setString(7, vehiculo.getImagen());
            ps.setString(8, vehiculo.getTipo());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            System.err.println("Error al registrar el vehículo: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public Vehiculo obtenerPorId(int id) {
        String sql = "SELECT ID_Vehiculo, Marca, Modelo, Anio, Precio, Estado, Descripcion, Imagen, Tipo FROM vehiculos WHERE ID_Vehiculo = ?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Vehiculo vehiculo = new Vehiculo(
                            rs.getInt("ID_Vehiculo"),
                            rs.getString("Marca"),
                            rs.getString("Modelo"),
                            rs.getString("Anio"),
                            rs.getString("Precio"),
                            rs.getString("Estado"),
                            rs.getString("Descripcion"),
                            rs.getString("Imagen"),
                            rs.getString("Tipo")
                    );
                    return vehiculo;
                } else {
                    // Si no se encuentra ningún vehículo con el ID dado, puedes devolver null o lanzar una excepción según tu preferencia.
                    return null;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el vehículo por ID: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public boolean actualizar(Vehiculo vehiculo) {
        String sql = "UPDATE vehiculos SET Marca=?, Modelo=?, Anio=?, Precio=?, Estado=?, Descripcion=?, Imagen=?, Tipo=? WHERE ID_Vehiculo=?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, vehiculo.getMarca());
            ps.setString(2, vehiculo.getModelo());
            ps.setString(3, vehiculo.getAnio());
            ps.setString(4, vehiculo.getPrecio());
            ps.setString(5, vehiculo.getEstado());
            ps.setString(6, vehiculo.getDescripcion());
            ps.setString(7, vehiculo.getImagen());
            ps.setString(8, vehiculo.getTipo());
            ps.setInt(9, vehiculo.getIdVehiculo());

            int filasActualizadas = ps.executeUpdate();
            return filasActualizadas > 0;
        } catch (SQLException e) {
            System.err.println("Error al actualizar el vehículo: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarVehiculo(int id) {
        String sql = "DELETE FROM vehiculos WHERE ID_Vehiculo = ?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int filasAfectadas = ps.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            System.err.println("Error al eliminar el vehículo: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

}
