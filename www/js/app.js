// //Listar Referidos
// $("#referido").ready(function(){
// 	//Poner la ip de tu computadora
// 	$.getJSON("http://192.168.1.8/servicios/mobilemarket_rest/API/referidos/referido/lista")
// 		.done(function(datos){
// 			$.each(datos, function(indice,valor){
// 				$("#employeeList").append('<li class="ui-li-has-alt ui-li-has-thumb ui-last-child"><a href="#" class="ui-btn" style="margin:5px !important; border:solid 1px; ">'+
//                     '<h2>'+ valor.nombre1 +' '+valor.nombre2+' '+valor.apellido1+' '+valor.apellido2+'</h2>'+
//                     '<p>Alias: '+ valor.alias +'</p>'+
//                     '<p> Dirección: '+ valor.direccion +'</p>'+
//                     '<a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop" aria-haspopup="true" aria-owns="purchase" aria-expanded="false" class="ui-btn ui-btn-icon-notext ui-icon-gear" title="Purchase album"></a>'+
//                 '</li>');
// 			});
// 		});
// });
//Poner la ip de tu computadora
//Listar Productos.
$("#productosContent").ready(function(){
	$.getJSON("http://192.168.1.8/servicios/mobilemarket_rest/API/productos/producto/lista")
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
$('#forLogin').submit(function(){
	// recolecta los valores que inserto el usuario
	var datosUsuario = $("#txtUsername").val();
	var datosPassword = $("#txtPassword").val();
  	servidor ="http://localhost/servicios/mobilemarket_rest/API/login/login.php";

	 $.getJSON( servidor,{usuario:datosUsuario ,password:datosPassword})
	 .done(function(respuestaServer){        	
		if(respuestaServer.validacion == "ok"){
		 	alert("Datos correctos");
			$.mobile.changePage("#inicio");
		}else{
		  alert("Usuario incorrecto");
		}
	 }); 
	 $.mobile.changePage("#inicio");
	
	return false;
});

//Listar Referidos
$("#referido").ready(function(){
	//Poner la ip de tu computadora
	$.getJSON("http://192.168.1.8/servicios/mobilemarket_rest/API/referidos/referido/lista")
	.done(function(datos){
		var db = window.sqlitePlugin.openDatabase("mobilemarket", "1.0", "Just a Dummy DB", 200000);
		alert("creo");
		$.each(datos, function(indice,valor){
			db.transaction(function(tx){
        		tx.executeSql('CREATE TABLE IF NOT EXISTS referidos (idReferido integer primary key, nombre1 varchar(50), nombre2 varchar(50),apellido1 varchar(50),apellido2 varchar(50),direccion varchar(50),alias varchar(50))');
        		alert("Creo tabla");
        		tx.executeSql("INSERT INTO referidos (idReferido, nombre1,nombre2,apellido1,apellido2,direccion,alias) VALUES (?,?,?,?,?,?,?)",[valor.idUsuario,valor.nombre1,valor.nombre2,valor.apellido1,valor.apellido2,valor.direccion,valor.alias]);
			},function(e){
    			alert("ERROR: " + e.message);
			});
		});
		db.transaction(function(tx){
			tx.executeSql("SELECT * FROM referidos;", [], function(tx, res) {
             listData(res);
       		 });
		},function(e){
    		alert("ERROR: consulta" + e.message);
		});
	});
});

function listData(result) {
    alert('comenso a listar');
    if(result.rows.length > 0){
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



// document.addEventListener("deviceready", onDeviceReady, false);
// function onDeviceReady() {
//     alert("entro 2");
//     var db = window.sqlitePlugin.openDatabase("Database", "1.0", "Demo", -1);
//     alert("creo");
//     db.transaction(function(tx){
//         tx.executeSql('DROP TABLE IF EXISTS test_table');
//         tx.executeSql('CREATE TABLE IF NOT EXISTS referidos (idReferido integer primary key, nombfre1 text, nombre2 text,apellido1 text,apellido2 text,direccion text,alias text));
        
//         tx.executeSql("INSERT INTO test_table (nome, sexo) VALUES (?,?)", ["Felipe", "Masculino"]);
//         tx.executeSql("INSERT INTO test_table (nome, sexo) VALUES (?,?)", ["Rubia", "Feminino"]);
//         tx.executeSql("INSERT INTO test_table (nome, sexo) VALUES (?,?)", ["Carlos", "Masculino"]);
//         tx.executeSql("INSERT INTO test_table (nome, sexo) VALUES (?,?)", ["Marley", "Masculino"]);
//         tx.executeSql("INSERT INTO test_table (nome, sexo) VALUES (?,?)", ["Nilza", "Feminino"]);
//         tx.executeSql("INSERT INTO test_table (nome, sexo) VALUES (?,?)", ["Denise", "Feminino"]);
//         // leer los datos
//         tx.executeSql("SELECT * FROM test_table;", [], function(tx, res) {
//             listData(res);
//         });
//     },function(e){
//         alert("ERROR: " + e.message);
//     }); 
// }

// function listData(result) {
//     alert('comenso a listar');
//     if(result.rows.length > 0){
//         for (var i = 0; i < result.rows.length; i++) {
//             var row = result.rows.item(i);
//             $('#nameList').append('<br>' + row.nome);
//         }
//     }else{
//         $('#nameList').html('Sem dados para exibir');
//     }
// }
