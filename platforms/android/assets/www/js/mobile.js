$(document).ready(function(){
	$("#jud").hide();
	$("#sucursal").hide();

}); 
$("#radio-nat-1").click(function(){
	$("#jud").fadeOut(500);
});

$("#radio-nat-2").click(function(){
	$("#jud").fadeIn(500);
});

$("#sucursal0").click(function(){
	$("#sucursal").fadeOut(500);
});
$("#sucursal1").click(function(){
	$("#sucursal").fadeIn(500);
});

