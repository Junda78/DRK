/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClienteDao {

    private Conexion cn = new Conexion();

    public Cliente validar(String usuario, String contraseña) {
        Cliente cliente = null;
        String sql = "SELECT * FROM clientes WHERE usuario = ? AND contraseña = ?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, usuario);
            ps.setString(2, contraseña);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cliente = new Cliente();
                    cliente.setUsuario(rs.getString("usuario"));
                    cliente.setContraseña(rs.getString("contraseña"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al validar el cliente: " + e.getMessage());
            e.printStackTrace();
        }
        return cliente;
    }

    public boolean registrar(Cliente cliente) {
        String sql = "INSERT INTO clientes (Tipo_documento, Documento, Nombre, Apellido, CorreoElectronico, Telefono, Direccion, Usuario, Contraseña) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, cliente.getTipo_documento());
            ps.setString(2, cliente.getDocumento());
            ps.setString(3, cliente.getNombre());
            ps.setString(4, cliente.getApellido());
            ps.setString(5, cliente.getCorreo());
            ps.setString(6, cliente.getTelefono());
            ps.setString(7, cliente.getDireccion());
            ps.setString(8, cliente.getUsuario());
            ps.setString(9, cliente.getContraseña());
            int result = ps.executeUpdate();
            return result > 0;
        } catch (SQLException e) {
            System.err.println("Error al registrar el cliente: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarCliente(Cliente cliente) {
        String sql = "UPDATE clientes SET Tipo_documento=?, Documento=?, Nombre=?, Apellido=?, CorreoElectronico=?, Telefono=?, Direccion=?, Usuario=? WHERE ID_Cliente=?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, cliente.getTipo_documento());
            ps.setString(2, cliente.getDocumento());
            ps.setString(3, cliente.getNombre());
            ps.setString(4, cliente.getApellido());
            ps.setString(5, cliente.getCorreo());
            ps.setString(6, cliente.getTelefono());
            ps.setString(7, cliente.getDireccion());
            ps.setString(8, cliente.getUsuario());
            //ps.setString(9, cliente.getContraseña());
            ps.setInt(9, cliente.getId());

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            System.err.println("Error al actualizar el cliente: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public Cliente buscarPorId(int idCliente) {
        Cliente cliente = null;
        String sql = "SELECT * FROM clientes WHERE ID_Cliente = ?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idCliente);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    cliente = new Cliente();
                    cliente.setId(rs.getInt("ID_Cliente"));
                    cliente.setTipo_documento(rs.getString("Tipo_documento"));
                    cliente.setDocumento(rs.getString("Documento"));
                    cliente.setNombre(rs.getString("Nombre"));
                    cliente.setApellido(rs.getString("Apellido"));
                    cliente.setCorreo(rs.getString("CorreoElectronico"));
                    cliente.setTelefono(rs.getString("Telefono"));
                    cliente.setDireccion(rs.getString("Direccion"));
                    cliente.setUsuario(rs.getString("Usuario"));
                    cliente.setContraseña(rs.getString("Contraseña"));
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al buscar el cliente por ID: " + e.getMessage());
            e.printStackTrace();
        }
        return cliente;
    }

    public List<Cliente> listaClientes() {
        String sql = "SELECT ID_Cliente, Tipo_documento, Documento, Nombre, Apellido, CorreoElectronico, Telefono, Direccion, Usuario, Contraseña FROM clientes";

        List<Cliente> clientes = new ArrayList<>();
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Cliente cliente = new Cliente(
                        rs.getInt("ID_Cliente"),
                        rs.getString("Tipo_documento"),
                        rs.getString("Documento"),
                        rs.getString("Nombre"),
                        rs.getString("Apellido"),
                        rs.getString("CorreoElectronico"),
                        rs.getString("Telefono"),
                        rs.getString("Direccion"),
                        rs.getString("Usuario"),
                        rs.getString("Contraseña")
                );
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener los clientes: " + e.getMessage());
            e.printStackTrace();
        }
        return clientes;
    }

    public Cliente obtenerPorId(int id) {
        String sql = "SELECT ID_Cliente, Tipo_documento, Documento, Nombre, Apellido, CorreoElectronico, Telefono, Direccion, Usuario, Contraseña FROM clientes WHERE ID_Cliente = ?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Cliente cliente = new Cliente(
                            rs.getInt("ID_Cliente"),
                            rs.getString("Tipo_documento"),
                            rs.getString("Documento"),
                            rs.getString("Nombre"),
                            rs.getString("Apellido"),
                            rs.getString("CorreoElectronico"),
                            rs.getString("Telefono"),
                            rs.getString("Direccion"),
                            rs.getString("Usuario"),
                            rs.getString("Contraseña")
                    );
                    return cliente;
                } else {
                    // Si no se encuentra ningún cliente con el ID dado, puedes devolver null o lanzar una excepción según tu preferencia.
                    return null;
                }
            }
        } catch (SQLException e) {
            System.err.println("Error al obtener el cliente por ID: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }

    public boolean eliminarCliente(int id) {
        String sql = "DELETE FROM clientes WHERE ID_Cliente = ?";
        try (Connection con = cn.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            int filasEliminadas = ps.executeUpdate();
            return filasEliminadas > 0;
        } catch (SQLException e) {
            System.err.println("Error al eliminar el cliente: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

}
