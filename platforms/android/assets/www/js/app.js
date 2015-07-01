$("#referido").ready(function(){
	//Poner la ip de tu computadora
	$.getJSON("http://192.168.1.8/servicios/mobilemarket_rest/API/referidos/referido/lista")
		.done(function(datos){
			$.each(datos, function(indice,valor){
				$("#employeeList").append('<li class="ui-li-has-alt ui-li-has-thumb ui-last-child"><a href="#" class="ui-btn" style="margin:5px !important; border:solid 1px; ">'+
                    '<h2>'+ valor.nombre1 +' '+valor.nombre2+' '+valor.apellido1+' '+valor.apellido2+'</h2>'+
                    '<p>Alias: '+ valor.alias +'</p>'+
                    '<p> Dirección: '+ valor.direccion +'</p>'+
                    '<a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop" aria-haspopup="true" aria-owns="purchase" aria-expanded="false" class="ui-btn ui-btn-icon-notext ui-icon-gear" title="Purchase album"></a>'+
                '</li>');
			});
		});
});
//Poner la ip de tu computadora
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

