<?php
require_once "DAO/DbCrud.php";
error_reporting(0);
header('Content-type: application/json; charset=utf-8');

$sel = new DbCrud();
$resultados = $sel->select("alimento", array("nombre"));

//var_dump($resultados);

foreach($resultados as $key => $value) {
          
              $arr_data[] = $value;
          
}
//var_dump($arr_data);

 $jsondata = json_encode($arr_data);
 
 echo $jsondata;