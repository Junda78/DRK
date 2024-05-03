/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import modelo.ClienteDao;

/**
 *
 * @author juand
 */
@WebServlet(name = "ListaClientesServlet", urlPatterns = {"/listaClientes"})
public class ListaClientesServlet extends HttpServlet {

  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    try {
        ClienteDao clienteDao = new ClienteDao();
        request.setAttribute("listaClientes", clienteDao.listaClientes());
        request.getRequestDispatcher("clientes.jsp").forward(request, response);
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("errorMessage", "Error al procesar la solicitud: " + e.getMessage());
        request.getRequestDispatcher("errorPage.jsp").forward(request, response);
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
        return "Short description";
    }
}

