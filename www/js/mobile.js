
$(document).ready(function(){
	$("#jud").hide();
});

$("#radio-nat-1").click(function(){
	$("#jud").fadeOut();
});

$("#radio-nat-2").click(function(){
	$("#jud").fadeToggle();
});
