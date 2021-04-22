var btn_cargar = document.getElementById('btn_cargar'),
        error_box = document.getElementById('error_box'),
        tabla = document.getElementById('tabla'),
        loader = document.getElementById('loader');


function cargarPaciente() {
    tabla.innerHTML = '<th>Nombre</th><th>Email</th>';

    var peticion = new XMLHttpRequest();
    peticion.open('POST', 'controladores/cargarPacientes.php');

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
                var par = datos[i].nombre;
                var correo = datos[i].email;
                //console.log("PARAMETROS"+par);
                element.innerHTML += "<a href=\"perfilPaciente.php\">" + datos[i].nombre + "    " + datos[i].apellido_paterno + "</a>";
                element.setAttribute("data-valor", "\"" + new String(datos[i].nombre) + "\"");
                nbd = "\"paciente" + i + "\"";
                //console.log(nbd); 
                element.setAttribute("id", nbd);
                elemento.appendChild(element);
                tabla.appendChild(elemento);

                elemen.innerHTML += "<a href=\"perfilPaciente.php\">" + datos[i].email + "</a>";
                elemen.setAttribute("data-valor", "\"" + new String(datos[i].email) + "\"");
                nbd = "\"email" + i + "\"";
                //console.log(nbd); 
                element.setAttribute("id", nbd);


                elemento.appendChild(elemen);
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
        ele.innerHTML += "Ningun Paciente con ese nombre";
        tabla.appendChild(ele);
        loader.classList.remove('active');

    } else {
        loader.classList.remove('active');
        tabla.innerHTML = '<th>Nombre</th><th>Email</th>';

        for (var i = 0; i < datos.length; i++) {
            var elemento = document.createElement('tr');
            var element = document.createElement('td');
            var elemen = document.createElement('td');
            var par = datos[i].nombre;
            var correo = datos[i].email;
            //console.log("PARAMETROS"+par);
            element.innerHTML += "<a href=\"/perfilPaciente.php\">" + datos[i].nombre + "    " + datos[i].apellido_paterno + "</a>";
            element.setAttribute("data-valor", "\"" + new String(datos[i].nombre) + "\"");
            nbd = "\"paciente" + i + "\"";
            //console.log(nbd); 
            element.setAttribute("id", nbd);
            elemento.appendChild(element);
            tabla.appendChild(elemento);

            elemen.innerHTML += "<a href=\"/perfilPaciente.php \">" + datos[i].email + "</a>";
            elemen.setAttribute("data-valor", "\"" + new String(datos[i].email) + "\"");
            nbd = "\"email" + i + "\"";
            //console.log(nbd); 
            element.setAttribute("id", nbd);


            elemento.appendChild(elemen);
            tabla.appendChild(elemento);


        }
    }




    peticion.send();


}

function buscar(e) {
    e.preventDefault();

    var peticion = new XMLHttpRequest();
    peticion.open('POST', 'controladores/buscarPaciente.php');

    paciente_nombre = formulario.nombre.value.trim();


    if (formulario_valido()) {
        error_box.classList.remove('active');
        var parametros = 'nombre=' + paciente_nombre;
        console.log(paciente_nombre);
        peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        loader.classList.add('active');

        peticion.onload = function () {
            var datos = JSON.parse(peticion.responseText);
            mostrarBusqueda(datos);
            formulario.nombre.value = '';
        }

        peticion.onreadystatechange = function () {
            if (peticion.readyState == 4 && peticion.status == 200) {
                loader.classList.remove('active');
            }
        }
        console.log("parametros" + parametros);
        peticion.send(parametros);


    } else {
        error_box.classList.add('active');
        error_box.innerHTML = 'Por favor completa el formulario correctamente';
    }
}

btn_cargar.addEventListener('click', function () {
    cargarPaciente();
});
var ejecutar = true;
formulario.addEventListener('submit', function (e) {
    if (ejecutar) {
        buscar(e);
        ejecutar = false;
    }
}, false);



function formulario_valido() {
    if (paciente_nombre == '') {
        return false;
    }

    return true;
}