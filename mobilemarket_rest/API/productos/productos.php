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
	//Fin conexion
	//Funciones
	function consultar_productos($detalles){
		if ($detalles == 'lista') {
			$sql = mysql_query("SELECT * FROM productos");
		}else{
			$sql = mysql_query("SELECT * FROM productos WHERE idProducto=".$detalles);
		}
		while ($fila = mysql_fetch_array($sql)) {
			$productos[]= $fila;
		}
		return $productos;
	}

	if ($_GET['peticion'] == 'producto'){
		$resultado = consultar_productos($_GET['detalle']);
	}else{
		header('HTTP/1.1 405 Method Not Allowed');
		exit;
	}

	echo json_encode($resultado);


 ?>