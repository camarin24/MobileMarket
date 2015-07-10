-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2015 a las 04:34:37
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `mobilemarket`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `idCategoria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentausuarios`
--

CREATE TABLE IF NOT EXISTS `cuentausuarios` (
`idCuentaUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(30) NOT NULL,
  `contrasenia` varchar(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cuentausuarios`
--

INSERT INTO `cuentausuarios` (`idCuentaUsuario`, `nombreUsuario`, `contrasenia`) VALUES
(1, 'lacuenta', '12345');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fabricante`
--

CREATE TABLE IF NOT EXISTS `fabricante` (
  `id_Fabricante` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `id_Casa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
`idProducto` int(11) NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `descripcion` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `unidades` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `marca` varchar(40) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `imagen` varchar(200) NOT NULL,
  `idMarca` int(11) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idSubcategoria` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `unidades`, `estado`, `marca`, `precio`, `imagen`, `idMarca`, `idCategoria`, `idSubcategoria`) VALUES
(2, 'Ambientador en Spray Aroma Lavanda x 400', 'mantener el ambiente con una fragancia fresca', 15, 1, 'Bon Aire', 6831, 'http://tropi.azurewebsites.net/images/Catalogo/0310023.jpg', 0, 0, 0),
(3, 'Avena en Hojuelas bolsa x 200gr', 'Avena Quaker en Hojuelas para una Alimentacion Saludable y Bebida Refrescante', 50, 1, 'Quaker', 1186, 'http://tropi.azurewebsites.net/images/Catalogo/0160239.jpg', 0, 0, 0),
(4, 'Leche Condensada con Calcio x 100gr', 'Leche Condesada para Preparaciones y Endulzante para el Paladar', 90, 1, 'La Lechera', 1329, 'http://tropi.azurewebsites.net/images/Catalogo/0080015.jpg', 0, 0, 0),
(5, 'Nescafe Tradicional Sobre x 1,5gr Displa', 'Nescafe tradicional para una Combinacion con Leche', 50, 1, 'Nescafe', 2937, 'http://tropi.azurewebsites.net/images/Catalogo/0081028.jpg', 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subcategoria`
--

CREATE TABLE IF NOT EXISTS `subcategoria` (
  `idSubCategoria` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
`idUsuario` int(11) NOT NULL,
  `nombre1` varchar(50) DEFAULT NULL,
  `nombre2` varchar(50) DEFAULT NULL,
  `apellido1` varchar(50) DEFAULT NULL,
  `apellido2` varchar(50) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `alias` varchar(50) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `direccion`, `estado`, `alias`) VALUES
(1, 'cristian', 'alberto', 'marin', 'zapata', 'cr 63 # 61-26 int 116', 1, 'hola'),
(2, 'alejandro', '', 'Sanchez', 'Duran', 'Girardota', 1, 'Alias'),
(3, 'JUan', 'Diego', 'Escobar', 'Londonio', 'San antonio de prado', 1, 'Alias'),
(4, 'Andy', 'Esteban', 'Morales', 'Mejia', 'Aranjuez', 1, 'Alias');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
 ADD PRIMARY KEY (`idCategoria`);

--
-- Indices de la tabla `cuentausuarios`
--
ALTER TABLE `cuentausuarios`
 ADD PRIMARY KEY (`idCuentaUsuario`);

--
-- Indices de la tabla `fabricante`
--
ALTER TABLE `fabricante`
 ADD PRIMARY KEY (`id_Fabricante`), ADD KEY `fk_Fabricante_idfabricante_idCasa_idx` (`id_Casa`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
 ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `subcategoria`
--
ALTER TABLE `subcategoria`
 ADD PRIMARY KEY (`idSubCategoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentausuarios`
--
ALTER TABLE `cuentausuarios`
MODIFY `idCuentaUsuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fabricante`
--
ALTER TABLE `fabricante`
ADD CONSTRAINT `fk_Fabricante_idfabricante_idCasa` FOREIGN KEY (`id_Casa`) REFERENCES `fabricante` (`id_Fabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
