<?php require_once "head.php"; ?>
<body>

    <div class="contenedor">
        <?php require_once "header.php"; ?>

        <div class="wrap">
            
            <form >

                <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Nombre:" >

                <input type="text" class="form-control" name="correo" id="correo" placeholder="Correo:" >

                <textarea name="mensaje" class="form-control" id="mensaje" placeholder="Mensaje:"></textarea>


                <input type="submit" name="submit" class="btn btn-primary" value="Enviar Correo">
            </form>
        </div>
    </body>
  <?php require_once "footer.php"?>