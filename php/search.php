<?php
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
                            foreach($rows as $row){
                                $id = $row['id_receta'];
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
                                
                                $stmtMainIng = $mbd->prepare($queryMainIngredients);
                                $stmtMainIng->bindValue(":identifier",$id,PDO::PARAM_STR);
                                $stmtMainIng->execute();
                                while($row = $stmtMainIng->fetch(PDO::FETCH_ASSOC)){
                                    var_dump($row);
                                }
                                $stmtOptIng = $mbd->prepare($queryOptionalIngredients);
                                $stmtOptIng->bindValue(':identifier',$id,PDO::PARAM_STR);
                                $stmtOptIng->execute();
                                while($row = $stmtOptIng->fetch(PDO::FETCH_ASSOC)){
                                    var_dump($row);
                                }
                                $stmtImg = $mbd->prepare($queryImages);
                                $stmtImg->bindValue(':identifier',$id,PDO::PARAM_STR);
                                $stmtImg->execute();
                                while($row = $stmtImg->fetch(PDO::FETCH_ASSOC)){
                                    var_dump($row);
                                }
                            }
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