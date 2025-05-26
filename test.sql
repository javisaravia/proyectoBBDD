-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2025 a las 18:52:19
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `test`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bañadores`
--

CREATE TABLE `bañadores` (
  `id` int(11) NOT NULL,
  `Precio` double(100,5) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Talla` varchar(30) NOT NULL,
  `Cantidad` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `bañadores`
--
DELIMITER $$
CREATE TRIGGER `agregar_banador_a_cesta` AFTER INSERT ON `bañadores` FOR EACH ROW INSERT INTO cesta (producto_id, categoria, cantidad)
VALUES (NEW.id, 'bañadores', 1)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bermudas`
--

CREATE TABLE `bermudas` (
  `Precio` double(100,5) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Talla` varchar(30) NOT NULL,
  `Cantidad` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camisas`
--

CREATE TABLE `camisas` (
  `id` int(11) NOT NULL,
  `Precio` double(100,5) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Talla` varchar(30) NOT NULL,
  `Cantidad` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Disparadores `camisas`
--
DELIMITER $$
CREATE TRIGGER `agregar_camisa_a_cesta` AFTER INSERT ON `camisas` FOR EACH ROW BEGIN
  INSERT INTO cesta (producto_id, categoria, cantidad)
  VALUES (NEW.id, 'camisas', 1);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `camisetas`
--

CREATE TABLE `camisetas` (
  `id` int(11) NOT NULL,
  `Precio` int(99) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Talla` varchar(30) NOT NULL,
  `Cantidad` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `camisetas`
--

INSERT INTO `camisetas` (`id`, `Precio`, `Color`, `Talla`, `Cantidad`) VALUES
(1, 11, 'Azul', 'M', 1),
(2, 11, 'Azul', 'M', 1);

--
-- Disparadores `camisetas`
--
DELIMITER $$
CREATE TRIGGER `agregar_camiseta_a_cesta` AFTER INSERT ON `camisetas` FOR EACH ROW INSERT INTO cesta (producto_id, categoria, cantidad)
VALUES (NEW.id, 'camisetas', 1)
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_nueva`
--

CREATE TABLE `categorias_nueva` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cesta`
--

CREATE TABLE `cesta` (
  `cantidad` int(50) NOT NULL,
  `talla` varchar(30) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `producto_id` int(100) NOT NULL,
  `categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cesta`
--

INSERT INTO `cesta` (`cantidad`, `talla`, `nombre`, `producto_id`, `categoria`) VALUES
(1, 'M', '', 0, ''),
(1, 'M', '', 0, ''),
(1, 'M', '', 0, ''),
(1, 'M', '', 0, ''),
(1, 'M', '', 0, ''),
(1, 'M', '', 0, ''),
(1, 'M', '', 0, ''),
(2, 'S', '', 0, ''),
(6, 'L', 'CAMISETA AZUL OSCURO 20€', 0, ''),
(5, 'M', 'CAMISETA BLANCA 30€', 0, ''),
(1, 'M', 'CAMISETA NEGRA 22€', 0, ''),
(3, 'M', 'CAMISETA AZUL OSCURO 20€', 0, ''),
(4, 'D', 'CAMISETA AZUL OSCURO 20€', 0, ''),
(7, 'A', 'CAMISETA GRIS 100% 24€', 0, ''),
(5, 'm', 'CAMISETA GRIS 100% 24€', 0, ''),
(4, 'n', 'BAÑADOR DE RAYAS VERDES 2€', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pantalones`
--

CREATE TABLE `pantalones` (
  `Precio` double(100,5) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Talla` varchar(30) NOT NULL,
  `Cantidad` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `categoria_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ropa_interior`
--

CREATE TABLE `ropa_interior` (
  `Precio` double(100,5) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Talla` varchar(30) NOT NULL,
  `Cantidad` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bañadores`
--
ALTER TABLE `bañadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `camisas`
--
ALTER TABLE `camisas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `camisetas`
--
ALTER TABLE `camisetas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `categorias_nueva`
--
ALTER TABLE `categorias_nueva`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bañadores`
--
ALTER TABLE `bañadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `camisas`
--
ALTER TABLE `camisas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `camisetas`
--
ALTER TABLE `camisetas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias_nueva`
--
ALTER TABLE `categorias_nueva`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
