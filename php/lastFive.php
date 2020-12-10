<?php
include_once '../php/utils.php';
include_once '../php/connection.php';
include_once '../php/Receta/Receta.php';
include_once '../php/Receta/Ingrediente.php';
include_once '../php/Receta/Imagen.php';
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

