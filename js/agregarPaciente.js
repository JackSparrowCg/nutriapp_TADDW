var loader = document.getElementById('loader');


function agregarUsuario(e) {
    e.preventDefault();

    var peticion = new XMLHttpRequest();
    peticion.open('POST', 'controladores/agregarPaciente.php');

    usuario_nombre = formulario.nombre.value.trim();
    usuario_paterno = formulario.paterno.value.trim();
    usuario_materno = formulario.materno.value.trim();
    usuario_edad = parseInt(formulario.edad.value.trim());
    usuario_estatura = parseInt(formulario.estatura.value.trim());
    usuario_correo = formulario.correo.value.trim();
    usuario_celular = parseInt(formulario.celular.value.trim());
   


    if (formulario_valido()) {
        error_box.classList.remove('active');
        var parametros = 'nombre=' + usuario_nombre + '&paterno=' + usuario_paterno + '&materno=' + usuario_materno + '&edad=' + usuario_edad + '&estatura=' + usuario_estatura + '&correo=' + usuario_correo + '&celular=' + usuario_celular ;

        peticion.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

        loader.classList.add('active');

        peticion.onload = function () {

            formulario.nombre.value = '';
            formulario.paterno.value = '';
            formulario.materno.value = '';
            formulario.edad.value = '';
            formulario.estatura.value = '';
            formulario.correo.value = '';
            formulario.celular.value = '';
            
            agregado.classList.add('active');
            agregado.innerHTML = 'Paciente agregado';
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

formulario.addEventListener('submit', function (e) {
    agregarUsuario(e);
});



function formulario_valido() {
    if (usuario_nombre == '') {
        return false;
    } else if (usuario_paterno == '') {
        return false;
    } else if (usuario_materno == '') {
        return false;
    } else if (usuario_edad == '') {
        return false;
    } else if (usuario_estatura == '') {
        return false;
    } else if (usuario_correo == '') {
        return false;
    } else if (usuario_celular == '' ) {
        return false;
    } 

    return true;
}