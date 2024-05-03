/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function mostrarVehiculos() {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                document.getElementById("carouselExampleIndicators").style.display = "none";
                document.getElementById("listaVehiculos").innerHTML = xhr.responseText;
            } else {
                console.error('Error al obtener vehículos:', xhr.status, xhr.statusText);
            }
        }
    };
    xhr.open('GET', 'MostrarVehiculosServlet', true);
    xhr.send();
}



