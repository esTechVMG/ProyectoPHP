<?php
include_once '../php/utils.php';
include_once '../php/connection.php';
include_once 'Receta/Receta.php';
include_once 'Receta/Ingrediente.php';
include_once 'Receta/Imagen.php';
if($connected){
    include_once '../php/querys.php';
    $stmt = $mbd->prepare($queryLastFive);
    $stmt->execute();
    $recetas = getRecetas($stmt,$mbd);
    //Close connection
    $mbd == null;
}else{
    reportError();
}
$c=0;
foreach ($recetas as $receta){
    echo '<li><a href="mostrarDBrecetas.php?ultimasrecetas=' . ++$counter . '">' . $receta->titulo . '</a></li>';
}
?>
