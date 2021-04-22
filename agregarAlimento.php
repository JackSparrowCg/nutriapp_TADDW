<?php require_once "head.php"; ?>
<body>
    <div class="contenedor">
        <?php require_once "header.php"; ?>
        <section id="seccion4" class="fila">

            <?php require_once "accesosRapidos.php" ?>
            <div class="wrap">
                <form  id="formulario" class="col-lg-12 col-md-12 col-sm-12 col-xs-12" action="Alimentos.php">
                    <h1>Alimento</h1>
                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="* Nombre:" >
                    <textarea name="descripcion" class="form-control" id="descripcion" placeholder="* Descripción:"></textarea>
                    <input type="text" class="form-control" name="cantidad" id="cantidad" placeholder="* Cantidad:" >
                    <br><br>
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
        <script src="js/agregarAlimento.js"></script>
        <?php require_once "footer.php" ?>