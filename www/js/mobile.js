
$(document).ready(function(){
	$("#jud").hide();
});

$("#radio-nat-1").click(function(){
	$("#jud").fadeOut(500);
});

$("#radio-nat-2").click(function(){
	$("#jud").fadeIn(500);
});

// var serviceURL = "http://localhost/servicios/";
// var employees;

// $('#employeeListPage').bind('pageinit', function(event) {
// 	getEmployeeList();
// });

// function getEmployeeList() {
// 	$.getJSON(serviceURL + 'getemployees.php', function(data) {
// 		$('#employeeList').remove();
// 		employees = data.items;
// 		$.each(employees, function(index, employee) {
// 			$('#employeeList').append('<li class="ui-li-has-alt ui-li-has-thumb ui-last-child"><a href="#" class="ui-btn">'+
//                     '<img src="http://tropi.azurewebsites.net/images/Catalogo/0050438.jpg">'+
//                        '<h2>'+ employee.nombre1 +'</h2>'+
//                        '<p id="alias">'+ employee.nombre2 +'</p>'+
//                        '<p id="direccion">'+ employee.direccion +'</p>'+
//                     '<a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop" aria-haspopup="true" aria-owns="purchase" aria-expanded="false" class="ui-btn ui-btn-icon-notext ui-icon-gear" title="Purchase album"></a>'+
//                 '</li>');
// 		});
// 		$('#employeeList').listview('refresh');
// 	});
// }