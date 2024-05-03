/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Conexion {
    private static String url = "jdbc:mysql://localhost:3306/concesionario";
    private static String user = "root";
    private static String pass = "";

    public static Connection getConexion() {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver"); // Asegúrate de usar el driver correcto. "com.mysql.jdbc.Driver" está obsoleto.
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
            System.out.println("Error al conectar a la base de datos: " + e.getMessage());
        }
        return con;
    }

    
}
