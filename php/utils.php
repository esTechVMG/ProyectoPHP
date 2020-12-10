<?php
function isSetAndNotNull($var)
{
    return isset($var) && $var !== null;
}
function reportError()
{
    echo '<h1>Lo sentimos</h1><p>Hemos tenido un error. Intentelo mas tarde. Si el problema persiste pongase en contacto con el Webmaster</p>';
}

//Checks directly through SQL if the value is registered
//It does a null check also
function checkProvincia($var)
{
    include 'connection.php';
    if($connected){
        $query = $mbd->query("SELECT nombre from provincia");
        while($row = $query->fetch()){
            if($row[0] == $var){
                return true;
            }
        }
        return false;
    }else return false;
}
//Valida la especialidad
function checkEspecialidad($var = null)
{
    switch ($var) {
        case "PESCADO":
        case "MARISCO":
        case "CARNE":
        case "ARROZ":
            return true;
        default:
            return false;
    }
}
//This function parses the table received through PDO
function getRecetas(&$stmt,&$mbd):array
{
    include 'querys.php';
    $rows=[];
    $count = 0;
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $rows[$count] = $row;
        $count++;
    }
    $stmt=null;
    $recetas= [];
    foreach($rows as $row){
        $receta = new Receta();
        if(isset($row['id_receta'])){
            $receta->id = $row['id_receta'];
        }
        if(isset($row['titulo'])){
            $receta->titulo = $row['titulo'];
        }
        if(isset($row['dificultad'])){
            $receta->id = $row['dificultad'];
        }
        if(isset($row['duracion'])){
            $receta->id = $row['duracion'];
        }
        if(isset($row['comensales'])){
            $receta->id = $row['comensales'];
        }
        if(isset($row['horno'])){
            $receta->id = $row['horno'];
        }
        if(isset($row['batidora'])){
            $receta->id = $row['batidora'];
        }
        if(isset($row['microondas'])){
            $receta->id = $row['microondas'];
        }
        if(isset($row['thermomix'])){
            $receta->id = $row['thermomix'];
        }
        if(isset($row['vegana'])){
            $receta->id = $row['vegana'];
        }
        if(isset($row['vegetariana'])){
            $receta->id = $row['vegetariana'];
        }
        if(isset($row['celiacos'])){
            $receta->id = $row['celiacos'];
        }
        if(isset($row['light'])){
            $receta->id = $row['light'];
        }
        //The basic query only gives the identifiers for other tables with other relevant information
        //This searches in database and stores everything automatically.
        //It is used for main ingredients, optional ingredients and image data
        $stmtMainIng = $mbd->prepare($queryMainIngredients);
        $stmtMainIng->bindValue(":identifier",$receta->id,PDO::PARAM_STR);
        $stmtMainIng->execute();
        $ingMain=[];
        while($row = $stmtMainIng->fetch(PDO::FETCH_ASSOC)){
            $ing = new Ingrediente();
            $ing->id = $row['id_ingred'];
            $ing->nombre = $row['nombre'];
            $ing->calorias = $row['calorias_100g'];
            $ing->proteinas = $row['proteinas_100g'];
            $ing->hidratos = $row['id_ingred'];
            $ing->grasas = $row['grasas_saturadas_100g'];
            $ing->gSaturadas = $row['grasas_saturadas_100g'];
            $ing->gmInsaturadas = $row['grasas_monoinsaturadas_100g'];
            $ing->gpInsaturadas = $row['grasas_poliinsaturadas_100g'];
            $ing->sodio = $row['sodio_100g'];
            $ing->fibras = $row['fibra_100g'];

            array_push($ingMain,$ing);
        }
        $receta->ingPrincipales = $ingMain;

        $stmtOptIng = $mbd->prepare($queryOptionalIngredients);
        $stmtOptIng->bindValue(':identifier',$receta->id,PDO::PARAM_STR);
        $stmtOptIng->execute();
        $ingOpt=[];
        while($row = $stmtOptIng->fetch(PDO::FETCH_ASSOC)){
            $ing = new Ingrediente();
            $ing->id = $row['id_ingred'];
            $ing->nombre = $row['nombre'];
            $ing->calorias = $row['calorias_100g'];
            $ing->proteinas = $row['proteinas_100g'];
            $ing->hidratos = $row['id_ingred'];
            $ing->grasas = $row['grasas_saturadas_100g'];
            $ing->gSaturadas = $row['grasas_saturadas_100g'];
            $ing->gmInsaturadas = $row['grasas_monoinsaturadas_100g'];
            $ing->gpInsaturadas = $row['grasas_poliinsaturadas_100g'];
            $ing->sodio = $row['sodio_100g'];
            $ing->fibras = $row['fibra_100g'];
            array_push($ingOpt,$ing);
        }
        $receta->ingOpcionales = $ingOpt;
        $stmtImg = $mbd->prepare($queryImages);
        $stmtImg->bindValue(':identifier',$receta->id,PDO::PARAM_STR);
        $stmtImg->execute();
        $imageList = [];
        while($row = $stmtImg->fetch(PDO::FETCH_ASSOC)){
            $image = new Image();
            $image->id = $row['id_imag'];
            $image->name = $row['id_imag'];
            $image->location = $row['ruta'];
            $image->width = $row['ancho'];
            $image->height = $row['alto'];
            $image->description = $row['descripcion'];
            $image->ing_id = $row['ingrediente_id_ingred'];
            $image->id_receta = $row['receta_id_receta'];
            $image->id_rest = $row['restaurante_id_rest'];
            array_push($imageList,$image);
        }
        $receta->images = $imageList;
        array_push($recetas,$receta);
    }
    //Sanitize before exit
    $stmt=null;
    $mbd=null;
    return $recetas;
}
//Crea un <div> con la informacion de una receta
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

?>