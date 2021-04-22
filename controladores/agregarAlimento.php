<?php
require_once "DAO/DbCrud.php";
error_reporting(0);
header('Content-type: application/json; charset=utf-8');

$nombre = $_POST['nombre'];
$descripcion = $_POST['descripcion'];
$cantidad = (int)$_POST['cantidad'];
$tipo = (int)$_POST['tipo'];

echo "tipo".$tipo;

$alimentos  = array("id"                 =>         rand(),
                    "nombre"             =>         $nombre,
                    "descripcion"        =>         $descripcion,
                    "id_porcion"         =>         $cantidad,
                    "id_tipo_porcion"    =>         $tipo
                ); 
                var_dump($alimentos);

$insert = new DbCrud();
  $response = $insert->save("alimento",$alimentos);
  if($response == null){
  echo "No se insertaron los datoos a la DB";
  }else{
  
  echo "Datos insertados correctamnete";
  
  }