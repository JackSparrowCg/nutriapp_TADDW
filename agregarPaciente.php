<?php require_once "head.php"; ?>
<body>

    <div class="contenedor">
        <?php require_once "header.php"; ?>


            <section id="seccion4" class="fila">
                <?php require_once "accesosRapidos.php"?>
                <div class="wrap">
                    <form id="formulario" class="col-lg-12 col-md-12 col-sm-12 col-xs-12">


                        <input type="text" class="form-control" name="nombre" id="nombre" placeholder="* Nombre:" >
                        <input type="text" class="form-control" name="paterno" id="paterno" placeholder="* Apellido Paterno:" >
                        <input type="text" class="form-control" name="materno" id="materno" placeholder="Apellido Materno:" >
                        <input type="text" class="form-control" name="edad" id="edad" placeholder="* Edad:" >
                        <input type="text" class="form-control" name="estatura" id="estatura" placeholder="* Estatura:" >
                        <input type="text" class="form-control" name="celular" id="celular" placeholder="* Celular :" >
                        <input type="text" class="form-control" name="correo" id="correo" placeholder="* Correo:" >
                       

                        <input type="submit" name="submit" class="btn btn-primary" value="Agregar">
                        <p>* Campos obligatorios</p>
                    </form>
                 
                    <div class="error_box" id="error_box">
                        <p>Se ha producido un error.</p>
                    </div>
                    <div class="loader" id="loader"></div>
                </div>
                

                <aside id="der" class="col-lg-3 col-md-3 col-sm-3 col-xs-12" >
                    
                    

                    <form>

                        <input type="text" placeholder="Buscar">

                        

                        <input type="submit" value="Buscar">

                    </form>

                </aside>


            </section>
            <section id="seccion6" class="fila">
                <div class="error_box" id="agregado">
                    <p>Paciente Agregado.</p>
                </div>
      
            </section>
        <script src="js/agregarPaciente.js"></script>
<?php require_once "footer.php"?>