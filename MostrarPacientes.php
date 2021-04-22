<?php require_once "head.php"; ?>
<body>
    <div class="contenedor">
        <?php require_once "header.php"; ?>
        <section id="seccion4" class="fila">
            <?php require_once "accesosRapidos.php"; ?>
            <div class="wrap">
                <header>
                    <h1>Pacientes</h1>
                    <div>
                        <button id="btn_cargar" class="btn active">Mostrar Pacientes</button>
                    </div>
                </header>
                <main>
                    <form  id="formulario" class="formulario">
                        <input type="text" name="nombre" id="nombre" placeholder="Nombre">
                        <button type="submit" class="btn">Buscar</button>
                    </form>
                    <div class="error_box" id="error_box">
                        <p>Se ha producido un error.</p>
                    </div>
                    <table id="tabla" class="tabla">
                        <tbody id="tbody">

                        </tbody>
                    </table>

                    <div class="loader" id="loader"></div>
                </main>
            </div>
        </section>
        <section id="seccion6" class="fila">
            <div class="error_box" id="agregado">
                <p>Paciente Agregado.</p>
            </div>

        </section>
        <script src="js/mostrarPaciente.js"></script>
        <?php require_once "footer.php"; ?>