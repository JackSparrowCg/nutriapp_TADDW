<?php require_once "head.php"; ?>
<body>

    <div class="contenedor">
        <?php require_once "header.php"; ?>

            <section id="seccion4" class="fila">
               
                <?php require_once "accesosRapidos.php"?>
                <div class="wrap">
                    <header>
                        <h1>Alimentos</h1>
                        <div>
                            <button id="btn_cargar" class="btn active">Mostrar Alimentos</button>
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
            <!--=====================================
            SECCION 5
            ======================================-->
            <script src="js/mostrarAlimento.js"></script>
            <?php require_once "footer.php"?>