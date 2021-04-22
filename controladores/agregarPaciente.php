<?php
require_once "DAO/DbCrud.php";
error_reporting(0);
header('Content-type: application/json; charset=utf-8');

$nombre = $_POST['nombre'];
$paterno = $_POST['paterno'];
$materno = $_POST['materno'];
$edad = $_POST['edad'];
$estatura = $_POST['estatura'];
$correo = $_POST['correo'];
$celular = $_POST['celular'];


$usuarios   = array("id"                 => rand(),
                    "nombre"             =>         $nombre,
                    "apellido_paterno"   =>         $paterno,
                    "apellido_materno"   =>         $materno,
                    "edad"               =>         $edad,
                    "estatura"           =>         $estatura,
                    "email"              =>         $correo,
                    "celular"            =>         $celular,
                    "id_rol"             =>         1
                ); 

$insert = new DbCrud();
  $response = $insert->save("usuarios",$usuarios);
  if($response == null){
  echo "No se insertaron los datoos a la DB";
  }else{
  
  echo "Datos insertadoscorrectamnete";
  
  }