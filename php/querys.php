<?php
//Obtiene todo sobre la tabla recetas y que coincida con la provincia indicada
$queryProvincia='SELECT y.* FROM (SELECT nombre,receta_id_receta FROM provincia INNER JOIN receta_provincia ON provincia.id_provincia = receta_provincia.provincia_id_provincia) AS x INNER JOIN receta AS y ON x.receta_id_receta=y.id_receta WHERE nombre = ?';
//For the secondary info queries are made using id_receta as identifier
$queryMainIngredients = 'SELECT x.* FROM ingrediente AS x INNER JOIN ingredientes_principales AS y ON x.id_ingred=y.id_ingred WHERE y.id_receta = :identifier';
$queryOptionalIngredients = 'SELECT x.* FROM ingrediente AS x INNER JOIN ingredientes_opcionales AS y ON x.id_ingred=y.id_ingred WHERE y.id_receta = :identifier';
$queryImages = 'SELECT * FROM imagen WHERE receta_id_receta = :identifier';
$queryFromID = 'SELECT * FROM receta WHERE id_receta = ?';
$queryLastFive = "SELECT titulo FROM receta ORDER BY fecha ASC LIMIT 5";
?>
