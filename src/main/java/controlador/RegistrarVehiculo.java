package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import modelo.Vehiculo;
import modelo.VehiculoDao;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@MultipartConfig // Esta anotación es necesaria para manejar formularios multipart/form-data (archivos)
public class RegistrarVehiculo extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private VehiculoDao vehiculoDao;

    @Override
    public void init() {
        vehiculoDao = new VehiculoDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // Asegura que los caracteres especiales se manejen correctamente.

        String marca = request.getParameter("marca");
        String modelo = request.getParameter("modelo");
        String anio = request.getParameter("anio");
        String precio = request.getParameter("precio");
        String estado = request.getParameter("estado");
        String descripcion = request.getParameter("descripcion");
        Part filePart = request.getPart("imagen"); // Obtiene el archivo
        String tipo = request.getParameter("tipo");

        // Define la carpeta donde se guardarán las imágenes
        String folderName = "upload";
        String uploadPath = getServletContext().getRealPath("") + folderName; // Ruta completa
        Path uploadDir = Paths.get(uploadPath);
        if (!Files.exists(uploadDir)) {
            Files.createDirectories(uploadDir); // Crea el directorio si no existe
        }

        String fileName = Path.of(filePart.getSubmittedFileName()).getFileName().toString(); // Evita el path traversal
        Path filePath = uploadDir.resolve(fileName);

        // Guarda el archivo en el servidor
        filePart.write(filePath.toString());

        // Crea un objeto Vehiculo con los datos del formulario y la imagen
        Vehiculo vehiculo = new Vehiculo();
        vehiculo.setMarca(marca);
        vehiculo.setModelo(modelo);
        vehiculo.setAnio(anio);
        vehiculo.setPrecio(precio);
        vehiculo.setEstado(estado);
        vehiculo.setDescripcion(descripcion);
        vehiculo.setTipo(tipo);
        vehiculo.setImagen(folderName + "/" + fileName); // Guarda la ruta relativa para uso en la aplicación

        // Intenta registrar el vehículo en la base de datos
        if (vehiculoDao.registrarVehiculo(vehiculo)) {
            request.setAttribute("mensaje", "Registro exitoso");
            request.getRequestDispatcher("inventario.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "Error al registrar vehículo");
            request.getRequestDispatcher("errorregistro.jsp").forward(request, response);
        }
    }
}
