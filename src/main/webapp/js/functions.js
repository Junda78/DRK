/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
$('.carousel').carousel({
    interval: 10000
});

function showVehicleInfo() {
    // Lógica para mostrar la información del vehículo
    var vehicleInfo = "Modelo: Ford Mustang <br> Año: 2022 <br> Color: Rojo <br> Precio: $50,000";
    document.getElementById('vehicleInfo').innerHTML = vehicleInfo;
    $('#vehicleModal').modal('show');
}

function compareWithOther() {
    // Lógica para redirigir al cliente a la página de comparación de vehículos
    window.location.href = 'compararVehiculos.jsp';
}


