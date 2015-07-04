--326
-- -----------------------------------------------------
-- Table Tbl_EstadoPedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_EstadoPedido (
  idEstadoPedido INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Table Tbl_Departamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Departamento (
  idDepartamento INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Table Tbl_municipio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_municipio (
  idMunicipio INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL,
  Tbl_Departamento_idDepartamento INT NOT NULL,
  CONSTRAINT fk_Tbl_municipio_Tbl_Departamento1
    FOREIGN KEY (Tbl_Departamento_idDepartamento)
    REFERENCES Tbl_Departamento (idDepartamento)
);

-- -----------------------------------------------------
-- Table Tbl_Barrio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Barrio (
  idBarrio INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL,
  Tbl_municipio_idMunicipio INT NOT NULL,
  CONSTRAINT fk_Tbl_Barrio_Tbl_municipio1
    FOREIGN KEY (Tbl_municipio_idMunicipio)
    REFERENCES Tbl_municipio (idMunicipio)
);


-- -----------------------------------------------------
-- Table Tbl_TipoDocumento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_TipoDocumento (
  idTipoDocumento INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Table Tbl_TipoPersona
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_TipoPersona (
  idTipoPersona INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL
);
 
-- -----------------------------------------------------
-- Table Tbl_Persona
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Persona (
  id_Persona INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  numero_Documento VARCHAR(15) NOT NULL,
  estado TINYINT(1) NOT NULL DEFAULT 1,
  nombre1 VARCHAR(45) NOT NULL,
  nombre2 VARCHAR(45) NULL,
  apellido1 VARCHAR(45) NOT NULL,
  apellido VARCHAR(45) NOT NULL,
  sexo TINYINT(1) NULL,
  direccion VARCHAR(45) NOT NULL,
  fechaNacimiento DATE NOT NULL,
  correoElectronico VARCHAR(45) NOT NULL,
  id_Consolidador INT NULL,
  Tbl_TipoDocumento_idTipoDocumento INT NOT NULL,
  Tbl_TipoReferido_idTipoPersona INT NOT NULL,
  CONSTRAINT fk_Tbl_Persona_Tbl_TipoDocumento1
    FOREIGN KEY (Tbl_TipoDocumento_idTipoDocumento)
    REFERENCES Tbl_TipoDocumento (idTipoDocumento)

  CONSTRAINT fk_Tbl_Persona_Tbl_Persona1
    FOREIGN KEY (id_Consolidador)
    REFERENCES Tbl_Persona (id_Persona)

  CONSTRAINT fk_Tbl_Persona_Tbl_TipoReferido1
    FOREIGN KEY (Tbl_TipoReferido_idTipoPersona)
    REFERENCES Tbl_TipoPersona (idTipoPersona)
);



-- -----------------------------------------------------
-- Table Tbl_Sucursal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Sucursal (
  idSucursal INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  barrio INT NOT NULL,
  ciudad INT NOT NULL,
  departamento INT NOT NULL,
  calificacion VARCHAR(45) NULL,
  alias VARCHAR(45) NOT NULL,
  razonSocial VARCHAR(45) NULL,
  direccion VARCHAR(45) NOT NULL,
  encargado VARCHAR(45) NOT NULL,
  nombreSucursal VARCHAR(45) NOT NULL,
  suplente VARCHAR(45) NULL,
  Tbl_Barrio_idBarrio INT NOT NULL,
  Tbl_Persona_id_Persona INT NOT NULL,
  CONSTRAINT fk_Tbl_Sucursal_Tbl_Barrio1
    FOREIGN KEY (Tbl_Barrio_idBarrio)
    REFERENCES Tbl_Barrio (idBarrio)

  CONSTRAINT fk_Tbl_Sucursal_Tbl_Persona1
    FOREIGN KEY (Tbl_Persona_id_Persona)
    REFERENCES Tbl_Persona (id_Persona)
);

-- -----------------------------------------------------
-- Table Tbl_Pedidos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Pedidos (
  idPedidos INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  fechaExpedicion DATE NULL,
  FechaVencimiento DATE NULL,
  tipoPago TINYINT(1) NOT NULL,
  idPlazoPago INT NULL,
  idEstadoPedido INT NULL,
  Tbl_PlazoPago_idPlazoPago INT NOT NULL,
  Tbl_EstadoPedido_idEstadoPedido INT NOT NULL,
  Tbl_Sucursal_idSucursal INT NOT NULL,
  plazo_Pago VARCHAR(45) NOT NULL,
  CONSTRAINT fk_Tbl_Pedidos_Tbl_EstadoPedido1
    FOREIGN KEY (Tbl_EstadoPedido_idEstadoPedido)
    REFERENCES Tbl_EstadoPedido (idEstadoPedido)

  CONSTRAINT fk_Tbl_Pedidos_Tbl_Sucursal1
    FOREIGN KEY (Tbl_Sucursal_idSucursal)
    REFERENCES Tbl_Sucursal (idSucursal)
);

-- -----------------------------------------------------
-- Table Tbl_Fabricante
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Fabricante (
  id_Fabricante INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL,
  estado TINYINT(1) NOT NULL DEFAULT 1,
  id_Casa INT NOT NULL,
  CONSTRAINT fk_Fabricante_idfabricante_idCasa
    FOREIGN KEY (id_Casa)
    REFERENCES Tbl_Fabricante (id_Fabricante)
);

-- -----------------------------------------------------
-- Table Tbl_SubCategoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_SubCategoria (
  idSubCategoria INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(45) NOT NULL
);
-- -----------------------------------------------------
-- Table Tbl_Categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Categoria (
  idCategoria INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombre VARCHAR(45) NOT NULL,
  descripcion VARCHAR(45) NULL
);
-- -----------------------------------------------------
-- Table Tbl_Productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Productos (
  idProductos INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  estadoProducto TINYINT(1) NOT NULL DEFAULT 1,
  existencias INT NOT NULL,
  nombreProducto VARCHAR(45) NOT NULL,
  -- Tbl_Presenataciones_idPresenataciones INT NOT NULL,
  Tbl_Marca_idMarca INT NOT NULL,
  Tbl_SubCategoria_idSubCategoria INT NOT NULL,
  precio DOUBLE NOT NULL,
  Tbl_casa_idTbl_casa INT NOT NULL,
  Tbl_Categoria_idCategoria INT NOT NULL,
  CONSTRAINT fk_Tbl_Productos_Tbl_Marca1
    FOREIGN KEY (Tbl_Marca_idMarca)
    REFERENCES Tbl_Fabricante (id_Fabricante)

  CONSTRAINT fk_Tbl_Productos_Tbl_SubCategoria1
    FOREIGN KEY (Tbl_SubCategoria_idSubCategoria)
    REFERENCES Tbl_SubCategoria (idSubCategoria)

  CONSTRAINT fk_Tbl_Productos_Tbl_Categoria1
    FOREIGN KEY (Tbl_Categoria_idCategoria)
    REFERENCES Tbl_Categoria (idCategoria)
);

-- -----------------------------------------------------
-- Table Tbl_Telefonos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Telefonos (
  idTelefono INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE,
  numero VARCHAR(45) NOT NULL,
  Tbl_Sucursal_idSucursal INT NOT NULL,
  CONSTRAINT fk_Tbl_Telefonos_Tbl_Sucursal1
    FOREIGN KEY (Tbl_Sucursal_idSucursal)
    REFERENCES Tbl_Sucursal (idSucursal)
);

-- -----------------------------------------------------
-- Table Tbl_parentesco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_parentesco (
  idParentesco INT NOT NULL,
  nombre VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Table Tbl_RangoSalarial
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_RangoSalarial (
  idRangoSalarial INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  rango_Inferior VARCHAR(45) NULL,
  rango_Superior VARCHAR(45) NULL
);
-- -----------------------------------------------------
-- Table Tbl_Familiar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Familiar (
  idFamiliar INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE,
  fechaNacimimiento DATE NOT NULL,
  hobies VARCHAR(45) NOT NULL,
  sexo TINYINT(1) NULL,
  Tbl_parentesco_idParentesco INT NOT NULL,
  Tbl_RangoSalarial_idRangoSalarial INT NOT NULL,
  Tbl_Persona_id_Persona INT NOT NULL,
  CONSTRAINT fk_Tbl_Perfil_Tbl_parentesco1
    FOREIGN KEY (Tbl_parentesco_idParentesco)
    REFERENCES Tbl_parentesco (idParentesco)

  CONSTRAINT fk_Tbl_Familiar_Tbl_RangoSalarial1
    FOREIGN KEY (Tbl_RangoSalarial_idRangoSalarial)
    REFERENCES Tbl_RangoSalarial (idRangoSalarial)

  CONSTRAINT fk_Tbl_Familiar_Tbl_Persona1
    FOREIGN KEY (Tbl_Persona_id_Persona)
    REFERENCES Tbl_Persona (id_Persona)
);
-- -----------------------------------------------------
-- Table Tbl_DetallePedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_DetallePedido (
  idDetallePedido INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  cantidadProducto INT NOT NULL DEFAULT 1,
  precio DOUBLE NOT NULL,
  Tbl_Productos_idProductos INT NOT NULL,
  Tbl_Productos_Tbl_Categoria_idCategoria INT NOT NULL,
  Tbl_Pedidos_idPedidos INT NOT NULL,
  Tbl_Pedidos_idUsuario INT NOT NULL,
  CONSTRAINT fk_Tbl_DetallePedido_Tbl_Productos1
    FOREIGN KEY (Tbl_Productos_idProductos)
    REFERENCES Tbl_Productos (idProductos)

  CONSTRAINT fk_Tbl_DetallePedido_Tbl_Pedidos1
    FOREIGN KEY (Tbl_Pedidos_idPedidos)
    REFERENCES Tbl_Pedidos (idPedidos)
);

-- -----------------------------------------------------
-- Table Tbl_ListasPersonalizadas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_ListasPersonalizadas (
  idListasPersonalizadas INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  nombreListaPersonalizada VARCHAR(45) NOT NULL,
  estado TINYINT(1) NOT NULL DEFAULT 1,
  Tbl_Persona_id_Persona INT NOT NULL,
  CONSTRAINT fk_Tbl_ListasPersonalizadas_Tbl_Persona1
    FOREIGN KEY (Tbl_Persona_id_Persona)
    REFERENCES Tbl_Persona (id_Persona)
);

-- -----------------------------------------------------
-- Table Tbl_Empresa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Empresa (
  idEmpresa INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,
  NIT VARCHAR(20) NOT NULL,
  correoElectronico VARCHAR(45) NOT NULL,
  razonSocial VARCHAR(45) NOT NULL,
  url VARCHAR(45) NULL,
  Tbl_Persona_id_Persona INT NOT NULL,
  CONSTRAINT fk_Tbl_Empresa_Tbl_Persona1
    FOREIGN KEY (Tbl_Persona_id_Persona)
    REFERENCES Tbl_Persona (id_Persona)
);

-- -----------------------------------------------------
-- Table Tbl_CuentasUsuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_CuentasUsuario (
  contrasenia VARCHAR(45) NOT NULL,
  estado TINYINT(1) NOT NULL DEFAULT 1,
  nunmeroDocumento INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,
Tbl_Persona_id_Persona INT NOT NULL,
  CONSTRAINT fk_Tbl_CuentasUsuario_Tbl_Persona1
    FOREIGN KEY (Tbl_Persona_id_Persona)
    REFERENCES Tbl_Persona (id_Persona)
);
-- -----------------------------------------------------
-- Table Tbl_DetalleListaPersonalizada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_DetalleListaPersonalizada (
  idDetalleListaPersonalizada INT NOT NULL,
  Tbl_Productos_idProductos INT NOT NULL,
  Tbl_Productos_Tbl_Categoria_idCategoria INT NOT NULL,
  -- Tbl_Productos_Tbl_Presentaciones_idPresentaciones INT NOT NULL,
  Tbl_ListasPersonalizadas_idListasPersonalizadas INT NOT NULL,
  CONSTRAINT fk_Tbl_DetalleListaPersonalizada_Tbl_Productos1
    FOREIGN KEY (Tbl_Productos_idProductos)
    REFERENCES Tbl_Productos (idProductos)

  CONSTRAINT fk_Tbl_DetalleListaPersonalizada_Tbl_ListasPersonalizadas1
    FOREIGN KEY (Tbl_ListasPersonalizadas_idListasPersonalizadas)
    REFERENCES Tbl_ListasPersonalizadas (idListasPersonalizadas)
);

--Tablas sin saltos de lineas--
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------

-- -----------------------------------------------------
-- Tabla = Tbl_EstadoPedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_EstadoPedido (idEstadoPedido INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,nombre VARCHAR(45) NOT NULL);
-- -----------------------------------------------------
-- Tabla = Tbl_Departamento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Departamento (idDepartamento INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,nombre VARCHAR(45) NOT NULL);
-- -----------------------------------------------------
-- Tabla = Tbl_municipio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_municipio (idMunicipio INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,nombre VARCHAR(45) NOT NULL,Tbl_Departamento_idDepartamento INT NOT NULL,CONSTRAINT fk_Tbl_municipio_Tbl_Departamento1 FOREIGN KEY (Tbl_Departamento_idDepartamento) REFERENCES Tbl_Departamento (idDepartamento));
-- -----------------------------------------------------
-- Tabla = Tbl_Barrio
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Barrio (idBarrio INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,nombre VARCHAR(45) NOT NULL,Tbl_municipio_idMunicipio INT NOT NULL,CONSTRAINT fk_Tbl_Barrio_Tbl_municipio1 FOREIGN KEY (Tbl_municipio_idMunicipio) REFERENCES Tbl_municipio (idMunicipio));
-- -----------------------------------------------------
-- Tabla = Tbl_TipoDocumento
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_TipoDocumento (idTipoDocumento INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,nombre VARCHAR(45) NOT NULL);
-- -----------------------------------------------------
-- Tabla = Tbl_TipoPersona
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_TipoPersona (idTipoPersona INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,nombre VARCHAR(45) NOT NULL);
-- -----------------------------------------------------
-- Tabla = Tbl_Persona
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Persona (id_Persona INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,numero_Documento VARCHAR(15) NOT NULL,estado TINYINT(1) NOT NULL DEFAULT 1,nombre1 VARCHAR(45) NOT NULL,nombre2 VARCHAR(45) NULL,apellido1 VARCHAR(45) NOT NULL,apellido VARCHAR(45) NOT NULL,sexo TINYINT(1) NULL,direccion VARCHAR(45) NOT NULL,fechaNacimiento DATE NOT NULL,correoElectronico VARCHAR(45) NOT NULL,id_Consolidador INT NULL,Tbl_TipoDocumento_idTipoDocumento INT NOT NULL,Tbl_TipoReferido_idTipoPersona INT NOT NULL,CONSTRAINT fk_Tbl_Persona_Tbl_TipoDocumento1 FOREIGN KEY (Tbl_TipoDocumento_idTipoDocumento) REFERENCES Tbl_TipoDocumento (idTipoDocumento) CONSTRAINT fk_Tbl_Persona_Tbl_Persona1 FOREIGN KEY (id_Consolidador) REFERENCES Tbl_Persona (id_Persona) CONSTRAINT fk_Tbl_Persona_Tbl_TipoReferido1 FOREIGN KEY (Tbl_TipoReferido_idTipoPersona) REFERENCES Tbl_TipoPersona (idTipoPersona));
-- -----------------------------------------------------
-- Tabla = Tbl_Sucursal
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Sucursal (idSucursal INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,barrio INT NOT NULL,ciudad INT NOT NULL,departamento INT NOT NULL,calificacion VARCHAR(45) NULL,alias VARCHAR(45) NOT NULL,razonSocial VARCHAR(45) NULL,direccion VARCHAR(45) NOT NULL,encargado VARCHAR(45) NOT NULL,nombreSucursal VARCHAR(45) NOT NULL,suplente VARCHAR(45) NULL,Tbl_Barrio_idBarrio INT NOT NULL,Tbl_Persona_id_Persona INT NOT NULL, CONSTRAINT fk_Tbl_Sucursal_Tbl_Barrio1 FOREIGN KEY (Tbl_Barrio_idBarrio) REFERENCES Tbl_Barrio (idBarrio) CONSTRAINT fk_Tbl_Sucursal_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona));
-- -----------------------------------------------------
-- Tabla = Tbl_Pedidos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Pedidos (idPedidos INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,fechaExpedicion DATE NULL,FechaVencimiento DATE NULL,tipoPago TINYINT(1) NOT NULL,idPlazoPago INT NULL,idEstadoPedido INT NULL,Tbl_PlazoPago_idPlazoPago INT NOT NULL,Tbl_EstadoPedido_idEstadoPedido INT NOT NULL,Tbl_Sucursal_idSucursal INT NOT NULL,plazo_Pago VARCHAR(45) NOT NULL, CONSTRAINT fk_Tbl_Pedidos_Tbl_EstadoPedido1 FOREIGN KEY (Tbl_EstadoPedido_idEstadoPedido) REFERENCES Tbl_EstadoPedido (idEstadoPedido) CONSTRAINT fk_Tbl_Pedidos_Tbl_Sucursal1 FOREIGN KEY (Tbl_Sucursal_idSucursal) REFERENCES Tbl_Sucursal (idSucursal));
-- -----------------------------------------------------
-- Tabla = Tbl_Fabricante
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Fabricante (id_Fabricante INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,nombre VARCHAR(45) NOT NULL,estado TINYINT(1) NOT NULL DEFAULT 1,id_Casa INT NOT NULL, CONSTRAINT fk_Fabricante_idfabricante_idCasa FOREIGN KEY (id_Casa) REFERENCES Tbl_Fabricante (id_Fabricante));
-- -----------------------------------------------------
-- Tabla = Tbl_SubCategoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_SubCategoria ( idSubCategoria INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , nombre VARCHAR(45) NOT NULL, descripcion VARCHAR(45) NOT NULL);
-- -----------------------------------------------------
-- Tabla = Tbl_Categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Categoria ( idCategoria INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE , nombre VARCHAR(45) NOT NULL, descripcion VARCHAR(45) NULL);
-- -----------------------------------------------------
-- Tabla = Tbl_Productos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Productos (idProductos INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,estadoProducto TINYINT(1) NOT NULL DEFAULT 1,existencias INT NOT NULL,nombreProducto VARCHAR(45) NOT NULL,Tbl_Marca_idMarca INT NOT NULL,Tbl_SubCategoria_idSubCategoria INT NOT NULL,precio DOUBLE NOT NULL,Tbl_casa_idTbl_casa INT NOT NULL,Tbl_Categoria_idCategoria INT NOT NULL, CONSTRAINT fk_Tbl_Productos_Tbl_Marca1 FOREIGN KEY (Tbl_Marca_idMarca) REFERENCES Tbl_Fabricante (id_Fabricante) CONSTRAINT fk_Tbl_Productos_Tbl_SubCategoria1 FOREIGN KEY (Tbl_SubCategoria_idSubCategoria) REFERENCES Tbl_SubCategoria (idSubCategoria) CONSTRAINT fk_Tbl_Productos_Tbl_Categoria1 FOREIGN KEY (Tbl_Categoria_idCategoria) REFERENCES Tbl_Categoria (idCategoria));
-- -----------------------------------------------------
-- Tabla = Tbl_Telefonos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Telefonos (idTelefono INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE,numero VARCHAR(45) NOT NULL,Tbl_Sucursal_idSucursal INT NOT NULL, CONSTRAINT fk_Tbl_Telefonos_Tbl_Sucursal1 FOREIGN KEY (Tbl_Sucursal_idSucursal) REFERENCES Tbl_Sucursal (idSucursal));
-- -----------------------------------------------------
-- Tabla = Tbl_parentesco
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_parentesco (idParentesco INT NOT NULL,nombre VARCHAR(45) NOT NULL);
-- -----------------------------------------------------
-- Tabla = Tbl_RangoSalarial
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_RangoSalarial (idRangoSalarial INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,rango_Inferior VARCHAR(45) NULL,rango_Superior VARCHAR(45) NULL);
-- -----------------------------------------------------
-- Tabla = Tbl_Familiar
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Familiar (idFamiliar INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE,fechaNacimimiento DATE NOT NULL,hobies VARCHAR(45) NOT NULL,sexo TINYINT(1) NULL,Tbl_parentesco_idParentesco INT NOT NULL,Tbl_RangoSalarial_idRangoSalarial INT NOT NULL,Tbl_Persona_id_Persona INT NOT NULL,CONSTRAINT fk_Tbl_Perfil_Tbl_parentesco1 FOREIGN KEY (Tbl_parentesco_idParentesco) REFERENCES Tbl_parentesco (idParentesco) CONSTRAINT fk_Tbl_Familiar_Tbl_RangoSalarial1 FOREIGN KEY (Tbl_RangoSalarial_idRangoSalarial) REFERENCES Tbl_RangoSalarial (idRangoSalarial) CONSTRAINT fk_Tbl_Familiar_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona));
-- -----------------------------------------------------
-- Tabla = Tbl_DetallePedido
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_DetallePedido (idDetallePedido INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,cantidadProducto INT NOT NULL DEFAULT 1,precio DOUBLE NOT NULL,Tbl_Productos_idProductos INT NOT NULL,Tbl_Productos_Tbl_Categoria_idCategoria INT NOT NULL,Tbl_Pedidos_idPedidos INT NOT NULL,Tbl_Pedidos_idUsuario INT NOT NULL, CONSTRAINT fk_Tbl_DetallePedido_Tbl_Productos1 FOREIGN KEY (Tbl_Productos_idProductos) REFERENCES Tbl_Productos (idProductos) CONSTRAINT fk_Tbl_DetallePedido_Tbl_Pedidos1 FOREIGN KEY (Tbl_Pedidos_idPedidos) REFERENCES Tbl_Pedidos (idPedidos));
-- -----------------------------------------------------
-- Tabla = Tbl_ListasPersonalizadas
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_ListasPersonalizadas (idListasPersonalizadas INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,nombreListaPersonalizada VARCHAR(45) NOT NULL,estado TINYINT(1) NOT NULL DEFAULT 1,Tbl_Persona_id_Persona INT NOT NULL, CONSTRAINT fk_Tbl_ListasPersonalizadas_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona));
-- -----------------------------------------------------
-- Tabla =  Tbl_Empresa
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_Empresa (idEmpresa INTEGER PRIMARY KEY  AUTOINCREMENT  NOT NULL  UNIQUE ,NIT VARCHAR(20) NOT NULL,correoElectronico VARCHAR(45) NOT NULL,razonSocial VARCHAR(45) NOT NULL,url VARCHAR(45) NULL,Tbl_Persona_id_Persona INT NOT NULL, CONSTRAINT fk_Tbl_Empresa_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona));
-- -----------------------------------------------------
-- Tabla = Tbl_CuentasUsuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_CuentasUsuario (contrasenia VARCHAR(45) NOT NULL,estado TINYINT(1) NOT NULL DEFAULT 1,nunmeroDocumento INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, Tbl_Persona_id_Persona INT NOT NULL, CONSTRAINT fk_Tbl_CuentasUsuario_Tbl_Persona1 FOREIGN KEY (Tbl_Persona_id_Persona) REFERENCES Tbl_Persona (id_Persona));
-- -----------------------------------------------------
-- Tabla = Tbl_DetalleListaPersonalizada
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Tbl_DetalleListaPersonalizada ( idDetalleListaPersonalizada INT NOT NULL, Tbl_Productos_idProductos INT NOT NULL, Tbl_Productos_Tbl_Categoria_idCategoria INT NOT NULL/*, Tbl_Productos_Tbl_Presentaciones_idPresentaciones INT NOT NULL*/, Tbl_ListasPersonalizadas_idListasPersonalizadas INT NOT NULL, CONSTRAINT fk_Tbl_DetalleListaPersonalizada_Tbl_Productos1 FOREIGN KEY (Tbl_Productos_idProductos) REFERENCES Tbl_Productos (idProductos) CONSTRAINT fk_Tbl_DetalleListaPersonalizada_Tbl_ListasPersonalizadas1 FOREIGN KEY (Tbl_ListasPersonalizadas_idListasPersonalizadas) REFERENCES Tbl_ListasPersonalizadas (idListasPersonalizadas));


