<?php   
include_once 'Receta/Receta.php';
include_once 'Receta/Ingrediente.php';
include_once 'Receta/Imagen.php';
include_once 'connection.php';
include_once 'utils.php';
include_once 'querys.php';
//Check present variables
if (isSetAndNotNull($_GET['tipo'])) {
    $tipo = strtoupper($_GET['tipo']);
    switch ($tipo) {
        case "PROVINCIA":
            $provincia = $_POST['selectprov'];
            if (checkProvincia($provincia)) {
                if ($connected) {

                    $stmt = $mbd->prepare($queryProvincia);
                    $stmt->bindParam(1, $provincia);
                    $stmt->execute();
                    $recetas = getRecetas($stmt, $mbd);
                    var_dump($recetas);
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
            var_dump($recetas);
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
        case "LASTNUMBER":
            $identifier=$_POST['identifier'];
            if(is_int($identifier) &&  (1 <= $identifier) && ($identifier <= 5)){
                $stmt = $mbd->prepare($queryFromID);
                $stmt->bindParam(1,$identifier);
                $stmt->execute();
                $recetas = getRecetas($stmt,$mbd);
                //This query only receives only one item
                $receta = $receta[0];
                
            }else{
                reportError();
            }
            
        default:
            //It should not be here as we check valid values before
            reportError();
            break;
    }
} else {
    //Here is supposed to be the code for the search engine
}
?>