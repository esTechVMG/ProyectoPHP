<?php
include_once 'Receta/Receta.php';
include_once 'Receta/Ingrediente.php';
include_once 'Receta/Imagen.php';
include_once 'utils.php';
//Check present variables
$recetas=null;
if (isSetAndNotNull($_GET['tipo'])) {
    $tipo = strtoupper($_GET['tipo']);
    include 'connection.php';
    switch ($tipo) {
        case "PROVINCIA":
            //Check the POST data;
            $provincia = isset($_POST['selectprov'])? $_POST['selectprov']:null ; //Check for POST data existence
            if (checkProvincia($provincia)) { //Validates the data
                if ($connected) {//Checks connection with db
                    include 'querys.php';//get querys
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
            //Also, it should be secure to use the string directly since this string is the trigger for this case in the switch
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
            if(
                is_int($identifier) &&
                ($identifier >= 1) && //variable bounds
                ($identifier <= 5)){  //    1-5
                //the GET returns a 1-5 range but the code uses 0-4
                $identifier--;
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
} else {
    reportError();
    //Here is supposed to be the code for the search engine
}
?>