<?php
function displayRecetas($recetas)
{
    include_once 'Receta/Receta.php';
    include_once 'Receta/Ingrediente.php';
    include_once 'Receta/Imagen.php';
    if(isset($recetas) && !is_null($recetas)){
        foreach($recetas as $receta){
            echo '' 
            .   '<div>'
            .       '<h2>' . $receta->titulo .'</h2>'
            .       '<p>Numero de comensales:' . $receta->comensales . '</p>'
            .       '<p>' . $receta->preparacion . '</p>'
            .   '</div>'
            ;
            
        }
    }
}
include_once 'Receta/Receta.php';
include_once 'Receta/Ingrediente.php';
include_once 'Receta/Imagen.php';
include_once 'utils.php';
//Check present variables
if (isSetAndNotNull($_GET['tipo'])) {
    $tipo = strtoupper($_GET['tipo']);
    include 'connection.php';
    switch ($tipo) {
        case "PROVINCIA":
            $provincia = $_POST['selectprov'];
            if (checkProvincia($provincia)) {
                if ($connected) {
                    include 'querys.php';
                    $stmt = $mbd->prepare($queryProvincia);
                    $stmt->bindParam(1, $provincia);
                    $stmt->execute();
                    $recetas = getRecetas($stmt, $mbd);
                    displayRecetas($recetas);
                }
            } else {
                reportError();
            }
            break;
        case "VEGETARIANA":
        case "VEGANA":
        case "CELIACOS":
        case "LIGHT":
            //This is a bit hacky but saves some time in reworking the code.
            //Also, it should be secure to use the string directly since the string is checked by the switch
            $stmt = $mbd->query('SELECT * FROM receta where ' . strtolower($tipo) . ' = 1');
            $recetas = getRecetas($stmt, $mbd);
            displayRecetas($recetas);
            //var_dump($recetas);
            break;
        case "ESPECIAL":
            $provincia = $_POST['selectprov2'];
            $especialidad = $_POST['selectesp'];
            if (
                checkProvincia($provincia) &&
                checkEspecialidad($especialidad)
            ) {
                //
            } else {
                reportError();
            }
            break;
        case "ULTIMASRECETAS":
            //This request is for displaying only one item.
            $identifier=intval($_GET['id']);
            if(is_int($identifier) &&  (1 <= $identifier) && ($identifier <= 5)){
                $stmt = $mbd->prepare($queryLastFive);
                $stmt->execute();
                $recetas = getRecetas($stmt,$mbd);
                displayRecetas(array($recetas[$identifier]));
                
            }else{
                reportError();
            }
            break;
        default:
            //It should not be here as we check valid values before
            reportError();
            break;            
}
$stmt=null;
$mbd=null;
} else {
    //Here is supposed to be the code for the search engine
}
?>