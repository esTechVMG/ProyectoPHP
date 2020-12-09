-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2019 a las 19:18:18
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_recetas`
--
CREATE DATABASE IF NOT EXISTS `bd_recetas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bd_recetas`;

START TRANSACTION;

CREATE TABLE `administrador` (
  `id_admin` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id_admin`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glosario`
--

CREATE TABLE `glosario` (
  `expresion` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `definicion` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `glosario`
--

INSERT INTO `glosario` (`expresion`, `definicion`) VALUES
('Aderezar', 'Agregar sal, aceite, vinagre, especias, etc, a ensaladas u otras preparaciones frías.'),
('Aliñar', 'Aderezar o sazonar.'),
('Baño maría', 'Baño de agua usado para cocinar lentamente alimentos que se encuentran dentro de un envase rodeado con agua hirviendo de un recipiente de mayor tamaño.'),
('Empanar ', 'Pasar por harina, huevo batido y pan rallado un alimento.'),
('Flamear', 'Pasar por llama, sin humo, un alimento o preparación.'),
('Gratinar', 'Hacer que un alimento se tueste por encima en el horno.'),
('Juliana', 'Cortar principalmente las verduras para ensaladas o guarnición de otros alimentos en tiras finas(de 3 a 5 centímetros de largo por 1 a 3 milímetros de grueso).'),
('Rebozar', 'Bañar un alimento en huevo batido, harina, miel, etc.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `id_imag` int(10) UNSIGNED NOT NULL,
  `nombre_imagen` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ruta` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ancho` double DEFAULT NULL,
  `alto` double DEFAULT NULL,
  `descripcion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ingrediente_id_ingred` int(10) UNSIGNED DEFAULT NULL,
  `receta_id_receta` int(10) UNSIGNED DEFAULT NULL,
  `restaurante_id_rest` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `imagen`
--

INSERT INTO `imagen` (`id_imag`, `nombre_imagen`, `ruta`, `ancho`, `alto`, `descripcion`, `ingrediente_id_ingred`, `receta_id_receta`, `restaurante_id_rest`) VALUES
(1, 'Arroz a la cubana1', 'src=\'fotos/arrozCubana1.jpg\'', 540, 359, 'Imagen 1 de arroz a la cubana.', NULL, 1, NULL),
(2, 'Arroz a la cubana2', 'src=\'fotos/arrozCubana2.jpg\'', 350, 262, 'Imagen 1 de arroz a la cubana2.', NULL, 1, NULL),
(3, 'MiradordeMorayma', 'src=\'fotos/MiradordeMorayma.jpg\'', 500, 500, 'Restaurante MiradordeMorayma.jpg', NULL, NULL, 1),
(4, 'Romerijo', 'src=\'fotos/Romerijo.jpg\'', 358, 234, 'Restaurante Romerijo', NULL, NULL, 2),
(5, 'Restaurante Tintero', 'src=\'fotos/Tintero.jpg\'', 500, 375, 'Restaurante tintero ', NULL, NULL, 3),
(6, 'Los Moriscos', 'src=\'fotos/LosMoriscos.jpg\'', 337, 450, NULL, NULL, NULL, 6),
(7, 'Tragabuches', 'src=\'fotos/Tragabuches.jpg\'', 337, 450, NULL, NULL, NULL, 7),
(8, 'Anchoas fritas', 'src=\'fotos/anchoasFritas1.jpg\'', 240, 180, 'Anchoas fritas para la receta 2.', NULL, 2, NULL),
(9, 'Anchoas fritas 2', 'src=\'fotos/anchoasFritas2.jpg\'', 400, 255, 'Anchoas fritas para la receta 2.', NULL, 2, NULL),
(10, 'Bacalao con tomate', 'src=\'fotos/bacalaoConTomate1.jpg\'', 400, 300, 'Imagen 1 de bacalao con tomate.', NULL, 3, NULL),
(11, 'Bacalao con tomate', 'src=\'fotos/bacalaoConTomate2.jpg\'', 400, 300, 'Bacalao con tomate para receta 3.', NULL, 3, NULL),
(12, 'Bacalao con tomate', 'src=\'fotos/bacalaoConTomate3.jpg\'', 256, 192, 'Bacalao con tomate para receta 3.', NULL, 3, NULL),
(13, 'Arroz blanco', 'src=\'fotos/arrozBlanco.jpeg\'', 800, 599, 'Arroz, ingrediente 1.', 1, NULL, NULL),
(14, 'Arroz blanco', 'src=\'fotos/arrozBlanco2.jpeg\'', 366, 213, NULL, 1, NULL, NULL),
(15, 'Huevo frito', 'src=\'fotos/huevoFrito.jpg\'', 400, 300, 'Huevo frito para ingrediente 3.', 3, NULL, NULL),
(16, 'Tomate frito', 'src=\'fotos/tomateFrito.jpg\'', 753, 492, 'Ingrediente 4', 4, NULL, NULL),
(17, 'Plátano', 'src=\'fotos/platano.jpg\'', 390, 314, 'Ingrediente 5', 5, NULL, NULL),
(18, 'Salchicha Frankfurt', 'src=\'fotos/Frankfurt.jpg\'', 640, 480, 'Ingrediente 2', 2, NULL, NULL),
(19, 'Anchoas', 'src=\'fotos/anchoas.jpg\'', 400, 400, 'Ingrediente 6', 6, NULL, NULL),
(20, 'Ajo', 'src=\'fotos/ajo.jpg\'', 259, 194, 'Ingrediente 7', 7, NULL, NULL),
(21, 'Aceite de oliva', 'src=\'fotos/jarritaAceiteOliva.jpg\'', 230, 281, 'Ingrediente 8.', 8, NULL, NULL),
(22, 'Sal', 'src=\'fotos/sal.jpg\'', 500, 441, 'Ingrediente 9', 9, NULL, NULL),
(23, 'Guindilla', 'src=\'fotos/guindilla.jpg\'', 300, 174, 'ingrediente 10', 10, NULL, NULL),
(24, 'Bacalao', 'src=\'fotos/bacalao.jpg\'', 600, 424, 'Ingrediente 11', 11, NULL, NULL),
(25, 'Cebolla', 'src=\'fotos/cebolla.jpg\'', 500, 328, 'ingrediente 12', 12, NULL, NULL),
(26, 'Perejil', 'src=\'fotos/perejil.jpg\'', 500, 500, 'Ingrediente 13', 13, NULL, NULL),
(27, 'Habichuelas con castañas', 'src=\'fotos/HabichuelasCastañas.jpg\'', 630, 441, NULL, NULL, 4, NULL),
(28, 'Huevos a la sevillana', 'src=\'fotos/HuevosSevillanos.jpg\'', 566, 336, NULL, NULL, 5, NULL),
(29, 'Gambas a la plancha', 'src=\'fotos/GambasPlancha.jpg\'', 500, 375, NULL, NULL, 6, NULL),
(31, 'Chopitos fritos', 'src=\'fotos/ChopitosFritos.jpeg\'', 640, 480, NULL, NULL, 7, NULL),
(32, 'Chopitos fritos', 'src=\'fotos/ChopitosFritos2.jpg\'', 500, 375, NULL, NULL, 7, NULL),
(33, 'Chopitos fritos', 'src=\'fotos/ChopitosFritos3.jpg\'', 1600, 1200, NULL, NULL, 7, NULL),
(34, 'Migas', 'src=\'fotos/Migas.jpg\'', 349, 262, NULL, NULL, 8, NULL),
(35, 'Migas', 'src=\'fotos/Migas2.jpg\'', 3296, 2472, NULL, NULL, 8, NULL),
(36, 'Salmorejo', 'src=\'fotos/Salmorejo.jpg\'', 500, 375, NULL, NULL, 9, NULL),
(37, 'Samorejo', 'src=\'fotos/Salmorejo2.jpg\'', 259, 194, NULL, NULL, 9, NULL),
(38, 'Habichuelas Blancas', 'src=\'fotos/HabichuelasBlancas.jpg\'', 600, 450, NULL, 14, NULL, NULL),
(39, 'Castañas pilongas', 'src=\'fotos/Castañas.jpg\'', 240, 180, NULL, 15, NULL, NULL),
(40, 'Calabaza troceada', 'src=\'fotos/CalabazaTroceada.jpg\'', 2816, 2112, NULL, 16, NULL, NULL),
(41, 'Patata', 'src=\'fotos/Patata.jpg\'', 320, 320, NULL, 17, NULL, NULL),
(42, 'Azúcar moreno', 'src=\'imagentes/AzucarMoreno.jpg\'', 300, 216, NULL, 18, NULL, NULL),
(43, 'Chorizo', 'src=\'imagenes/Chorizo.jpg\'', 262, 192, NULL, 19, NULL, NULL),
(44, 'Chorizo', 'src=\'fotos/Chorizo2.jpg\'', 600, 600, NULL, 19, NULL, NULL),
(45, 'Pimiento rojo', 'src=\'fotos/PimientoRojo.jpg\'', 600, 600, NULL, 20, NULL, NULL),
(46, 'Limón', 'src=\'fotos/Limon.jpg\'', 275, 183, NULL, 22, NULL, NULL),
(47, 'Gambas Huelva', 'src=\'fotos/Gambas.jpg\'', 1024, 768, NULL, 21, NULL, NULL),
(48, 'Chopitos', 'src=\'fotos/Chopitos.jpg\'', 740, 490, NULL, 23, NULL, NULL),
(49, 'Harina de sémola', 'src=\'fotos/Harina.jpg\'', 500, 375, NULL, 24, NULL, NULL),
(50, 'Agua', 'src=\'fotos/Agua.jpg\'', 285, 300, NULL, 25, NULL, NULL),
(51, 'Calamar', 'src=\'fotos/Calamar.jpg\'', 1600, 1042, NULL, 26, NULL, NULL),
(52, 'Merluza', 'src=\'fotos/Merluza.jpg\'', 395, 264, NULL, 27, NULL, NULL),
(53, 'Pan', 'src=\'fotos/Pan.jpg\'', 250, 188, NULL, 28, NULL, NULL),
(54, 'Vinagre', 'src=\'fotos/Vinagre.jpg\'', 330, 280, NULL, 29, NULL, NULL),
(55, 'Jamón serrano', 'src=\'fotos/JamonSerrano.jpg\'', 500, 375, NULL, 30, NULL, NULL),
(56, 'Gambas a la plancha', 'src=\'fotos/GambasPlancha2.jpg\'', NULL, NULL, NULL, NULL, 6, NULL),
(58, 'paella.jpeg', 'src=\'fotos/paella.jpeg\'', 1600, 1200, NULL, NULL, 16, NULL),
(59, 'patatas_asadas.jpg', 'src=\'fotos/patatas_asadas.jpg\'', 640, 453, NULL, NULL, 17, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingrediente`
--

CREATE TABLE `ingrediente` (
  `id_ingred` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `calorias_100g` double DEFAULT NULL,
  `proteinas_100g` double DEFAULT NULL,
  `hidratos_100g` double DEFAULT NULL,
  `grasas_saturadas_100g` double DEFAULT NULL,
  `grasas_totales_100g` double DEFAULT NULL,
  `grasas_monoinsaturadas_100g` double DEFAULT NULL,
  `grasas_poliinsaturadas_100g` double DEFAULT NULL,
  `sodio_100g` double DEFAULT NULL,
  `fibra_100g` double DEFAULT NULL,
  `observaciones` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `validado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ingrediente`
--

INSERT INTO `ingrediente` (`id_ingred`, `nombre`, `calorias_100g`, `proteinas_100g`, `hidratos_100g`, `grasas_saturadas_100g`, `grasas_totales_100g`, `grasas_monoinsaturadas_100g`, `grasas_poliinsaturadas_100g`, `sodio_100g`, `fibra_100g`, `observaciones`, `validado`) VALUES
(1, 'Arroz blanco de cocción rápida', 349, 6.9, 78.2, 0.15, 0.6, 0.17, 0.2, 0.04, 1.4, NULL, 0),
(2, 'Salchicha Frankfurt', 243, 13.1, 1.4, 7.37, 20.5, 8.2, 1.9, 1.151, 0, NULL, 0),
(3, 'Huevo', 162, 12.68, 0.68, 3.3, 12.1, 4.9, 1.8, 0.144, 0, NULL, 0),
(4, 'Tomate', 38.1, 2.3, 5.55, 0.07, 0.5, 0.08, 0.2, 0.59, 1.2, NULL, 0),
(5, 'Plátano', 95.03, 1.06, 20.8, 0.12, 0.27, 0.04, 0.09, 0.001, 2.55, NULL, 0),
(6, 'Anchoas', 253, 28.62, 0.37, 2.8, 15.2, 2.8, 8.3, 3.93, 0, 'Anchoas para receta 2.', 0),
(7, 'Ajo', 119, 4.3, 24.3, 0.05, 0.23, 0.03, 0.1, 0.19, 1.2, 'Ajo para la receta 2.', 0),
(8, 'Aceite de oliva', 899, 1, 0, 14.3, 99.9, 73, 8.2, 0, 0, 'Aceite de oliva.', 0),
(9, 'Sal', 0, 0, 0, 0, 0, 0, 0, 38.85, 0, 'Sal.', 0),
(10, 'Guindilla', 47.2, 1.87, 6.7, 0.1, 1.1, 0.06, 0.6, 9, 1.5, NULL, 0),
(11, 'Bacalao', 79.8, 17.68, 0, 0.13, 1, 0.1, 0.39, 72, 0, 'Bacalao para la receta 3.', 0),
(12, 'Cebolla', 31.85, 1.19, 5.3, 0.09, 0.25, 0, 1.13, 0.003, 1.8, 'Cebolla para la receta 3.', 0),
(13, 'Perejil', 59.09, 4.43, 7.4, 0.039, 0.36, 0.009, 0.19, 0.37, 4.25, 'Perejil para la receta 3.', 0),
(14, 'Habichuelas blancas', 50.4, 5.4, 4.2, 0.03, 0.2, 0.04, 0.09, 0.18, 5.1, NULL, 0),
(15, 'Castañas pilongas', 190, 2.65, 36.5, 0.4, 2.2, 0.6, 0.6, 0.11, 6.7, NULL, 0),
(16, 'Calabaza troceada', 28.37, 1.13, 4.59, 0.07, 0.13, 0.02, 0.01, 0.031, 2.16, NULL, 0),
(17, 'Patata', 73.59, 2.34, 14.8, 0.03, 0.11, 0, 0.06, 0.027, 2.07, NULL, 0),
(18, 'Azúcar moreno', 390, 0, 97.6, 0, 0, 0, 0, 0.04, 0, NULL, 0),
(19, 'Chorizo', 356, 21.18, 1.9, 12.36, 29.3, 2.5, 0.2, 2.3, 0, NULL, 0),
(20, 'Pimiento rojo', 32.9, 1.25, 4.2, 0.3, 0.9, 1, 0.3, 0.004, 1.5, NULL, 0),
(21, 'Gambas de Huelva', 94.2, 18, 1.5, 0.3, 1.8, 0.4, 0.6, 0.305, 0, NULL, 0),
(22, 'Limón', 27.66, 0.69, 3.16, 0.04, 0.3, 0.01, 0.09, 0.0019, 4.7, NULL, 0),
(23, 'Chopitos', 80.4, 16.25, 0.7, 0.41, 1.4, 0.1, 0.5, 0.11, 0, NULL, 0),
(24, 'Harina de sémola', 341, 9.86, 70.6, 0.16, 1.2, 0.13, 0.51, 0.002, 4.28, NULL, 0),
(25, 'Agua', 0, 0, 0, 0, 0, 0, 0, 0.001, 0, NULL, 0),
(26, 'Calamar', 80.4, 16.25, 0.7, 0.41, 1.4, 0.1, 0.5, 0.11, 0, NULL, 0),
(27, 'Merluza', 63.9, 11.93, 0, 0.35, 1.8, 0.43, 0.46, 0.101, 0, NULL, 0),
(28, 'Pan', 261, 8.47, 51.5, 0.39, 1.6, 0.28, 0.34, 0.54, 3.5, NULL, 0),
(29, 'Vinagre', 4, 0.4, 0.6, 0, 0, 0, 0, 0.02, 0, NULL, 0),
(30, 'Jamón serrano', 136, 21.37, 0, 2.7, 5.6, 0.66, 0.35, 2.65, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_opcionales`
--

CREATE TABLE `ingredientes_opcionales` (
  `id_ingred` int(10) UNSIGNED NOT NULL,
  `id_receta` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `medida` varchar(50) CHARACTER SET utf8 NOT NULL,
  `aclaraciones` text COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ingredientes_opcionales`
--

INSERT INTO `ingredientes_opcionales` (`id_ingred`, `id_receta`, `cantidad`, `medida`, `aclaraciones`) VALUES
(5, 1, 1, 'unidad', 'Plátano para el arroz a la cubana.'),
(10, 2, 10, 'gramos', 'Receta 2 guindilla.'),
(13, 3, 10, 'gramos', 'Perejil para receta 3.'),
(22, 6, 1, 'unidad', NULL),
(22, 7, 1, 'unidad', NULL),
(22, 16, 1, 'unidad', NULL),
(26, 8, 200, 'gramos', NULL),
(27, 8, 150, 'gramos', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_principales`
--

CREATE TABLE `ingredientes_principales` (
  `id_ingred` int(10) UNSIGNED NOT NULL,
  `id_receta` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL,
  `medida` varchar(50) CHARACTER SET utf8 NOT NULL,
  `aclaraciones` text COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ingredientes_principales`
--

INSERT INTO `ingredientes_principales` (`id_ingred`, `id_receta`, `cantidad`, `medida`, `aclaraciones`) VALUES
(1, 1, 300, 'gramos', 'Arroz blanco para arroz a la cubana.'),
(1, 16, 200, 'gramos', NULL),
(1, 18, 20, 'gramos', NULL),
(2, 1, 150, 'gramos', 'Salchicha Frankfurt para el arroz a la cubana.'),
(2, 18, 2, 'unidad', NULL),
(3, 1, 1, 'unidad', 'Huevo frito para arroz a la cubana.'),
(3, 5, 6, 'unidad', NULL),
(3, 9, 3, '', NULL),
(4, 1, 100, 'gramos', 'Tomate frito para el arroz a la cubana.'),
(4, 3, 150, 'gramos', 'Tomate frito para la receta 3.'),
(4, 9, 100, 'gramos', NULL),
(6, 2, 250, 'gramos', 'Receta dos anchoas.'),
(7, 2, 50, 'gramos', 'Receta 2 ajos.'),
(7, 3, 50, 'gramos', 'Ajos para la receta 3.'),
(7, 8, 30, 'gramos', NULL),
(7, 9, 10, 'gramos', NULL),
(8, 2, 100, 'gramos', 'Receta 2 aceite de oliva.'),
(8, 3, 150, 'gramos', 'Aceite para la receta 3.'),
(8, 4, 250, 'gramos', NULL),
(8, 5, 250, 'gramos', NULL),
(8, 6, 50, 'gramos', NULL),
(8, 7, 150, 'gramos', NULL),
(8, 8, 100, 'gramos', NULL),
(8, 9, 150, 'gramos', NULL),
(8, 16, 10, 'gramos', NULL),
(8, 17, 1, 'gramos', NULL),
(9, 2, 15, 'gramos', 'Receta 2 sal.'),
(9, 3, 10, 'gramos', 'Sal para la receta 3.'),
(9, 4, 10, 'gramos', NULL),
(9, 5, 10, 'gramos', NULL),
(9, 6, 30, 'gramos', NULL),
(9, 7, 10, 'gramos', NULL),
(9, 8, 10, 'gramos', NULL),
(9, 16, 5, 'gramos', NULL),
(9, 17, 5, 'gramos', NULL),
(9, 18, 1, 'gramos', NULL),
(10, 16, 1, 'unidad', NULL),
(11, 3, 400, 'gramos', 'Bacalao para la receta 3.'),
(11, 16, 100, 'gramos', NULL),
(12, 3, 50, 'gramos', 'cebolla para la receta 3.'),
(12, 4, 50, '', NULL),
(14, 4, 500, 'gramos', NULL),
(15, 4, 300, 'gramos', NULL),
(16, 4, 300, 'gramos', NULL),
(17, 4, 300, 'gramos', NULL),
(17, 17, 2, 'unidad', NULL),
(18, 4, 10, 'gramos', NULL),
(19, 5, 100, 'gramos', NULL),
(20, 5, 250, 'gramos', NULL),
(20, 8, 100, 'gramos', NULL),
(20, 16, 1, 'unidad', NULL),
(21, 6, 500, 'gramos', NULL),
(23, 7, 250, 'gramos', NULL),
(24, 8, 500, 'gramos', NULL),
(25, 8, 500, 'gramos', NULL),
(28, 9, 250, 'gramos', NULL),
(29, 9, 10, 'gramos', NULL),
(30, 9, 50, 'gramos', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `nombre`) VALUES
(1, 'HUELVA'),
(2, 'CADIZ'),
(3, 'ALMERIA'),
(4, 'GRANADA'),
(5, 'CORDOBA'),
(6, 'MALAGA'),
(7, 'JAEN'),
(8, 'SEVILLA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id_receta` int(10) UNSIGNED NOT NULL,
  `titulo` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `duracion` int(10) UNSIGNED DEFAULT NULL,
  `dificultad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `preparacion` text COLLATE utf8_spanish_ci NOT NULL,
  `horno` tinyint(1) DEFAULT NULL,
  `batidora` tinyint(1) DEFAULT NULL,
  `microondas` tinyint(1) DEFAULT NULL,
  `thermomix` tinyint(1) DEFAULT NULL,
  `celiacos` tinyint(1) DEFAULT NULL,
  `light` tinyint(1) DEFAULT NULL,
  `vegetariana` tinyint(1) DEFAULT NULL,
  `vegana` tinyint(1) DEFAULT NULL,
  `validada` tinyint(1) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL,
  `comensales` int(10) UNSIGNED NOT NULL,
  `observaciones` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `numusuario_id_usuario` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id_receta`, `titulo`, `duracion`, `dificultad`, `preparacion`, `horno`, `batidora`, `microondas`, `thermomix`, `celiacos`, `light`, `vegetariana`, `vegana`, `validada`, `fecha`, `comensales`, `observaciones`, `numusuario_id_usuario`) VALUES
(1, 'Arroz a la cubana', 20, 'Fácil', 'Freímos los huevos en una sartén con abundante aceite caliente, por otro lado freímos las salchichas hasta que se doren.\r\nPreparamos el arroz en el microondas.\r\nMontamos el plato con un poco de arroz con tomate por encima y el huevo frito y las salchichas acompañándolo.\r\nTambién se podrá poner plátano frito que se ajusta más a la receta original.', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-06-04', 3, NULL, 2),
(2, 'Anchoas fritas', 10, 'Muy fácil', 'Primero quitamos la cabeza y las tripas a las anchoas, las lavamos bien y las sazonamos con sal.\r\nLuego, en una sartén con bastante aceite, freímos los ajos y la guindilla. Antes de que queden doraditos, echamos las anchoas. Las freímos vuelta y vuelta.\r\nServimos bien calientes.', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-06-03', 3, 'Anchoas fritas.', NULL),
(3, 'Bacalao con tomate', 25, 'Fácil', 'El día anterior a la preparación del plato, dejamos el bacalao puesto en remojo y le vamos cambiando el agua.\r\nPrimero ponemos agua a hervir y escaldamos el bacalao bien escurrido, para poder quitarle bien la piel y las espinas. Luego lo troceamos.\r\nA continuación freímos en aceite las cebollas bien picadas, y justo antes de que se doren, añadimos el tomate y el perejil, también picados. Agregamos un poquito de sal y pimienta.\r\nLuego pasamos el sofrito de tomate por la batidora. Aparte, machacamos bien los ajos y los freímos un poco en aceite, en una cazuela de barro.\r\nPor último, incorporamos el pescado y antes de que tome color, agregamos la salsa de tomate. Dejamos cocinar unos minutos y servimos caliente.', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-06-05', 2, NULL, NULL),
(4, 'Potaje de habichuelas blancas con castañas', 60, 'Difícil', 'Las habichuelas se dejan en remojo con agua y sal la noche anterior de hacer el guiso. Ya el siguiente día, lo primero es pelar las castañas. Se les quita la piel dura y de color marrón que llevan y luego el pellejito que va debajo. Si este pellejo sale de forma fácil es cuando se les llama a las castañas pilongas, que son las buenas para este guiso.\r\nUna vez peladas las castañas se ponen estas enteras o partidas en mitades a cocer con las habichuelas blancas y el aceite. Dejamos a fuego moderado hasta que las habichuelas están tiernas.\r\nFinalmente se incorpora la calabaza pelada y partida a tacos al igual que el boniato o la patata. Se añade el azúcar, la sal y las especias y se deja a fuego hasta que estén blandas la calabaza y las patatas o el boniato, unos treinta minutos. El potaje se toma caliente, ese mismo día o se puede dejar para el siguiente.\r\nEste peculiar guiso es común a toda la provincia. Aunque su invento es anterior (se tiene constancia de potajes dulces en el siglo XIX) este plato se hizo habitual en la Posguerra española, en la primera mitad del siglo XX. La escasez hacia que con los ingredientes que había se hicieran los guisos que se convertían en comida única fueran dulces, como en este caso, o salados. Por tanto este potaje podía consumirse como plato para el almuerzo o también como postre.', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-06-04', 2, NULL, NULL),
(5, 'Huevos a la sevillana', 30, 'Media', 'Se asan los pimientos sobre la chapa o en el horno y cuando están se envuelven en un paño durante una hora.\r\nPasada ésta se les quita la piel y semillas y se hacen tiras.\r\nEn una sartén se pone el aceite y se fríen los huevos y se dejan que escurran en una fuente con un paño.Se quita el aceite de la sartén y en poca grasa se rehoga el chorizo cortado en doce rodajas, se sacan los trozos y en la misma grasa se rehogan los pimientos.En una fuente se ponen los pimientos, encima, en círculos, los huevos fritos y en cada uno dos rodajas de chorizo con simetría.\r\n', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-06-05', 3, NULL, NULL),
(6, 'Gambas a la plancha', 20, 'Muy fácil', 'Ponemos una sartén amplia o plancha a calentar. Cuando esté bien caliente echamos un chorro de aceite y añadimos las gambas. Al minuto le damos la vuelta a las gambas y ponemos una pizca de sal. \r\nSi queremos es el momento de rociarlas con el zumo de medio limón.  No las haremos más de un minuto por cada lado,  o se secarán. Servir recién hechas.', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-06-05', 4, '', NULL),
(7, 'Chopitos fritos', 20, 'Media', 'La preparación es muy sencilla, unos chopitos frescos, se lavan y limpian bien, se añade sal al gusto, se enharinan, se fríen en la freidora o sartén con mucho aceite y ya los tenemos listos. Normalmente se sirven con un trozo de limón en el plato por si nos gusta con un poco de sabor a limón.\r\n', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-06-06', 4, '', NULL),
(8, 'Migas de harina de sémola', 40, 'Fácil', 'Bien, se sofríe el pimiento en tiras en una cazuela (capaz) con aceite de oliva. Una vez haya tomado color se echarán los ajos machacados, golpeados, rajados o partidos. Lo ideal ahora es que usemos aceite dónde hayamos frito pescado y sólo una vez (si no queda fuerte de sabor). Por eso lo mejor es que rehoguemos primero la verdura con un poco de aceite de oliva fresco, y mientras friamos el pescado aparte (yo uso una sartén porque en la cazuela se me pega). Quizás lo ideal es freír un trocito de pescado que además nos sirva de aperitivo.\r\nUna vez frito, y rehogada en la cazuela la verdura, sacaremos los pimientos y los reservaremos. Es ahora cuando echaremos el aceite del pescado sobre los ajos y pondremos el agua con sal a cocer.\r\nUna vez esté hirviendo echaremos poco a poco la harina, y removeremos a la vez. Notaremos que llegará un momento en que la harina empiece a espesar. Desde aquí removeremos ininterrumpidamente estas gachamigas gracias a una paleta de cocina y durante 10-15 minutos.\r\n\r\nMenearemos la cazuela, removeremos, y así hasta que echemos todo y se desmenuce bien. Conviene levantar la gacha, romperla con la paleta, tirar con ellas para arriba, para abajo, remover, menear, así hasta que cuajen.\r\nUna vez cuajadas echaremos las tiras de pimiento y removeremos las migas brevemente. Serviremos. Colocar los pescados por encima, previamente los habremos hecho un poco más con una gotas de aceite. Añadir también calamares fritos.', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2012-06-06', 2, '', NULL),
(9, 'Salmorejo', 30, 'Fácil', 'En el vaso de la batidora ponemos el pan, los tomates pelados, el ajo, el aceite de oliva, la sal y el vinagre (con cuidado de no pasarnos en estos dos últimos ingredientes). Batimos muy bien obteniendo una mezcla fina y espesa. Aderezamos de sal y vinagre si hiciera falta. Dejamos enfriar.\r\nFinalmente colocamos el salmorejo en una cazuela de barro. Adornamos con los huevos duros troceados y el jamón picado. Rematamos con un chorreón de aceite de oliva por encima. Servimos.', 0, 1, 0, 1, 0, 1, 1, 0, 1, '2012-06-05', 4, '', NULL),
(16, 'Paella', 60, 'Muy fácil', 'Echar salsa. Cuando empiece a hervir le echamos el marisco para que tome sabor junto con el pimiento y el bacalao, una vez este todo mezclado echamos el arroz y esperamos hasta que se haga.', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2019-12-01', 4, NULL, NULL),
(17, 'Patatas asadas', 30, 'Muy fácil', 'Poner las patatas cortadas por la mitad en una bandeja. Después echar sal y aceite y meter en el horno a 180 grados durante 30 minutos.', 1, 0, 0, 0, 0, 0, 0, 0, 1, '2019-12-01', 2, NULL, NULL),
(18, 'Arroz blanco con salchichas', 10, 'Muy fácil', 'Cocer el arroz y después echar salchichas', 0, 0, 0, 0, 0, 0, 0, 0, 1, '2019-12-01', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas_de_restaurantes`
--

CREATE TABLE `recetas_de_restaurantes` (
  `receta_id_receta` int(10) UNSIGNED NOT NULL,
  `id_rest` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `recetas_de_restaurantes`
--

INSERT INTO `recetas_de_restaurantes` (`receta_id_receta`, `id_rest`) VALUES
(1, 2),
(1, 3),
(2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_provincia`
--

CREATE TABLE `receta_provincia` (
  `receta_id_receta` int(10) UNSIGNED NOT NULL,
  `provincia_id_provincia` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `receta_provincia`
--

INSERT INTO `receta_provincia` (`receta_id_receta`, `provincia_id_provincia`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(4, 2),
(6, 1),
(7, 1),
(7, 3),
(7, 6),
(8, 4),
(9, 5),
(9, 6),
(9, 7),
(16, 6),
(17, 7),
(18, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_tipo`
--

CREATE TABLE `receta_tipo` (
  `id_receta` int(10) UNSIGNED NOT NULL,
  `id_tipo_receta` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `receta_tipo`
--

INSERT INTO `receta_tipo` (`id_receta`, `id_tipo_receta`) VALUES
(1, 1),
(1, 3),
(1, 9),
(2, 2),
(2, 6),
(2, 9),
(3, 2),
(3, 6),
(3, 9),
(4, 8),
(4, 13),
(5, 6),
(5, 9),
(6, 8),
(6, 12),
(6, 14),
(7, 6),
(7, 9),
(7, 14),
(8, 2),
(8, 5),
(8, 6),
(8, 8),
(8, 12),
(8, 14),
(9, 5),
(9, 7),
(9, 11),
(9, 12),
(16, 1),
(16, 14),
(17, 9),
(18, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `restaurante`
--

CREATE TABLE `restaurante` (
  `id_rest` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `especialidad` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provincia` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` int(12) UNSIGNED DEFAULT NULL,
  `longitud` double DEFAULT NULL,
  `latitud` double DEFAULT NULL,
  `observaciones` text COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `restaurante`
--

INSERT INTO `restaurante` (`id_rest`, `nombre`, `especialidad`, `ciudad`, `provincia`, `direccion`, `telefono`, `longitud`, `latitud`, `observaciones`) VALUES
(1, 'Restaurante Mirador de Morayma ', 'Pescado', 'Granada', 'Granada', 'Pianista García Carrillo, 2', 958228290, -3.589937, 37.180867, NULL),
(2, 'Restaurante Romerijo', 'Marisco', 'El Puerto de Santa María', 'Cádiz', 'Ribera Del Marisco, 1', 956541254, -6.222438, 36.599673, NULL),
(3, 'Restaurante Tintero', 'Pescado', 'Málaga', 'Málaga', 'Carretera Almería', 952297073, -4.337836, 36.721803, NULL),
(4, 'Taberna el Potro', 'Carne', 'Córdoba', 'Córdoba', 'Lineros, 2', 957473495, -4.774634, 37.880781, NULL),
(5, 'Restaurante Bar Pizzería Sierra de Almería', 'Marisco', 'Almería', 'Almería', 'Calle Santiago, 56', 950224241, -2.449992, 36.842413, NULL),
(6, 'Restaurante Los Moriscos', 'Arroz', 'Motril', 'Granada', 'Urbanización Playa Granada', 958820347, -3.526338, 36.74677, NULL),
(7, 'Restaurante Tragabuches', 'Carne', 'Ronda', 'Málaga', 'José Aparicio, 1', 902404200, -5.166582, 36.741389, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_receta`
--

CREATE TABLE `tipo_receta` (
  `id_tipo_receta` int(10) UNSIGNED NOT NULL,
  `tipos_receta` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tipo_receta`
--

INSERT INTO `tipo_receta` (`id_tipo_receta`, `tipos_receta`) VALUES
(1, 'Arroz'),
(2, 'Pescado'),
(3, 'Pasta'),
(4, 'Carne'),
(5, 'Verduras'),
(6, 'Fritos'),
(7, 'Bebidas'),
(8, 'Primer plato'),
(9, 'Segundo Plato'),
(10, 'Postre'),
(11, 'Ensaladas'),
(12, 'Entrantes'),
(13, 'Potajes'),
(14, 'Mariscos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave` varchar(45) COLLATE utf8_spanish_ci NOT NULL,
  `ciudad` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `pais` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` int(10) UNSIGNED DEFAULT NULL,
  `ocupacion` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nivel` tinyint(1) DEFAULT NULL,
  `observaciones` text COLLATE utf8_spanish_ci DEFAULT NULL,
  `administrador_id_admin` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indices de la tabla `glosario`
--
ALTER TABLE `glosario`
  ADD PRIMARY KEY (`expresion`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`id_imag`),
  ADD KEY `fk_imagen_ingrediente` (`ingrediente_id_ingred`),
  ADD KEY `fk_imagen_receta` (`receta_id_receta`),
  ADD KEY `fk_imagen_restaurante` (`restaurante_id_rest`);

--
-- Indices de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  ADD PRIMARY KEY (`id_ingred`);

--
-- Indices de la tabla `ingredientes_opcionales`
--
ALTER TABLE `ingredientes_opcionales`
  ADD PRIMARY KEY (`id_ingred`,`id_receta`),
  ADD KEY `fk_ingrediente_has_receta_ingrediente` (`id_ingred`),
  ADD KEY `fk_ingrediente_has_receta_receta` (`id_receta`);

--
-- Indices de la tabla `ingredientes_principales`
--
ALTER TABLE `ingredientes_principales`
  ADD PRIMARY KEY (`id_ingred`,`id_receta`),
  ADD KEY `fk_ingredprin_ingrediente` (`id_ingred`),
  ADD KEY `fk_ingredprin_receta` (`id_receta`);

--
-- Indices de la tabla `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id_receta`),
  ADD KEY `fk_receta_usuario` (`numusuario_id_usuario`);

--
-- Indices de la tabla `recetas_de_restaurantes`
--
ALTER TABLE `recetas_de_restaurantes`
  ADD PRIMARY KEY (`receta_id_receta`,`id_rest`),
  ADD KEY `fk_receta_has_restaurante_receta` (`receta_id_receta`),
  ADD KEY `fk_receta_has_restaurante_restaurante` (`id_rest`);

--
-- Indices de la tabla `receta_provincia`
--
ALTER TABLE `receta_provincia`
  ADD PRIMARY KEY (`receta_id_receta`,`provincia_id_provincia`),
  ADD KEY `fk_receta_has_provincia_receta` (`receta_id_receta`),
  ADD KEY `fk_receta_has_provincia_provincia` (`provincia_id_provincia`);

--
-- Indices de la tabla `receta_tipo`
--
ALTER TABLE `receta_tipo`
  ADD PRIMARY KEY (`id_receta`,`id_tipo_receta`),
  ADD KEY `fk_receta_has_tipo_receta_receta` (`id_receta`),
  ADD KEY `fk_receta_has_tipo_receta_tipo_receta` (`id_tipo_receta`);

--
-- Indices de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  ADD PRIMARY KEY (`id_rest`);

--
-- Indices de la tabla `tipo_receta`
--
ALTER TABLE `tipo_receta`
  ADD PRIMARY KEY (`id_tipo_receta`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuario_administrador` (`administrador_id_admin`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `imagen`
--
ALTER TABLE `imagen`
  MODIFY `id_imag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `ingrediente`
--
ALTER TABLE `ingrediente`
  MODIFY `id_ingred` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id_receta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `restaurante`
--
ALTER TABLE `restaurante`
  MODIFY `id_rest` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `tipo_receta`
--
ALTER TABLE `tipo_receta`
  MODIFY `id_tipo_receta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD CONSTRAINT `fk_imagen_ingrediente` FOREIGN KEY (`ingrediente_id_ingred`) REFERENCES `ingrediente` (`id_ingred`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `imagen_ibfk_2` FOREIGN KEY (`receta_id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `imagen_ibfk_3` FOREIGN KEY (`restaurante_id_rest`) REFERENCES `restaurante` (`id_rest`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingredientes_opcionales`
--
ALTER TABLE `ingredientes_opcionales`
  ADD CONSTRAINT `fk_ingrediente_has_receta_ingrediente` FOREIGN KEY (`id_ingred`) REFERENCES `ingrediente` (`id_ingred`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ingrediente_has_receta_receta` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingredientes_principales`
--
ALTER TABLE `ingredientes_principales`
  ADD CONSTRAINT `fk_ingredprin_ingrediente` FOREIGN KEY (`id_ingred`) REFERENCES `ingrediente` (`id_ingred`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ingredientes_principales_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`numusuario_id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `recetas_de_restaurantes`
--
ALTER TABLE `recetas_de_restaurantes`
  ADD CONSTRAINT `fk_receta_has_restaurante_receta` FOREIGN KEY (`receta_id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_receta_has_restaurante_restaurante` FOREIGN KEY (`id_rest`) REFERENCES `restaurante` (`id_rest`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `receta_provincia`
--
ALTER TABLE `receta_provincia`
  ADD CONSTRAINT `receta_provincia_ibfk_2` FOREIGN KEY (`receta_id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `receta_provincia_ibfk_3` FOREIGN KEY (`provincia_id_provincia`) REFERENCES `provincia` (`id_provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `receta_tipo`
--
ALTER TABLE `receta_tipo`
  ADD CONSTRAINT `fk_receta_has_tipo_receta_tipo_receta` FOREIGN KEY (`id_tipo_receta`) REFERENCES `tipo_receta` (`id_tipo_receta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `receta_tipo_ibfk_1` FOREIGN KEY (`id_receta`) REFERENCES `receta` (`id_receta`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`administrador_id_admin`) REFERENCES `administrador` (`id_admin`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
