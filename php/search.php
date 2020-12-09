<?php
        include_once 'Receta/Receta.php';
        include_once 'Receta/Ingrediente.php';
        include_once 'Receta/Imagen.php';
        include_once 'connection.php';
        include_once 'utils.php';
        include_once 'querys.php';
        //Check present variables
        if(isSetAndNotNull($_GET['tipo'])){
            $tipo = strtoupper($_GET['tipo']);
            switch ($tipo) {
                case "PROVINCIA":
                    $provincia = $_POST['selectprov'];
                    if(checkProvincia($provincia)){
                        if($connected){
                            
                            $stmt = $mbd->prepare($queryProvincia);
                            $stmt->bindParam(1,$provincia);
                            $stmt->execute();
                            $rows=[];
                            $count = 0;
                            while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                                $rows[$count] = $row;
                                $count++;
                            }
                            $stmt=null;
                            $recetas=array();
                            foreach($rows as $row){
                                $receta = new Receta();
                                $receta->id = $row['id_receta'];
                                $receta->titulo = $row['titulo'];
                                $receta->dificultad = $row['dificultad'];
                                $receta->tiempoPrep = $row['duracion'];
                                $receta->nComensales = $row['comensales'];
                                $receta->horno = $row['horno'];
                                $receta->batidora = $row['batidora'];
                                $receta->microondas = $row['microondas'];
                                $receta->thermomix = $row['thermomix'];
                                $receta->vegana = $row['vegana'];
                                $receta->vegetariana = $row['vegetariana'];
                                $receta->celiacos = $row['celiacos'];
                                $receta->light = $row['light'];
                                
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
                                
                                /*echo '<div>';
                                
                                    echo "<h1>" . $row['titulo'] ."</h1>";
                                    echo '<strong>Ingredientes Principales</strong>';
                                    

                                echo '</div>';*/

                            }
                            var_dump($recetas);
                        }
                    }else{
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
                    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
                        echo '<div>' .
                        //$row['id_receta'] . '<br>' . //Do not show on production
                        $row['titulo'] . '<br>' .
                        $row['duracion'] . '<br>' .
                        $row['dificultad'] . '<br>' .
                        $row['preparacion'] . '<br>' .
                        $row['horno'] . '<br>' .
                        $row['batidora'] . '<br>' .
                        $row['microondas'] . '<br>' .
                        $row['thermomix'] . '<br>' .
                        $row['celiacos'] . '<br>' .
                        $row['light'] . '<br>' .
                        $row['vegetariana'] . '<br>' .
                        $row['vegana'] . '<br>' .
                        //$row['validada'] . '<br>' . //Do not show on production
                        $row['fecha'] . '<br>' .
                        $row['comensales'] . '<br>' .
                        '</div>';
                        
                    }
                    break;
                case "ESPECIAL":
                    $provincia = $_POST['selectprov2'];
                    $especialidad = $_POST['selectesp'];
                    if(
                        isSetAndNotNull($provincia) && 
                        isSetAndNotNull($especialidad) && 
                        checkProvincia($provincia) &&
                        checkEspecialidad($especialidad)
                    ){
                        //
                    }else{
                        reportError();
                    }
                    break;

                default:
                //It should not be here as we check valid values before
                reportError();
                    break;
            }
        }else{
            //Here is supposed to be the code for the search engine
        }
        $mbd = null;
?>