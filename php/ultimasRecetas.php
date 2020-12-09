<?php
include_once 'utils.php';
include_once 'connection.php';
if($connected){
    $stmt = $mbd->query("SELECT titulo FROM receta ORDER BY fecha ASC LIMIT 5");
    //$stmt = $dbh->prepare("SELECT titulo FROM receta ORDER BY fecha ASC LIMIT 5");
    ?>
    <ul>
    <?php
    while($row = $stmt->fetch()){
        echo "<li>$row[0]</li>";
    }
    ?>
    </ul>
    <?php
    //Close connection
    $mbd == null;
}else{
    reportError();
}
?>