$("#referido").ready(function(){
	$.getJSON("http://localhost/servicios/mobilemarket_rest/API/referidos/referido/lista")
		.done(function(datos){
			$.each(datos, function(indice,valor){
				$("#employeeList").append('<li class="ui-li-has-alt ui-li-has-thumb ui-last-child"><a href="#" class="ui-btn">'+
                   
                    '<h2>'+ valor.nombre1 +' '+valor.nombre2+'</h2>'+
                    '<p id="alias">'+ valor.alias +'</p>'+
                    '<p id="direccion">'+ valor.direccion +'</p>'+
                    '<a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop" aria-haspopup="true" aria-owns="purchase" aria-expanded="false" class="ui-btn ui-btn-icon-notext ui-icon-gear" title="Purchase album"></a>'+
                '</li>');
			});
		});
});