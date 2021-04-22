var btn_cargar = document.getElementById('btn_cargar'),
        error_box = document.getElementById('error_box'),
        tabla = document.getElementById('tabla'),
        loader = document.getElementById('loader');


function cargarAlimento() {
    tabla.innerHTML = '<th>Nombre</th>';

    var peticion = new XMLHttpRequest();
    peticion.open('POST', 'controladores/cargarAlimentos.php');

    loader.classList.add('active');

    peticion.onload = function () {

        var datos = JSON.parse(peticion.responseText);


        if (datos.error) {
            error_box.classList.add('active');
        } else {

            for (var i = 0; i < datos.length; i++) {
                var elemento = document.createElement('tr');
                var element = document.createElement('td');
                var elemen = document.createElement('td');


                //console.log("PARAMETROS"+par);
                element.innerHTML += "<a href=#>" + datos[i].nombre + "</a>";
                element.setAttribute("data-valor", "\"" + new String(datos[i].nombre) + "\"");
                nbd = "\"paciente" + i + "\"";
                //console.log(nbd); 
                element.setAttribute("id", nbd);
                elemento.appendChild(element);
                tabla.appendChild(elemento);


            }
        }

    }

    peticion.onreadystatechange = function () {
        if (peticion.readyState == 4 && peticion.status == 200) {
            loader.classList.remove('active');
        }
    }

    peticion.send();
}
function  mostrarBusqueda(datos) {

    loader.classList.add('active');

    if (datos == null) {

        var ele = document.createElement('h1');
        ele.innerHTML += "Ningun Alimento con ese nombre";
        tabla.appendChild(ele);
        loader.classList.remove('active');

    } else {
        tabla.innerHTML = '<th>Nombre</th>';

        for (var i = 0; i < datos.length; i++) {
            var elemento = document.createElement('tr');
            var element = document.createElement('td');


            element.innerHTML += "<a href=\"/perfilPaciente.php\">" + datos[i].nombre + "</a>";
            element.setAttribute("data-valor", "\"" + new String(datos[i].nombre) + "\"");
            nbd = "\"paciente" + i + "\"";
            //console.log(nbd); 
            element.setAttribute("id", nbd);
            elemento.appendChild(element);
            tabla.appendChild(elemento);
        }
    }




    peticion.send();


}


function buscar(e) {
    e.preventDefault();

    var peticion = new XMLHttpRequest();
    peticion.open('POST', 'controladores/buscarAlimento.php');

    alimento_nombre = formulario.nombre.value.trim();


    if (formulario_valido()) {
        error_box.classList.remove('active');

         var parametros = 'nombre=' + alimento_nombre;
        peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        loader.classList.add('active');

        peticion.onload = function () {
            var datos = JSON.parse(peticion.responseText);
            mostrarBusqueda(datos);
            formulario.nombre.value = '';
            loader.classList.remove()('active');
        }

        peticion.onreadystatechange = function () {
            if (peticion.readyState == 4 && peticion.status == 200) {
                loader.classList.remove('active');
            }
        }

        peticion.send(parametros);


    } else {
        error_box.classList.add('active');
        error_box.innerHTML = 'Por favor completa el formulario correctamente';
    }
}

btn_cargar.addEventListener('click', function () {
    cargarAlimento();
});
var ejecutar = true;
formulario.addEventListener('submit', function (e) {
    if (ejecutar) {
        buscar(e);
        ejecutar = false;
    }
}, false);



function formulario_valido() {
    if (alimento_nombre == '') {
        return false;
    }

    return true;
}