/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.addEventListener('DOMContentLoaded', function() {
  var car = document.querySelector('.car');
  var containerWidth = document.querySelector('.container').offsetWidth; // Selecciona el contenedor correcto
  var carWidth = car.offsetWidth;
  var initialPosition = -carWidth; // Posición inicial del carro fuera del contenedor
  var finalPosition = containerWidth; // Posición final del carro fuera del contenedor

  function moveCar() {
    car.style.left = finalPosition + 'px';
    setTimeout(function() {
      car.style.left = initialPosition + 'px';
      setTimeout(moveCar, 2000); // Cambia el valor '2000' para ajustar la velocidad del movimiento
    }, 2000); // Cambia el valor '2000' para ajustar la velocidad del movimiento
  }

  moveCar();
});

