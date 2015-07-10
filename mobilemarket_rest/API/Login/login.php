<?php
	header('Content-Type: application/json');
	header("Access-Control-Allow-Origin: *");
	//Conexion con la base de datos
	$dbhost = 'localhost';
	$dbuser = 'root';
	$dbpass = '';
	$dbname = 'mobilemarket';

	$dbhandle = mysql_connect($dbhost,$dbuser,$dbpass)
	or die("No es posible conectarse a mysql");

	$seleccion = mysql_select_db($dbname)
	or die("Bas de datos no disponible");


	$usuarioEnviado = $_GET['usuario'];
	$passwordEnviado = $_GET['password'];
	$sql = mysql_num_rows(mysql_query("SELECT * FROM `cuentausuarios` WHERE `nombreUsuario`= '$usuarioEnviado' and `contrasenia` ='$passwordEnviado'"));
	if($sql){
		$resultados["mensaje"] = "Validacion Correctaa";
		$resultados["validacion"] = "ok";
	}else{
	$resultados["mensaje"] = "Usuario y password incorrectos";
	$resultados["validacion"] = "error";
	}
	

$resultadosJson = json_encode($resultados);
echo $resultadosJson;
?>

