function comparar() {
    var vehiculosSeleccionados = [];
    var compararButtons = document.querySelectorAll('.comparar-btn');

    compararButtons.forEach(function (button) {
        button.addEventListener('click', function () {
            var vehiculoID = this.getAttribute('data-id');
            var index = vehiculosSeleccionados.indexOf(vehiculoID);

            if (index === -1) {
                vehiculosSeleccionados.push(vehiculoID);
                console.log('Vehículo seleccionado para comparar: ' + vehiculoID);
            } else {
                vehiculosSeleccionados.splice(index, 1);
                console.log('Vehículo deseleccionado para comparar: ' + vehiculoID);
            }

            actualizarInterfazUsuario();
        });
    });

    function actualizarInterfazUsuario() {
        compararButtons.forEach(function (button) {
            var vehiculoID = button.getAttribute('data-id');

            if (vehiculosSeleccionados.indexOf(vehiculoID) !== -1) {
                button.classList.add('btn-primary');
            } else {
                button.classList.remove('btn-primary');
            }
        });
    }
}

document.addEventListener("DOMContentLoaded", comparar);
