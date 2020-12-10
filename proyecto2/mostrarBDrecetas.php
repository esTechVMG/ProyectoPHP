<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Andaluc&iacute;a en tu mesa</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css" />
    <meta name="keywords" content="<?php /*parametro_plantilla("keywords");*/ ?>" />
</head>

<body>

    <?php include_once("cabecera.php"); ?>
    <?php include_once("menu.php"); ?>
    <?php include_once("col_izq.php"); ?>
    <div style="width:700px;overflow: hidden;">
    </div>
    <div>
        <div>
            <form method="GET" action="mostrarBDrecetas.php">
                <label for="ingredientes">Que contenga:</label>
                <input type="text" name="ingredientes" id="ingredientes">
                <label for="noingredientes">Que no contenga:</label>
                <input type="text" name="noingredientes" id="noingredientes">
                <button type="submit" name="buscar" value="1">BUSCAR</button>
            </form>
        </div>
        <div>
            <?php include_once("../php/search.php") ?>
        </div>


        <?php include_once("pie.php"); ?>
</body>

</html>