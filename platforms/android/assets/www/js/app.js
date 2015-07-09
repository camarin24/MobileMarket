document.addEventListener("deviceready", onDeviceReady, false);
// Cordova is ready
function onDeviceReady() {
  listar();
}

// $( document ).ready(function(){
// 	var db = window.openDatabase("mobilemarket", "1.0", "Just a Dummy DB", 200000);
// 	db.transaction(function(tx){
//     tx.executeSql('DROP TABLE IF EXISTS referidos');
// 	})
// });

$("#productosContent").ready(function(){
	$.getJSON("http://192.168.1.5/servicios/mobilemarket_rest/API/productos/producto/lista")
		.done(function(datos){
			$.each(datos, function(indice,valor){
				$("#productosContent").append('<ul data-role="listview" data-split-icon="gear" data-inset="true" class="ui-listview ui-listview-inset ui-corner-all ui-shadow" style="margin:5px !important; border:solid 1px; ">'+
	                '<li class="ui-li-has-alt ui-li-has-thumb ui-first-child"><a href="#" class="ui-btn">'+
	                    '<img src="'+valor.imagen+'" style="height:100%;">'+
	                    '<h2>'+valor.nombre+'</h2>'+
	                    '<p>Uso: '+valor.descripcion+'</p></a>'+
	                    '<a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop" aria-haspopup="true" aria-owns="purchase" aria-expanded="false" class="ui-btn ui-btn-icon-notext ui-icon-carat-r" title="Purchase album"></a>'+
	                '</li>'+
            		'</ul>');
			});
		});
});

//Login
$('#forLogin').on('click',function(){
	// recolecta los valores que inserto el usuario
	var datosUsuario = $("#txtUsername").val();
	var datosPassword = $("#txtPassword").val();
  	servidor ="http://192.168.1.5/servicios/mobilemarket_rest/API/login/login.php";
	 $.getJSON( servidor,{usuario:datosUsuario ,password:datosPassword})
	 .done(function(respuestaServer){        	
		if(respuestaServer.validacion == "ok"){
		 	alert("Datos correctos");
			$.mobile.changePage("#inicio");
		}else{
		  alert("Usuario incorrecto");
		}
	 }); 
});

//Listar Referidos
// $("#referido").ready(function(){
// 	//Poner la ip de tu computadora
// 	$.getJSON("http://192.168.1.5/servicios/mobilemarket_rest/API/referidos/referido/lista")
// 	.done(function(datos){
// 		$.each(datos, function(indice,valor){
// 			db.transaction(function(tx){
// 				tx.executeSql('DROP TABLE IF EXISTS referidos');
//         		tx.executeSql('CREATE TABLE IF NOT EXISTS referidos2 (idReferido integer primary key, nombre1 varchar(50), nombre2 varchar(50),apellido1 varchar(50),apellido2 varchar(50),direccion varchar(50),alias varchar(50),fechaNacimiento varchar(40),email varchar(40),tipoDocumento varchar(20),numeroDocumento varchar(20),nit (20),razonSocial varchar(50),url varchar(50),emailEmpresa varchar(40),encargado(50),direccionEmpresa varchar(50))');
//         		alert("Creo tabla");
//         		tx.executeSql("INSERT INTO referidos2 (idReferido, nombre1,nombre2,apellido1,apellido2,direccion,alias) VALUES (?,?,?,?,?,?,?)",[valor.idUsuario,valor.nombre1,valor.nombre2,valor.apellido1,valor.apellido2,valor.direccion,valor.alias]);
// 			},function(e){
//     			alert("ERROR: " + e.message);
// 			});
// 		});
// 		db.transaction(function(tx){
// 			tx.executeSql("SELECT * FROM referidos2;", [], function(tx, res) {
//              listData(res);
//        		 });
// 		},function(e){
//     		alertr("ERROR: consulta" + e.message);
// 		});
// 	});
// });

$('#btnRegistrarReferidos').on('click',function(){
	var db = window.sqlitePlugin.openDatabase("mobilemarket", "1.0", "Just a Dummy DB", 200000);
	alert("Entro funcion de traer datos");
	registro = {
		'tipoDocumento': $("#txtTipoDocumento").val(),
		'numeroDocumento': $("#txtDocumento").val(),
		'nombre1': $("#txtPrimerNombre").val(),
		'nombre2': $("#txtSegundoNombre").val(),
		'apellido1': $("#txtPrimerApellido").val(),
		'apellido2': $("#txtSegundoApellido").val(),
		'alias': $("#txtAlias").val(),
		'sexo': $("#txtSexo").val(),
		'fechaNacimiento': $("#txtFecha").val(),
		'email': $("#txtCorreo").val(),
		'direccion': $("#txtDireccion").val(),
		'tipoPersona': $("input:radio[name=tipo]:checked").val(),
		'nit': $("#txtNIT").val(),
		'razonSocial': $("#txtRazonSocial").val(),
		'url': $("#txtURL").val(),
		'emailEmpresa': $("#txtCorreoEmpresa").val(),
		'encargado': $("#txtEncargado").val(),
		'direccionEmpresa': $("#txtDireccionEmpresa").val()
	}
	alert("trajo datos");
	db.transaction(function(tx){
		tx.executeSql('CREATE TABLE IF NOT EXISTS referidos (idReferido integer primary key , nombre1 varchar(50), nombre2 varchar(50),apellido1 varchar(50),apellido2 varchar(50),alias varchar(50),sexo varchar(10),fechaNacimiento varchar(40),email varchar(40),direccion varchar(50),tipoPersona varchar(10),tipoDocumento varchar(20),numeroDocumento varchar(20),nit varchar(20),razonSocial varchar(50),url varchar(50),emailEmpresa varchar(40),encargado varchar(50),direccionEmpresa varchar(50))');
		
		alert("creo tabala");
		tx.executeSql("INSERT INTO referidos (tipoDocumento,numeroDocumento,nombre1,nombre2,apellido1,apellido2,alias,sexo,fechaNacimiento,email,direccion,tipoPersona,nit,razonSocial,url,emailEmpresa,encargado,direccionEmpresa) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
			[registro.tipoDocumento,registro.numeroDocumento,registro.nombre1,registro.nombre2,registro.apellido1,registro.apellido2,registro.alias,registro.sexo,registro.fechaNacimiento,registro.email,registro.direccion,registro.tipoPersona,registro.nit,registro.razonSocial,registro.url,registro.emailEmpresa,registro.encargado,registro.direccionEmpresa]);
		alert("creo tabala2");

	},function(e){
		alert("ERROR: " + e.message);
	});

	alert("redireccionar");
	$.mobile.changePage("#referido");
	listar();
});

function listar(){
	var db = window.sqlitePlugin.openDatabase("mobilemarket", "1.0", "Just a Dummy DB", 200000);
	alert("Va a listar");
	db.transaction(function(tx){
		tx.executeSql("SELECT * FROM referidos;", [], function(tx, res){
         listData(res);
   		 });
	},function(e){
		alertr("ERROR: consulta" + e.message);
	});
}
//Listar referidos
function listData(result) {
    if(result.rows.length > 0){
    	$("#employeeList").empty();
        for (var i = 0; i < result.rows.length; i++) {
            var valor = result.rows.item(i);
            $("#employeeList").append('<li class="ui-li-has-alt ui-li-has-thumb ui-last-child"><a href="#" class="ui-btn" style="margin:5px !important; border:solid 1px; ">'+
                    '<h2>'+ valor.nombre1 +' '+valor.nombre2+' '+valor.apellido1+' '+valor.apellido2+'</h2>'+
                    '<p>Alias: '+ valor.alias +'</p>'+
                    '<p> Dirección: '+ valor.direccion +'</p>'+
                    '<a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop" aria-haspopup="true" aria-owns="purchase" aria-expanded="false" class="ui-btn ui-btn-icon-notext ui-icon-gear" title="Purchase album"></a>'+
                '</li>');
        }
    }else{
        $('#nameList').html('Sem dados para exibir');
    }
}	

