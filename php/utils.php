<?php
function isSetAndNotNull($var)
{
    return isset($var) && $var !== null;
}
function reportError()
{
    echo '<h1>Lo sentimos</h1><p>Hemos tenido un error. Intentelo mas tarde. Si el problema persiste pongase en contacto con el Webmaster</p>';
}
/*function validateParameters($tipo,$opt1,$opt2){
    if(isSetAndNotNull($tipo)){
        $filter = "/[^A-Z]+/";//This filter checks that only alphanumeric characters are accepted in GET and POST params
        switch (preg_replace($filter, "",strtoupper($tipo))) {//To avoid a repeated regular expression with lowercase the var is uppercased before filtering 
            case "PROVINCIA":
                return checkProvincia($opt1);
            case "VEGETARIANA":
            case "VEGANA":
            case "CELIACO":
            case "LIGHT":
                return true;
            case "ESPECIAL":
                return checkProvincia($opt1) && checkEspecialidad($opt2);

            default:
                return false;
        }
    }else{
        //Here is the basic code for search
    }
}*/

//Checks directly through SQL if the value is registered
//It does a null check also
function checkProvincia($var = null)
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
?>