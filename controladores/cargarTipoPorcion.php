<?php

require_once "DAO/DbCrud.php";
error_reporting(0);
header('Content-type: application/json; charset=utf-8');

$sel = new DbCrud();
$resultados = $sel->select("tipo_porcion", array("nombre"));


foreach($resultados as $key => $value) {
          
              $arr_data[] = $value;
          
}
 $jsondata = json_encode($arr_data);
 echo $jsondata;