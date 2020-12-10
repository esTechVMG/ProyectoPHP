<?php
try{
    $mbd = new PDO('mysql:host=localhost;dbname=bd_recetas', "root", "1234",array(
        PDO::ATTR_PERSISTENT => true
    ));
    $connected = true;
}catch(Exception $e){
    //die("Lo lamentamos. No se pudo conectar con la base de datos:" . $e->getMessage());
    $connected = false;
}
?>