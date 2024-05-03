/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

/**
 *
 * @author juand
 */
import java.sql.*;


public class UsuarioDao {
    String URL = "jdbc:mysql://localhost:3306/concesionario";
    String USER = "root";
    String PASSWORD = "";

   
    public Usuarios obtenerUsuarioPorCredenciales(String nombreUsuario, String contrasena) {
        Usuarios usuario = null;
        String sql = "SELECT * FROM usuarios WHERE NombreUsuario = ? AND Contrasena = ?";
        
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
             
            pstmt.setString(1, nombreUsuario);
            pstmt.setString(2, contrasena);
            
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                usuario = new Usuarios();
                usuario.setIdUsuario(rs.getInt("ID_Usuario"));
                usuario.setNombreUsuario(rs.getString("NombreUsuario"));
                usuario.setContrasena(rs.getString("Contrasena"));
                usuario.setRol(rs.getString("Rol"));
                usuario.setIdRol(rs.getInt("ID_Rol"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return usuario;
    }
}

