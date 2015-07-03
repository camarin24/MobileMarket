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
	// $sql = mysql_query("SELECT * FROM `cuentausuarios` WHERE `nombreUsuario`= 'lacuenta' and `contrasenia` ='12344555'");
	if($sql){
		$resultados["mensaje"] = "Validacion Correctaa";
		$resultados["validacion"] = "ok";
	}else{
	/*esta informacion se envia si la validacion falla */
	$resultados["mensaje"] = "Usuario y password incorrectos";
	$resultados["validacion"] = "error";
	}
	

/*convierte los resultados a formato json*/
$resultadosJson = json_encode($resultados);

/*muestra el resultado en un formato que no da problemas de seguridad en browsers */
echo $_GET['jsoncallback'] . '(' . $resultadosJson . ');';

?>

