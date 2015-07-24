// Wait for Cordova to load
document.addEventListener("deviceready", onDeviceReady, false);

// Cordova is ready
function onDeviceReady() {
    // var db = window.sqlitePlugin.openDatabase({name: "my.db"});
    var db = window.openDatabase("mobilemarket", "1.0", "Just a Dummy DB", 200000);
    db.transaction(function(tx) {
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_EstadoPedido (idEstadoPedido INTEGER PRIMARY KEY AUTOINCREMENT ,nombre text)");
        // Tabla = Tbl_Departamento
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Departamento (idDepartamento INTEGER PRIMARY KEY  AUTOINCREMENT ,nombre text)");
        // Tabla = Tbl_municipio
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_municipio (idMunicipio INTEGER PRIMARY KEY  AUTOINCREMENT,nombre text ,Tbl_Departamento_idDepartamento INT ,CONSTRAINT fk_Tbl_municipio_Tbl_Departamento1 FOREIGN KEY (Tbl_Departamento_idDepartamento) REFERENCES Tbl_Departamento (idDepartamento))");
        // Tabla = Tbl_Barrio
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Barrio (idBarrio INTEGER PRIMARY KEY AUTOINCREMENT ,nombre text ,Tbl_municipio_idMunicipio INT ,CONSTRAINT fk_Tbl_Barrio_Tbl_municipio1 FOREIGN KEY (Tbl_municipio_idMunicipio) REFERENCES Tbl_municipio (idMunicipio))");
        // Tabla = Tbl_TipoDocumento
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_TipoDocumento (idTipoDocumento INTEGER PRIMARY KEY  AUTOINCREMENT,nombre text)");
        // Tabla = Tbl_TipoPersona
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_TipoPersona (idTipoPersona INTEGER PRIMARY KEY  AUTOINCREMENT,nombre text)");
        // Tabla = Tbl_Persona
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Persona (id_Persona INTEGER PRIMARY KEY  AUTOINCREMENT,numero_Documento VARCHAR(15) ,estado TINYINT(1)  DEFAULT 1,nombre1 text ,nombre2 text ,apellido1 text ,apellido text ,sexo TINYINT(1) ,direccion text ,fechaNacimiento DATE ,correoElectronico text ,id_Consolidador INT ,Tbl_TipoDocumento_idTipoDocumento INT ,Tbl_TipoReferido_idTipoPersona INT ,CONSTRAINT fk_Tbl_Persona_Tbl_TipoDocumento1 FOREIGN KEY (Tbl_TipoDocumento_idTipoDocumento) REFERENCES Tbl_TipoDocumento (idTipoDocumento) CONSTRAINT fk_Tbl_Persona_Tbl_Persona1 FOREIGN KEY (id_Consolidador) REFERENCES Tbl_Persona (id_Persona) CONSTRAINT fk_Tbl_Persona_Tbl_TipoReferido1 FOREIGN KEY (Tbl_TipoReferido_idTipoPersona) REFERENCES Tbl_TipoPersona (idTipoPersona))");
        // Tabla = Tbl_Sucursal
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Sucursal (idSucursal INTEGER PRIMARY KEY  AUTOINCREMENT,barrio INT ,ciudad INT ,departamento INT ,calificacion text ,alias text ,razonSocial text ,direccion text ,encargado text ,nombreSucursal text ,suplente text ,Tbl_Barrio_idBarrio INT ,Tbl_Persona_id_Persona INT , CONSTRAINT fk_Tbl_Sucursal_Tbl_Barrio1 FOREIGN KEY (Tbl_Barrio_idBarrio) REFERENCES Tbl_Barrio (idBarrio) CONSTRAINT fk_Tbl_Sucursal_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona))");
        // Tabla = Tbl_Pedidos
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Pedidos (idPedidos INTEGER PRIMARY KEY  AUTOINCREMENT,fechaExpedicion DATE ,FechaVencimiento DATE ,tipoPago TINYINT(1) ,idPlazoPago INT ,idEstadoPedido INT ,Tbl_PlazoPago_idPlazoPago INT ,Tbl_EstadoPedido_idEstadoPedido INT ,Tbl_Sucursal_idSucursal INT ,plazo_Pago text , CONSTRAINT fk_Tbl_Pedidos_Tbl_EstadoPedido1 FOREIGN KEY (Tbl_EstadoPedido_idEstadoPedido) REFERENCES Tbl_EstadoPedido (idEstadoPedido) CONSTRAINT fk_Tbl_Pedidos_Tbl_Sucursal1 FOREIGN KEY (Tbl_Sucursal_idSucursal) REFERENCES Tbl_Sucursal (idSucursal))"); 
        // Tabla = Tbl_Fabricante
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Fabricante (id_Fabricante INTEGER PRIMARY KEY  AUTOINCREMENT,nombre text ,estado TINYINT(1)  DEFAULT 1,id_Casa INT , CONSTRAINT fk_Fabricante_idfabricante_idCasa FOREIGN KEY (id_Casa) REFERENCES Tbl_Fabricante (id_Fabricante))");
        // Tabla = Tbl_SubCategoria
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_SubCategoria (idSubCategoria INTEGER PRIMARY KEY  AUTOINCREMENT, nombre text , descripcion text )");
        // Tabla = Tbl_Categoria
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Categoria ( idCategoria INTEGER PRIMARY KEY  AUTOINCREMENT, nombre text , descripcion text )");
        // Tabla = Tbl_Productos
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Productos (idProductos INTEGER PRIMARY KEY  AUTOINCREMENT,estadoProducto TINYINT(1)  DEFAULT 1,existencias INT ,nombreProducto text ,Tbl_Marca_idMarca INT ,Tbl_SubCategoria_idSubCategoria INT ,precio DOUBLE ,Tbl_casa_idTbl_casa INT ,Tbl_Categoria_idCategoria INT , CONSTRAINT fk_Tbl_Productos_Tbl_Marca1 FOREIGN KEY (Tbl_Marca_idMarca) REFERENCES Tbl_Fabricante (id_Fabricante) CONSTRAINT fk_Tbl_Productos_Tbl_SubCategoria1 FOREIGN KEY (Tbl_SubCategoria_idSubCategoria) REFERENCES Tbl_SubCategoria (idSubCategoria) CONSTRAINT fk_Tbl_Productos_Tbl_Categoria1 FOREIGN KEY (Tbl_Categoria_idCategoria) REFERENCES Tbl_Categoria (idCategoria))");
        // Tabla = Tbl_Telefonos
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Telefonos (idTelefono INTEGER PRIMARY KEY  AUTOINCREMENT ,numero text ,Tbl_Sucursal_idSucursal INT , CONSTRAINT fk_Tbl_Telefonos_Tbl_Sucursal1 FOREIGN KEY (Tbl_Sucursal_idSucursal) REFERENCES Tbl_Sucursal (idSucursal))");
        // Tabla = Tbl_parentesco
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_parentesco (idParentesco INTEGER PRIMARY KEY  AUTOINCREMENT  ,nombre text)");
        // Tabla = Tbl_RangoSalarial
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_RangoSalarial (idRangoSalarial INTEGER PRIMARY KEY  AUTOINCREMENT,rango_Inferior text ,rango_Superior text)");
        // Tabla = Tbl_Familiar
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Familiar (idFamiliar INTEGER PRIMARY KEY  AUTOINCREMENT ,fechaNacimimiento DATE ,hobies text ,sexo TINYINT(1) ,Tbl_parentesco_idParentesco INT ,Tbl_RangoSalarial_idRangoSalarial INT ,Tbl_Persona_id_Persona INT ,CONSTRAINT fk_Tbl_Perfil_Tbl_parentesco1 FOREIGN KEY (Tbl_parentesco_idParentesco) REFERENCES Tbl_parentesco (idParentesco) CONSTRAINT fk_Tbl_Familiar_Tbl_RangoSalarial1 FOREIGN KEY (Tbl_RangoSalarial_idRangoSalarial) REFERENCES Tbl_RangoSalarial (idRangoSalarial) CONSTRAINT fk_Tbl_Familiar_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona))");
        // Tabla = Tbl_DetallePedido
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_DetallePedido (idDetallePedido INTEGER PRIMARY KEY  AUTOINCREMENT,cantidadProducto INT  DEFAULT 1,precio DOUBLE ,Tbl_Productos_idProductos INT ,Tbl_Productos_Tbl_Categoria_idCategoria INT ,Tbl_Pedidos_idPedidos INT ,Tbl_Pedidos_idUsuario INT , CONSTRAINT fk_Tbl_DetallePedido_Tbl_Productos1 FOREIGN KEY (Tbl_Productos_idProductos) REFERENCES Tbl_Productos (idProductos) CONSTRAINT fk_Tbl_DetallePedido_Tbl_Pedidos1 FOREIGN KEY (Tbl_Pedidos_idPedidos) REFERENCES Tbl_Pedidos (idPedidos))");
        // Tabla = Tbl_ListasPersonalizadas
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_ListasPersonalizadas (idListasPersonalizadas INTEGER PRIMARY KEY  AUTOINCREMENT,nombreListaPersonalizada text ,estado TINYINT(1)  DEFAULT 1,Tbl_Persona_id_Persona INT , CONSTRAINT fk_Tbl_ListasPersonalizadas_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona))");
        // Tabla =  Tbl_Empresa
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_Empresa (idEmpresa INTEGER PRIMARY KEY  AUTOINCREMENT,NIT VARCHAR(20) ,correoElectronico text ,razonSocial text ,url text ,Tbl_Persona_id_Persona INT , CONSTRAINT fk_Tbl_Empresa_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona))");
        // Tabla = Tbl_CuentasUsuario
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_CuentasUsuario (contrasenia text ,estado TINYINT(1)  DEFAULT 1,nunmeroDocumento INTEGER PRIMARY KEY AUTOINCREMENT, Tbl_Persona_id_Persona INT , CONSTRAINT fk_Tbl_CuentasUsuario_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona))");
        // Tabla = Tbl_DetalleListaPersonalizada
        tx.executeSql("CREATE TABLE IF NOT EXISTS Tbl_DetalleListaPersonalizada (idDetalleListaPersonalizada INTEGER PRIMARY KEY  AUTOINCREMENT  , Tbl_Productos_idProductos INT , Tbl_Productos_Tbl_Categoria_idCategoria INT , Tbl_ListasPersonalizadas_idListasPersonalizadas INT , CONSTRAINT fk_Tbl_DetalleListaPersonalizada_Tbl_Productos1 FOREIGN KEY (Tbl_Productos_idProductos) REFERENCES Tbl_Productos (idProductos) CONSTRAINT fk_Tbl_DetalleListaPersonalizada_Tbl_ListasPersonalizadas1 FOREIGN KEY (Tbl_ListasPersonalizadas_idListasPersonalizadas) REFERENCES Tbl_ListasPersonalizadas (idListasPersonalizadas))");
        // alert("Base de datos creada correctamente"); 
    }, function(e) {
    alert("ERROR: " + e.message);
    });
}


$("#productosContent").ready(function(){
    $.getJSON("http://localhost:73/servicios/mobilemarket_rest/API/productos/producto/lista")
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


$("#listaPProductos").ready(function(){
    $.getJSON("http://localhost:73/servicios/mobilemarket_rest/API/productos/producto/lista")
        .done(function(datos){
            $.each(datos, function(indice,valor){
                $("#listaPProductos").append('<ul data-role="listview" data-split-icon="plus" data-split-theme="a" data-inset="true">'+
                    '<li><a href="#"><img src="http://tropi.azurewebsites.net/images/Catalogo/0310023.jpg" style="height:100%">'+
                        '<h2>Nobre producto</h2>'+
                        '<p>Uso:Descripcion</p></a>'+
                        '<a href="#purchase" data-rel="popup" data-position-to="window" data-transition="pop">Purchase album</a>'+
                        '</li></ul>'
                        // '<div data-role="popup" id="purchase" data-theme="a" data-overlay-theme="b" class="ui-content" style="max-width:340px; padding-bottom:2em;">'+
                        // '<h3>Agregar unidades</h3>'+
                        // '<p>Numero de existencias actuales:50'+
                        // '<b>Las existencias pueden cambiar</b></p>'+
                        // '<label for="slider-1">Numero de unidades</label>'+
                        // '<input type="range" name="slider-1" id="slider-1" value="50" min="0" max="100" data-highlight="true">'+
                        // '<a href="index.html" data-rel="back" class="ui-shadow ui-btn ui-corner-all ui-btn-b ui-icon-plus ui-btn-icon-left ui-btn-inline ui-mini">Agregar</a>'+
                        // '<a href="index.html" data-rel="back" class="ui-shadow ui-btn ui-corner-all ui-btn-inline ui-mini">Cancelar</a>'+
                        // '</div></div>'
                        );
            });
        });
});
// inner join
// Select tbl_Productos.Nombre, tbl_Productos.Existencias,tbl_Productos.Precio,Categoria.nombre from tbl_productos 
// inner join Tbl_ListasPersonalizadas on tbl_DetallelistaPersonalizadas.Tbl_ListasPersonalizadas:idListasPersonalizadas = Tbl_ListasPersonalizadas.idListasPersonalizadas
// inner join tbl_DetallelistaPersonalizadas on tbl_Productos.idProductos = tbl_DetallelistaPersonalizadas.Tbl_Productos_idProductos
// inner join tbl_DetallelistaPersonalizadas on tbl_Productos.idCateogira = tbl_DetallelistaPersonalizadas.Tbl_Productos_idProductos
