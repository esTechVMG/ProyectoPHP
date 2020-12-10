<?php
include '../php/lastFive.php';
$c=0;
foreach ($recetas as $receta){
    echo '<li><a href="mostrarBDrecetas.php?tipo=ultimasrecetas&id=' . ++$c . '">' . $receta->titulo . '</a></li>';
}
?>