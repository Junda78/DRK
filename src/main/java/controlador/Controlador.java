/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class Controlador extends HttpServlet {
   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String accion=request.getParameter("accion");
        switch(accion){
            case "paginaPrincipal":
                request.getRequestDispatcher("paginaPrincipal.jsp").forward(request, response);

                break;
            default :
                throw new AssertionError();
        }
   }
}
