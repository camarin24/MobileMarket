<?php 
	header('Content-Type: application/json');
	header("Access-Control-Allow-Origin: *");
	header('Access-Control-Allow-Methods: POST, GET, OPTIONS');
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
	function mostrar_referidos($detalles){
		if ($detalles == 'lista') {
			$sql = mysql_query("SELECT * FROM usuarios");
		}else{
			$sql = mysql_query("SELECT * FROM usuarios WHERE idUsuario=".$detalles);
		}
		while ($fila = mysql_fetch_array($sql)) {
			$todosLosTitulos[]= $fila;
		}
		return $todosLosTitulos;
	}

	function mostrar_autores($detalles){
		if ($detalles == 'lista') {
			$sql = mysql_query("SELECT autor FROM libros");
		}else{
			$sql = mysql_query("SELECT autor FROM libros WHERE id=".$detalles);
		}
		while ($fila = mysql_fetch_array($sql)) {
			$todosLosAutores[]= $fila;
		}
		return $todosLosAutores;
	}

	function guardar_nuevo_autor(){
		mysql_query("INSERT INTO libros (autor,titulo) VALUES ('".$_POST['autor']."','".$_POST['titulo']."')");
		header("Location: ../../../");
	}
	//Fin funciones

	//
	if ($_GET['peticion'] == 'referido'){
		$resultado = mostrar_referidos($_GET['detalle']);

	}elseif ($_GET['peticion'] == 'autor') {

		if ($_GET['detalle'] == 'nuevo') {
			guardar_nuevo_autor();
		}else{
			$resultado = mostrar_autores($_GET['detalle']);
		}
		
	}else{
		header('HTTP/1.1 405 Method Not Allowed');
		exit;
	}

	echo  json_encode($resultado);


 ?>