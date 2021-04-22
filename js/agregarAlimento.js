var cargarTipo = document.getElementById('cantidad');
var tab;
var agregar;
 var cargar = true;
function cargarTipoPorcion() {


    var peticion = new XMLHttpRequest();
    peticion.open('POST', 'controladores/cargarTipoPorcion.php');

    loader.classList.add('active');

    peticion.onload = function () {


        var datos = JSON.parse(peticion.responseText);


        if (datos.error) {
            error_box.classList.add('active');
        } else {

            var element = document.createElement('select');
            element.setAttribute("class", "caja");
            element.setAttribute("id", "tipoPor");
            element.setAttribute("name", "tipoPor");


            //formulario.innerHTML += "<h4 for=\"atributoFK\">atributoFK:</h4>";
            for (var j = 0; j < datos.length; j++) {
                var i = j + 1;
                element.innerHTML += "<option value=" + i + ">" + datos[j].nombre + "</option>";
                console.log(i);
                formulario.appendChild(element);

            }
            tab = element.value;
            var crear = true;
            element.addEventListener('click', function () {
                if (crear) {

                    console.log("tab" + tab);

                    agregar = document.createElement('input');
                    agregar.setAttribute("type", "submit");
                    agregar.setAttribute("class", "form-control");
                    agregar.setAttribute("name", "submit");
                    agregar.setAttribute("value", "Agregar");

                    formulario.appendChild(agregar);
                    crear = false;


                }
            }, false);
        }

    }

    peticion.onreadystatechange = function () {
        if (peticion.readyState == 4 && peticion.status == 200) {
            loader.classList.remove('active');
        }
    }

    peticion.send();
}

function agregarAlimento(e) {
    e.preventDefault();

    var peticion = new XMLHttpRequest();
    peticion.open('POST', 'controladores/agregarAlimento.php');

    alimento_nombre = formulario.nombre.value.trim();
    alimento_descripcion = formulario.descripcion.value.trim();
    alimento_cantidad = parseInt(formulario.cantidad.value.trim());

    if (formulario_valido()) {
        error_box.classList.remove('active');
        var parametros = 'nombre=' + alimento_nombre + '&descripcion=' + alimento_descripcion + '&cantidad=' + alimento_cantidad + '&tipo=' + tab;

        peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        loader.classList.add('active');

        peticion.onload = function () {
            //mostrar();
            formulario.nombre.value = '';
            formulario.descripcion.value = '';
            formulario.cantidad.value = '';

            agregado.classList.add('active');
            agregado.innerHTML = 'Alimento agregado';


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


cargarTipo.addEventListener('click', function () {
    
      if (cargar) {
        
        cargarTipoPorcion();
          
          
          
          
           cargar = false;
          
      }
},false);
formulario.addEventListener('submit', function (e) {
    agregarAlimento(e);
});



function formulario_valido() {
    if (alimento_nombre == '') {
        return false;
    } else if (alimento_descripcion == '') {
        return false;
    } else if (alimento_cantidad == '') {
        return false;
    }

    return true;
}