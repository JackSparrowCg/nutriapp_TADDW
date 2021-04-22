<?php

require_once "DAO/DbCrud.php";
error_reporting(0);
header('Content-type: application/json; charset=utf-8');


$nombr = $_POST['nombre'];


$sel = new DbCrud();
$resultados = $sel->select("alimento", array("nombre"), "'" .$nombr. "'");


foreach ($resultados as $key => $value) {

    $arr_data[] = $value;
}
$jsondata = json_encode($arr_data);

echo $jsondata;
