-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2025 a las 04:20:38
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `plantas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id` int(11) NOT NULL,
  `nombre_cientifico` varchar(150) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `n_cotiledones` int(4) DEFAULT NULL,
  `n_flores` int(4) DEFAULT NULL,
  `venacion_hojas` enum('abierta','cerrada','reticulada','paralela','dicotómica') DEFAULT NULL,
  `raiz` enum('Pivotante','fasciculada') DEFAULT NULL,
  `tallo` enum('herbaceo','leñoso','semileñoso') DEFAULT NULL,
  `tiene_esporangio` tinyint(1) DEFAULT NULL,
  `division_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id`, `nombre_cientifico`, `nombre`, `descripcion`, `n_cotiledones`, `n_flores`, `venacion_hojas`, `raiz`, `tallo`, `tiene_esporangio`, `division_id`) VALUES
(1, 'Bryopsida', 'Musgos verdaderos', 'Clase principal de los musgos, plantas no vasculares con esporangios.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 1),
(2, 'Polytrichopsida', 'Musgos acrocarpos', 'Musgos con esporofitos más robustos.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 1),
(3, 'Sphagnopsida', 'Musgos de sphagnum', 'Musgos de turbera, retienen mucha agua.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 1),
(4, 'Marchantiopsida', 'Hepáticas talosas', 'Plantas no vasculares con talo aplanado.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 2),
(5, 'Jungermanniopsida', 'Hepáticas frondosas', 'Plantas no vasculares con gametofito folioso.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 2),
(6, 'Anthocerotopsida', 'Antocerotas', 'Plantas no vasculares con esporangios en forma de cuerno.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 3),
(7, 'Lycopodiopsida', 'Licopodios', 'Plantas vasculares sin semilla con microfilos.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 4),
(8, 'Isoetopsida', 'Isoetes', 'Plantas acuáticas o semiacuáticas primitivas.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 4),
(9, 'Selaginellopsida', 'Selaginelas', 'Plantas vasculares sin semilla heterospóreas.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 4),
(10, 'Polypodiopsida', 'Helechos', 'Plantas vasculares sin semillas, frondes divididas.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 5),
(11, 'Equisetopsida', 'Colas de caballo', 'Tallos articulados y esporangios en estróbilos.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 5),
(12, 'Marattiopsida', 'Helechos primitivos', 'Helechos grandes con raíces adventicias.', NULL, NULL, NULL, NULL, 'herbaceo', 1, 5),
(13, 'Cycadopsida', 'Cícadas', 'Gimnospermas con hojas pinnadas y semillas desnudas.', NULL, NULL, NULL, 'Pivotante', 'leñoso', 0, 6),
(14, 'Ginkgoopsida', 'Ginkgo', 'Gimnosperma con una sola especie viva: Ginkgo biloba.', NULL, NULL, '', 'Pivotante', 'leñoso', 0, 7),
(15, 'Pinopsida', 'Coníferas', 'Gimnospermas con conos; hojas aciculares.', NULL, NULL, NULL, 'Pivotante', 'leñoso', 0, 8),
(16, 'Gnetopsida', 'Gnetales', 'Gimnospermas con caracteres intermedios; poseen vasos.', NULL, NULL, NULL, 'Pivotante', 'leñoso', 0, 9),
(17, 'Liliopsida', 'Monocotiledóneas', 'Plantas con 1 cotiledón, venación paralela, raíz fasciculada.', 1, NULL, 'paralela', 'fasciculada', 'herbaceo', 0, 10),
(18, 'Magnoliopsida', 'Dicotiledóneas', 'Plantas con 2 cotiledones, venación reticulada, raíz pivotante.', 2, NULL, 'reticulada', 'Pivotante', 'herbaceo', 0, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descubrimiento`
--

CREATE TABLE `descubrimiento` (
  `id` int(11) NOT NULL,
  `descubridor` varchar(150) NOT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `descubrimiento`
--

INSERT INTO `descubrimiento` (`id`, `descubridor`, `fecha`) VALUES
(1, 'Karl Maximovich (Maxim.)', '1867-11-13'),
(2, 'Frederick Pursh (Pursh)', '1813-01-01'),
(3, 'Karl Maximovich (Maxim.)', '1856-01-01'),
(4, 'Philip Miller (Mill.)', '1768-04-16'),
(5, 'Carl P. Thunberg (Thunb.)', '1784-05-01'),
(6, 'Carl P. Thunberg (Thunb.)', '1783-01-01'),
(7, 'Carl Linnaeus (L.)', '1753-05-01'),
(8, 'Carl Linnaeus (L.)', '1753-05-01'),
(9, 'P. F. von Siebold & J. G. Zuccarini (Siebold & Zucc.)', '1845-01-01'),
(10, 'Carl Linnaeus (L.)', '1753-05-01'),
(11, '(Loisel.) Duby', '1828-04-12'),
(12, 'Callier', '1904-01-01'),
(13, 'Bong.', '1832-01-01'),
(14, 'Matsum.', '1902-01-01'),
(15, '(Chaix) DC.', '1805-01-01'),
(16, 'Carrière; recomb. Rivière & C.Rivière (1878)', '1878-01-01'),
(17, 'Chun ex P.C.Li', '1979-01-01'),
(18, 'Roth', '1788-01-01'),
(19, 'H.Lév.', '1911-01-01'),
(20, 'Mill.', '1768-04-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `division`
--

CREATE TABLE `division` (
  `id` int(11) NOT NULL,
  `nombre_cientifico` varchar(150) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `vasculares` tinyint(1) DEFAULT NULL,
  `con_semilla` tinyint(1) DEFAULT NULL,
  `con_flor` tinyint(1) DEFAULT NULL,
  `con_fruto` tinyint(1) DEFAULT NULL,
  `reino_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `division`
--

INSERT INTO `division` (`id`, `nombre_cientifico`, `nombre`, `descripcion`, `vasculares`, `con_semilla`, `con_flor`, `con_fruto`, `reino_id`) VALUES
(1, 'Bryophyta', 'Musgos', 'Plantas no vasculares que se reproducen mediante esporas; requieren humedad.', 0, 0, 0, 0, 1),
(2, 'Marchantiophyta', 'Hepáticas', 'Plantas no vasculares con gametofito predominante; estructuras aplanadas.', 0, 0, 0, 0, 1),
(3, 'Anthocerotophyta', 'Antocerotas', 'Plantas no vasculares con esporangios alargados en forma de cuerno.', 0, 0, 0, 0, 1),
(4, 'Lycopodiophyta', 'Licopodios', 'Plantas vasculares primitivas sin semillas; se reproducen por esporas.', 1, 0, 0, 0, 1),
(5, 'Monilophyta', 'Helechos y afines', 'Plantas vasculares sin semilla; caracterizadas por frondes y esporangios.', 1, 0, 0, 0, 1),
(6, 'Cycadophyta', 'Cícadas', 'Gimnospermas parecidas a palmeras, con semillas desnudas.', 1, 1, 0, 0, 1),
(7, 'Ginkgophyta', 'Ginkgo', 'Gimnospermas con una sola especie viva: Ginkgo biloba.', 1, 1, 0, 0, 1),
(8, 'Pinophyta', 'Coníferas', 'Gimnospermas con conos y hojas aciculares; semillas desnudas.', 1, 1, 0, 0, 1),
(9, 'Gnetophyta', 'Gnetales', 'Gimnospermas con características intermedias, poseen vasos en el xilema.', 1, 1, 0, 0, 1),
(10, 'Magnoliophyta', 'Angiospermas', 'Plantas con flores y frutos; las más diversas y evolucionadas.', 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie`
--

CREATE TABLE `especie` (
  `id` int(11) NOT NULL,
  `nombre_cientifico` varchar(150) NOT NULL,
  `nombres_comunes` varchar(300) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `genero_id` int(11) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  `descubrimiento_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especie`
--

INSERT INTO `especie` (`id`, `nombre_cientifico`, `nombres_comunes`, `descripcion`, `genero_id`, `region_id`, `descubrimiento_id`) VALUES
(1, 'Acer_Capillipes', 'Arce capillipes', 'Especie del género Acer.', 152, 1, 1),
(2, 'Acer_Circinatum', 'Arce circinado', 'Especie del género Acer.', 152, 1, 2),
(3, 'Acer_Mono', 'Arce mono', 'Especie del género Acer.', 152, 1, 3),
(4, 'Acer_Opalus', 'Arce opalus', 'Especie del género Acer.', 152, 1, 4),
(5, 'Acer_Palmatum', 'Arce japonés', 'Especie del género Acer.', 152, 1, 5),
(6, 'Acer_Pictum', 'Arce pictum', 'Especie del género Acer.', 152, 1, 6),
(7, 'Acer_Platanoids', 'Arce plátanoide', 'Especie del género Acer.', 152, 1, 7),
(8, 'Acer_Rubrum', 'Arce rojo', 'Especie del género Acer.', 152, 1, 7),
(9, 'Acer_Rufinerve', 'Arce rufinerve', 'Especie del género Acer.', 152, 1, 9),
(10, 'Acer_Saccharinum', 'Arce plateado', 'Especie del género Acer.', 152, 1, 7),
(11, 'Alnus_Cordata', 'Aliso italiano', 'Especie del género Alnus.', 153, 1, 11),
(12, 'Alnus_Maximowiczii', 'Aliso Maximowiczii', 'Especie del género Alnus.', 153, 1, 12),
(13, 'Alnus_Rubra', 'Aliso rojo', 'Especie del género Alnus.', 153, 1, 13),
(14, 'Alnus_Sieboldiana', 'Aliso Siebold', 'Especie del género Alnus.', 153, 1, 14),
(15, 'Alnus_Viridis', 'Aliso verde', 'Especie del género Alnus.', 153, 1, 15),
(16, 'Arundinaria_Simonii', 'Bambú de Simon', 'Especie del género Arundinaria.', 154, 6, 16),
(17, 'Betula_Austrosinensis', 'Abedul chino', 'Especie del género Betula.', 155, 1, 17),
(18, 'Betula_Pendula', 'Abedul péndulo', 'Especie del género Betula.', 155, 1, 18),
(19, 'Callicarpa_Bodinieri', 'Callicarpa de Bodinier', 'Especie del género Callicarpa.', 156, 6, 19),
(20, 'Castanea_Sativa', 'Castaño común', 'Especie del género Castanea.', 157, 3, 20),
(21, 'Celtis_Koraiensis', 'Almez coreano', 'Especie del género Celtis.', 158, 1, NULL),
(22, 'Cercis_Siliquastrum', 'Árbol del amor', 'Especie del género Cercis.', 159, 3, NULL),
(23, 'Cornus_Chinensis', 'Cornejo chino', 'Especie del género Cornus.', 160, 1, NULL),
(24, 'Cornus_Controversa', 'Cornejo controversial', 'Especie del género Cornus.', 160, 1, NULL),
(25, 'Cornus_Macrophylla', 'Cornejo de hojas grandes', 'Especie del género Cornus.', 160, 1, NULL),
(26, 'Cotinus_Coggygria', 'Árbol de las pelusas', 'Especie del género Cotinus.', 161, 3, NULL),
(27, 'Crataegus_Monogyna', 'Espino albar', 'Especie del género Crataegus.', 162, 1, NULL),
(28, 'Cytisus_Battandieri', 'Retama marroquí', 'Especie del género Cytisus.', 163, 9, NULL),
(29, 'Eucalyptus_Glaucescens', 'Eucalipto glauco', 'Especie del género Eucalyptus.', 164, 6, NULL),
(30, 'Eucalyptus_Neglecta', 'Eucalipto neglecta', 'Especie del género Eucalyptus.', 164, 6, NULL),
(31, 'Eucalyptus_Urnigera', 'Eucalipto urnigera', 'Especie del género Eucalyptus.', 164, 6, NULL),
(32, 'Fagus_Sylvatica', 'Haya europea', 'Especie del género Fagus.', 165, 1, NULL),
(33, 'Ginkgo_Biloba', 'Ginkgo', 'Única especie viva del género Ginkgo.', 39, 1, NULL),
(34, 'Ilex_Aquifolium', 'Acebo común', 'Especie del género Ilex.', 166, 1, NULL),
(35, 'Ilex_Cornuta', 'Acebo cornudo', 'Especie del género Ilex.', 166, 6, NULL),
(36, 'Liquidambar_Styraciflua', 'Árbol del ámbar', 'Especie del género Liquidambar.', 167, 1, NULL),
(37, 'Liriodendron_Tulipifera', 'Árbol de tulipán', 'Especie del género Liriodendron.', 168, 1, NULL),
(38, 'Lithocarpus_Cleistocarpus', 'Roble de piedra cleistocarpus', 'Especie del género Lithocarpus.', 169, 6, NULL),
(39, 'Lithocarpus_Edulis', 'Roble de piedra japonés', 'Especie del género Lithocarpus.', 169, 6, NULL),
(40, 'Magnolia_Heptapeta', 'Magnolia heptapeta', 'Especie del género Magnolia.', 170, 6, NULL),
(41, 'Magnolia_Salicifolia', 'Magnolia de hojas de sauce', 'Especie del género Magnolia.', 170, 6, NULL),
(42, 'Morus_Nigra', 'Moral negro', 'Especie del género Morus.', 74, 3, NULL),
(43, 'Olea_Europaea', 'Olivo', 'Especie del género Olea.', 171, 3, NULL),
(44, 'Phildelphus', 'Filadelfo', 'Especie del género Philadelphus.', 172, 1, NULL),
(45, 'Populus_Adenopoda', 'Álamo adenopoda', 'Especie del género Populus.', 173, 1, NULL),
(46, 'Populus_Grandidentata', 'Álamo de dientes grandes', 'Especie del género Populus.', 173, 1, NULL),
(47, 'Populus_Nigra', 'Álamo negro', 'Especie del género Populus.', 173, 1, NULL),
(48, 'Prunus_Avium', 'Cerezo dulce', 'Especie del género Prunus.', 174, 1, NULL),
(49, 'Prunus_X_Shmittii', 'Cerezo híbrido Shmittii', 'Especie del género Prunus.', 174, 1, NULL),
(50, 'Pterocarya_Stenoptera', 'Nogal alado chino', 'Especie del género Pterocarya.', 175, 6, NULL),
(51, 'Quercus_Afares', 'Encina Afares', 'Especie del género Quercus.', 176, 3, NULL),
(52, 'Quercus_Agrifolia', 'Encina californiana', 'Especie del género Quercus.', 176, 3, NULL),
(53, 'Quercus_Alnifolia', 'Encina chipriota', 'Especie del género Quercus.', 176, 3, NULL),
(54, 'Quercus_Brantii', 'Roble iraní', 'Especie del género Quercus.', 176, 3, NULL),
(55, 'Quercus_Canariensis', 'Quejigo andaluz', 'Especie del género Quercus.', 176, 3, NULL),
(56, 'Quercus_Castaneifolia', 'Roble castaño', 'Especie del género Quercus.', 176, 6, NULL),
(57, 'Quercus_Cerris', 'Cerro roble', 'Especie del género Quercus.', 176, 3, NULL),
(58, 'Quercus_Chrysolepis', 'Roble de oro', 'Especie del género Quercus.', 176, 1, NULL),
(59, 'Quercus_Coccifera', 'Coscoja', 'Especie del género Quercus.', 176, 3, NULL),
(60, 'Quercus_Coccinea', 'Roble escarlata', 'Especie del género Quercus.', 176, 1, NULL),
(61, 'Quercus_Crassifolia', 'Roble crassifolia', 'Especie del género Quercus.', 176, 1, NULL),
(62, 'Quercus_Crassipes', 'Roble crassipes', 'Especie del género Quercus.', 176, 1, NULL),
(63, 'Quercus_Dolicholepis', 'Roble dolicholepis', 'Especie del género Quercus.', 176, 6, NULL),
(64, 'Quercus_Ellipsoidalis', 'Roble ellipsoidalis', 'Especie del género Quercus.', 176, 1, NULL),
(65, 'Quercus_Greggii', 'Roble Greggii', 'Especie del género Quercus.', 176, 1, NULL),
(66, 'Quercus_Hartwissiana', 'Roble Hartwiss', 'Especie del género Quercus.', 176, 6, NULL),
(67, 'Quercus_Ilex', 'Encina', 'Especie del género Quercus.', 176, 3, NULL),
(68, 'Quercus_Imbricaria', 'Roble imbricado', 'Especie del género Quercus.', 176, 1, NULL),
(69, 'Quercus_Infectoria_sub', 'Roble infectoria subsp.', 'Especie del género Quercus.', 176, 3, NULL),
(70, 'Quercus_Kewensis', 'Roble Kewensis', 'Especie del género Quercus.', 176, 3, NULL),
(71, 'Quercus_Nigra', 'Roble negro', 'Especie del género Quercus.', 176, 1, NULL),
(72, 'Quercus_Palustris', 'Roble de los pantanos', 'Especie del género Quercus.', 176, 1, NULL),
(73, 'Quercus_Phellos', 'Roble sauce', 'Especie del género Quercus.', 176, 1, NULL),
(74, 'Quercus_Phillyraeoides', 'Roble phillyraeoides', 'Especie del género Quercus.', 176, 3, NULL),
(75, 'Quercus_Pontica', 'Roble póntico', 'Especie del género Quercus.', 176, 3, NULL),
(76, 'Quercus_Pubescens', 'Roble pubescente', 'Especie del género Quercus.', 176, 3, NULL),
(77, 'Quercus_Pyrenaica', 'Rebollo', 'Especie del género Quercus.', 176, 3, NULL),
(78, 'Quercus_Rhysophylla', 'Roble rojo mexicano', 'Especie del género Quercus.', 176, 1, NULL),
(79, 'Quercus_Rubra', 'Roble rojo americano', 'Especie del género Quercus.', 176, 1, NULL),
(80, 'Quercus_Semecarpifolia', 'Roble Himalayo', 'Especie del género Quercus.', 176, 6, NULL),
(81, 'Quercus_Shumardii', 'Roble Shumard', 'Especie del género Quercus.', 176, 1, NULL),
(82, 'Quercus_Suber', 'Alcornoque', 'Especie del género Quercus.', 176, 3, NULL),
(83, 'Quercus_Texana', 'Roble texano', 'Especie del género Quercus.', 176, 1, NULL),
(84, 'Quercus_Trojana', 'Roble troyano', 'Especie del género Quercus.', 176, 3, NULL),
(85, 'Quercus_Variabilis', 'Roble variabilis', 'Especie del género Quercus.', 176, 6, NULL),
(86, 'Quercus_Vulcanica', 'Roble volcánico', 'Especie del género Quercus.', 176, 3, NULL),
(87, 'Quercus_x_Hispanica', 'Roble híbrido hispánico', 'Especie del género Quercus.', 176, 3, NULL),
(88, 'Quercus_x_Turneri', 'Roble Turner', 'Especie del género Quercus.', 176, 3, NULL),
(89, 'Rhododendron_x_Russellianum', 'Rododendro Russellianum', 'Especie híbrida del género Rhododendron.', 177, 6, NULL),
(90, 'Salix_Fragilis', 'Sauce quebradizo', 'Especie del género Salix.', 178, 1, NULL),
(91, 'Salix_Intergra', 'Sauce integra', 'Especie del género Salix.', 178, 1, NULL),
(92, 'Sorbus_Aria', 'Serbal común', 'Especie del género Sorbus.', 179, 1, NULL),
(93, 'Tilia_Oliveri', 'Tilo de Oliver', 'Especie del género Tilia.', 180, 1, NULL),
(94, 'Tilia_Platyphyllos', 'Tilo de hoja ancha', 'Especie del género Tilia.', 180, 1, NULL),
(95, 'Tilia_Tomentosa', 'Tilo plateado', 'Especie del género Tilia.', 180, 1, NULL),
(96, 'Ulmus_Bergmanniana', 'Olmo de Bergmann', 'Especie del género Ulmus.', 181, 1, NULL),
(97, 'Viburnum_Tinus', 'Durillo', 'Especie del género Viburnum.', 182, 3, NULL),
(98, 'Viburnum_x_Rhytidophylloides', 'Viburno híbrido', 'Especie del género Viburnum.', 182, 1, NULL),
(99, 'Zelkova_Serrata', 'Zelkova japonés', 'Especie del género Zelkova.', 183, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especie_propiedad_quimica`
--

CREATE TABLE `especie_propiedad_quimica` (
  `especie_id` int(11) NOT NULL,
  `propiedad_id` int(11) NOT NULL,
  `concentracion` varchar(100) DEFAULT NULL,
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `id` int(11) NOT NULL,
  `nombre_cientifico` varchar(150) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `tipo_fruto` enum('racimosas','cimosas','mixtas') DEFAULT NULL,
  `tipo_semilla` enum('redonda','alargada','plana') DEFAULT NULL,
  `tipo_estipula` enum('foliaceas','espinosas','ocreadas','escamosas','zarcillos') DEFAULT NULL,
  `orden_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`id`, `nombre_cientifico`, `nombre`, `descripcion`, `tipo_fruto`, `tipo_semilla`, `tipo_estipula`, `orden_id`) VALUES
(1, 'Funariaceae', 'Funariaceae', 'Familia de musgos comunes en suelos húmedos.', NULL, NULL, NULL, 1),
(2, 'Bryaceae', 'Bryaceae', 'Familia grande de musgos, incluye Bryum y otros géneros.', NULL, NULL, NULL, 2),
(3, 'Hypnaceae', 'Hypnaceae', 'Musgos pleurocárpicos muy extendidos.', NULL, NULL, NULL, 3),
(4, 'Polytrichaceae', 'Polytrichaceae', 'Musgos robustos con lamelas en las hojas.', NULL, NULL, NULL, 4),
(5, 'Sphagnaceae', 'Sphagnaceae', 'Musgos de turbera (Sphagnum).', NULL, NULL, NULL, 5),
(6, 'Marchantiaceae', 'Marchantiaceae', 'Hepáticas talosas comunes.', NULL, NULL, NULL, 6),
(7, 'Lunulariaceae', 'Lunulariaceae', 'Hepáticas con estructuras en forma de media luna.', NULL, NULL, NULL, 7),
(8, 'Jungermanniaceae', 'Jungermanniaceae', 'Hepáticas foliosas diversas.', NULL, NULL, NULL, 8),
(9, 'Anthocerotaceae', 'Anthocerotaceae', 'Familia de antocerotas de esporangio alargado.', NULL, NULL, NULL, 9),
(10, 'Lycopodiaceae', 'Lycopodiaceae', 'Licopodios terrestres; microfilos.', NULL, NULL, NULL, 10),
(11, 'Isoetaceae', 'Isoetaceae', 'Plantas acuáticas/semiaacuáticas (Isoetes).', NULL, NULL, NULL, 11),
(12, 'Selaginellaceae', 'Selaginellaceae', 'Familia que incluye Selaginella.', NULL, NULL, NULL, 12),
(13, 'Polypodiaceae', 'Polipodio', 'Helechos polipodioides comunes.', NULL, NULL, NULL, 13),
(14, 'Dryopteridaceae', 'Helechos dryopteris', 'Helechos de bosques y sotobosque.', NULL, NULL, NULL, 13),
(15, 'Cyatheaceae', 'Helechos arborescentes', 'Helechos grandes, tronco arborescente.', NULL, NULL, NULL, 14),
(16, 'Equisetaceae', 'Colas de caballo', 'Tallos articulados, esporofitos en estróbilos.', NULL, NULL, NULL, 15),
(17, 'Marattiaceae', 'Marattiaceae', 'Helechos primitivos de gran tamaño.', NULL, NULL, NULL, 16),
(18, 'Cycadaceae', 'Cycadaceae', 'Familia de cícadas (hojas pinnadas).', NULL, NULL, NULL, 17),
(19, 'Zamiaceae', 'Zamiaceae', 'Otra familia de cícadas, con géneros como Zamia.', NULL, NULL, NULL, 17),
(20, 'Ginkgoaceae', 'Ginkgoaceae', 'Contiene Ginkgo biloba, único representante vivo.', NULL, NULL, NULL, 18),
(21, 'Pinaceae', 'Pinaceae', 'Pinos, abetos y cedros; conos leñosos.', NULL, NULL, NULL, 19),
(22, 'Taxaceae', 'Taxaceae', 'Tejos; semillas con arilo carnoso.', NULL, NULL, NULL, 19),
(23, 'Araucariaceae', 'Araucariaceae', 'Araucarias y parientes del hemisferio sur.', NULL, NULL, NULL, 20),
(24, 'Cupressaceae', 'Cupressaceae', 'Cipreses, thuja y juníperos.', NULL, NULL, NULL, 21),
(25, 'Gnetaceae', 'Gnetaceae', 'Familia dentro de Gnetales (Gnetum).', NULL, NULL, NULL, 22),
(26, 'Ephedraceae', 'Ephedraceae', 'Incluye Ephedra; arbustos con compuestos activos.', NULL, NULL, NULL, 22),
(27, 'Welwitschiaceae', 'Welwitschiaceae', 'Contiene Welwitschia, de áreas desérticas.', NULL, NULL, NULL, 22),
(28, 'Poaceae', 'Gramíneas', 'Pastos, cereales y bambúes; importancia económica alta.', NULL, NULL, NULL, 23),
(29, 'Cyperaceae', 'Ciperáceas', 'Cañas y juncos; similares a las gramíneas.', NULL, NULL, NULL, 23),
(30, 'Bromeliaceae', 'Bromeliáceas', 'Bromelias, muchas epífitas del trópico.', NULL, NULL, NULL, 23),
(31, 'Arecaceae', 'Palmeras', 'Palmas con un solo tallo leñoso y hojas pinnadas o palmeadas.', NULL, NULL, NULL, 24),
(32, 'Orchidaceae', 'Orquídeas', 'Familia enorme, flores altamente especializadas.', NULL, NULL, NULL, 25),
(33, 'Asparagaceae', 'Asparagaceae', 'Incluye esparragos y aliados.', NULL, NULL, NULL, 25),
(34, 'Zingiberaceae', 'Jengibreras', 'Jengibre, cúrcuma y plantas aromáticas tropicales.', NULL, NULL, NULL, 26),
(35, 'Musaceae', 'Musáceas', 'Banano y plátano; grandes hojas y frutos comestibles.', NULL, NULL, NULL, 26),
(36, 'Rosaceae', 'Rosaceae', 'Manzanas, peras, rosas y muchas frutas.', NULL, NULL, NULL, 27),
(37, 'Moraceae', 'Moraceae', 'Higos y moras; frutos compuestos y látex.', NULL, NULL, NULL, 27),
(38, 'Fabaceae', 'Leguminosas', 'Fruto en vaina; fijación de nitrógeno en muchas especies.', NULL, NULL, NULL, 28),
(39, 'Lamiaceae', 'Labiadas', 'Menta, albahaca y plantas aromáticas; tallos cuadrados.', NULL, NULL, NULL, 29),
(40, 'Scrophulariaceae', 'Antirrhinaceae y aliados', 'Familia con flores zigomorfas (antes más grande).', NULL, NULL, NULL, 29),
(41, 'Asteraceae', 'Compuestas', 'Flores en capítulos; una de las familias más grandes.', NULL, NULL, NULL, 30),
(42, 'Brassicaceae', 'Brasicáceas', 'Coles, mostazas y plantas con glucosinolatos.', NULL, NULL, NULL, 31),
(166, 'Sapindaceae', 'Sapindaceae', 'Familia que incluye arces y otros árboles/arbustos; frutos diversos (ej. sámaras en Acer).', NULL, NULL, NULL, 77),
(167, 'Betulaceae', 'Betulaceae', 'Familia de árboles y arbustos caducifolios como alisos y abedules; inflorescencias amentáceas.', NULL, NULL, NULL, 83),
(168, 'Fagaceae', 'Fagaceae', 'Familia de árboles leñosos que incluye robles, hayas y castaños; fruto en forma de aquenio tipo bellota en Quercus.', NULL, NULL, NULL, 83),
(169, 'Cannabaceae', 'Cannabaceae', 'Familia que incluye almez (Celtis) y plantas relacionadas; frutos drupáceos o similares.', NULL, NULL, NULL, 27),
(170, 'Cornaceae', 'Cornaceae', 'Familia de árboles y arbustos (cornejos) con hojas simples y flores en corimbos o capítulos.', NULL, NULL, NULL, 84),
(171, 'Anacardiaceae', 'Anacardiaceae', 'Familia que incluye pistachos, almácigos y lentiscos; muchas especies con resinas o aceites.', NULL, NULL, NULL, 77),
(172, 'Myrtaceae', 'Myrtaceae', 'Familia de árboles y arbustos con hojas ricas en aceites esenciales; incluidos eucaliptos y mirtos.', NULL, NULL, NULL, 79),
(173, 'Aquifoliaceae', 'Aquifoliaceae', 'Familia de acebos; árboles y arbustos con bayas y hojas a menudo espinosas.', NULL, NULL, NULL, 77),
(174, 'Altingiaceae', 'Altingiaceae', 'Familia que incluye Liquidambar; árboles con frutos globosos leñosos.', NULL, NULL, NULL, 81),
(175, 'Magnoliaceae', 'Magnoliaceae', 'Familia de magnolias y árboles primitivos con flores grandes y vistosas.', NULL, NULL, NULL, 82),
(176, 'Oleaceae', 'Oleaceae', 'Familia que incluye olivos; árboles y arbustos con hojas simples y frutos en drupa.', NULL, NULL, NULL, 29),
(177, 'Hydrangeaceae', 'Hydrangeaceae', 'Familia de arbustos ornamentales (hortensias y Philadelphus), con inflorescencias en corimbos o panículas.', NULL, NULL, NULL, 81),
(178, 'Salicaceae', 'Salicaceae', 'Familia que incluye álamos y sauces; árboles o arbustos con amentos (inflorescencias en amento).', NULL, NULL, NULL, 80),
(179, 'Juglandaceae', 'Juglandaceae', 'Familia de nogales y parientes; frutos en núcula alada o bellota compuesta; hojas pinnadas.', NULL, NULL, NULL, 83),
(180, 'Ericaceae', 'Ericaceae', 'Familia de plantas muchas veces de suelos ácidos; incluye rododendros y ericas.', NULL, NULL, NULL, 78),
(181, 'Ulmaceae', 'Ulmaceae', 'Familia de olmos y zelkovas; árboles de madera dura y hojas simples asimétricas.', NULL, NULL, NULL, 27),
(182, 'Adoxaceae', 'Adoxaceae', 'Familia que incluye Viburnum y Adoxa; arbustos y herbáceas con inflorescencias densas.', NULL, NULL, NULL, 86);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int(11) NOT NULL,
  `nombre_cientifico` varchar(150) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `familia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre_cientifico`, `nombre`, `descripcion`, `familia_id`) VALUES
(1, 'Funaria', 'Funaria', 'Género de musgos típico en suelos perturbados.', 1),
(2, 'Physcomitrium', 'Physcomitrium', 'Musgos anuales con cápsulas esféricas.', 1),
(3, 'Bryum', 'Bryum', 'Musgos pequeños, comunes en suelos y rocas.', 2),
(4, 'Brachythecium', 'Brachythecium', 'Musgos del sotobosque y ambientes húmedos.', 2),
(5, 'Hypnum', 'Hypnum', 'Musgos pleurocárpicos de frondes densas.', 3),
(6, 'Plagiothecium', 'Plagiothecium', 'Musgos de aspecto delgado y estera.', 3),
(7, 'Polytrichum', 'Polytrichum', 'Musgos robustos con hojas con láminas.', 4),
(8, 'Atrichum', 'Atrichum', 'Musgos acrocarpos de tamaños medianos.', 4),
(9, 'Sphagnum', 'Sphagnum', 'Musgos de turberas, alto poder de retención hídrica.', 5),
(10, 'Flatbergium', 'Flatbergium', 'Género segregado recientemente del grupo Sphagnum.', 5),
(11, 'Marchantia', 'Marchantia', 'Hepáticas talosas comunes en suelos húmedos.', 6),
(12, 'Conocephalum', 'Conocephalum', 'Hepáticas talosas grandes y aromáticas.', 6),
(13, 'Lunularia', 'Lunularia', 'Hepáticas con talo en forma de media luna.', 7),
(14, 'Asterella', 'Asterella', 'Hepáticas talosas similares en apariencia.', 7),
(15, 'Jungermannia', 'Jungermannia', 'Hepáticas foliosas diversas.', 8),
(16, 'Frullania', 'Frullania', 'Hepáticas epífitas con lóbulos marcados.', 8),
(17, 'Anthoceros', 'Anthoceros', 'Antocerotas con esporangios en forma de cuerno.', 9),
(18, 'Notothylas', 'Notothylas', 'Antocerotas pequeñas y terrestres.', 9),
(19, 'Lycopodium', 'Lycopodium', 'Licopodios terrestres, tallos rastreros.', 10),
(20, 'Huperzia', 'Huperzia', 'Licopodios de hábito más erecto.', 10),
(21, 'Isoetes', 'Isoetes', 'Plantas acuáticas o semiacuáticas (quillworts).', 11),
(22, 'Tomiostrobus', 'Tomiostrobus', 'Género cercano en ambientes acuáticos.', 11),
(23, 'Selaginella', 'Selaginella', 'Selaginelas, pequeñas y a menudo rizomatosas.', 12),
(24, 'Selaginellopsis', 'Selaginellopsis', 'Género relacionado con especies de humedad.', 12),
(25, 'Polypodium', 'Polypodium', 'Helechos epífitos y terrestres; frondes divididas.', 13),
(26, 'Phlebodium', 'Phlebodium', 'Helechos con frondes grandes y persistentes.', 13),
(27, 'Dryopteris', 'Dryopteris', 'Helechos de sotobosque, comunes en bosques templados.', 14),
(28, 'Athyrium', 'Athyrium', 'Helechos con pinnas delicadas y coloración variada.', 14),
(29, 'Cyathea', 'Cyathea', 'Helechos arborescentes típicos de selvas húmedas.', 15),
(30, 'Alsophila', 'Alsophila', 'Helechos arborescentes con tronco firme.', 15),
(31, 'Equisetum', 'Equisetum', 'Colas de caballo, tallos articulados y sin hojas aparentes.', 16),
(32, 'Hippochaete', 'Hippochaete', 'Antiguamente segregado; especies del grupo Equisetum.', 16),
(33, 'Marattia', 'Marattia', 'Helechos primitivos de frondes grandes.', 17),
(34, 'Angiopteris', 'Angiopteris', 'Helechos con frondes muy grandes y raquis robusto.', 17),
(35, 'Cycadus', 'Cycadus', 'Género representativo de cícadas (ejemplo tradicional).', 18),
(36, 'Macrozamia', 'Macrozamia', 'Cícadas del hemisferio sur con conos grandes.', 18),
(37, 'Zamia', 'Zamia', 'Cícadas neotropicales de porte bajo a medio.', 19),
(38, 'Encephalartos', 'Encephalartos', 'Cícadas africanas, a menudo con hojas rígidas.', 19),
(39, 'Ginkgo', 'Ginkgo', 'Único género vivo; Ginkgo biloba.', 20),
(40, 'Sphenobaiera', 'Sphenobaiera', 'Género fósil relacionado (uso histórico).', 20),
(41, 'Pinus', 'Pinus', 'Pinos: conos leñosos y hojas aciculares.', 21),
(42, 'Abies', 'Abies', 'Abetos: conos erectos que se desarticulan.', 21),
(43, 'Taxus', 'Taxus', 'Tejos con semillas rodeadas por arilo carnoso.', 22),
(44, 'Austrotaxus', 'Austrotaxus', 'Género de tejos del Pacífico suroeste.', 22),
(45, 'Araucaria', 'Araucaria', 'Araucarias; coníferas de gran porte y hojas rígidas.', 23),
(46, 'Agathis', 'Agathis', 'Coníferas del trópico con madera valiosa.', 23),
(47, 'Cupressus', 'Cupressus', 'Cipreses de follaje denso y conos leñosos.', 24),
(48, 'Juniperus', 'Juniperus', 'Género que incluye enebros; conos tipo baya.', 24),
(49, 'Gnetum', 'Gnetum', 'Gnetales tropicales, hojas anchas y semillas visibles.', 25),
(50, 'GnetumR', 'GnetumR', 'Género representativo (nombre alternativo usado en listados).', 25),
(51, 'Ephedra', 'Ephedra', 'Arbustos xerófitos con compuestos alcaloides.', 26),
(52, 'Archaeephedra', 'Archaeephedra', 'Género fósil/emparentado (uso referencia).', 26),
(53, 'Welwitschia', 'Welwitschia', 'Único género vivo con hojas muy largas en desiertos.', 27),
(54, 'Welwitschiopsis', 'Welwitschiopsis', 'Género relacionado (referencial).', 27),
(55, 'Poa', 'Poa', 'Género de gramíneas (pasto azul), muy común.', 28),
(56, 'Triticum', 'Triticum', 'Género que incluye el trigo.', 28),
(57, 'Carex', 'Carex', 'Ciperáceas dominantes en humedales; numerosas especies.', 29),
(58, 'Cyperus', 'Cyperus', 'Género de juncos y ciperáceas tolerantes al agua.', 29),
(59, 'Bromelia', 'Bromelia', 'Bromelias terrestres; fruto en algunas especies.', 30),
(60, 'Tillandsia', 'Tillandsia', 'Epífitas (clavel del aire) muy diversas.', 30),
(61, 'Cocos', 'Cocos', 'Incluye la palmera cocotero (Cocos nucifera).', 31),
(62, 'Elaeis', 'Elaeis', 'Palmeras productoras de aceite (Elaeis guineensis).', 31),
(63, 'Phalaenopsis', 'Phalaenopsis', 'Orquídeas populares en cultivo.', 32),
(64, 'Cattleya', 'Cattleya', 'Orquídeas ornamentales de gran valor.', 32),
(65, 'Asparagus', 'Asparagus', 'Incluye el espárrago comestible.', 33),
(66, 'Agave', 'Agave', 'Plantas suculentas con rosetas grandes.', 33),
(67, 'Zingiber', 'Zingiber', 'Incluye el jengibre (Zingiber officinale).', 34),
(68, 'Curcuma', 'Curcuma', 'Incluye la cúrcuma, rizomas aromáticos.', 34),
(69, 'Musa', 'Musa', 'Plátanos y bananos cultivados.', 35),
(70, 'Ensete', 'Ensete', 'Género similar a Musa, bananos africanos.', 35),
(71, 'Rosa', 'Rosa', 'Rosas; flores con hipanto y pétalos numerosos.', 36),
(72, 'Malus', 'Malus', 'Manzanos; árboles frutales de la familia.', 36),
(73, 'Ficus', 'Ficus', 'Higos y árboles con syconium (fruto compuesto).', 37),
(74, 'Morus', 'Morus', 'Morera; frutas comestibles y corteza fibrosa.', 37),
(75, 'Pisum', 'Pisum', 'Guisantes y leguminosas de vaina.', 38),
(76, 'Phaseolus', 'Phaseolus', 'Frijoles y habichuelas comestibles.', 38),
(77, 'Mentha', 'Mentha', 'Mentas aromáticas, hojas usadas en cocina.', 39),
(78, 'Ocimum', 'Ocimum', 'Albahaca y géneros culinarios aromáticos.', 39),
(79, 'Verbascum', 'Verbascum', 'Género con flores tubulares y aspecto vistoso.', 40),
(80, 'Antirrhinum', 'Antirrhinum', 'Boca de dragón, flores zigomorfas.', 40),
(81, 'Helianthus', 'Helianthus', 'Girasoles y géneros con capítulo de flores.', 41),
(82, 'Taraxacum', 'Taraxacum', 'Dientes de león; flores en capítulos y dispersión de semillas.', 41),
(83, 'Brassica', 'Brassica', 'Coles, mostazas y crucíferas comestibles.', 42),
(84, 'Arabidopsis', 'Arabidopsis', 'Género modelo en biología vegetal (A. thaliana).', 42),
(152, 'Acer', 'Arce', 'Género de árboles y arbustos conocidos por sus hojas palmadas y colores otoñales intensos.', 166),
(153, 'Alnus', 'Aliso', 'Árboles caducifolios fijadores de nitrógeno que habitan zonas húmedas.', 167),
(154, 'Arundinaria', 'Bambú americano', 'Género de bambúes leñosos pertenecientes a la familia Poaceae.', 28),
(155, 'Betula', 'Abedul', 'Árboles de corteza blanca característica y hojas simples, ampliamente distribuidos en zonas templadas.', 167),
(156, 'Callicarpa', 'Baya de belleza', 'Arbustos ornamentales famosos por sus frutos púrpuras brillantes.', 39),
(157, 'Castanea', 'Castaño', 'Árboles productores de castañas comestibles y madera de alta calidad.', 168),
(158, 'Celtis', 'Almez', 'Árboles y arbustos resistentes, con frutos drupáceos pequeños.', 169),
(159, 'Cercis', 'Árbol del amor', 'Árboles ornamentales que florecen abundantemente en primavera.', 38),
(160, 'Cornus', 'Cornejo', 'Arbustos o árboles con brácteas vistosas y frutos carnosos.', 170),
(161, 'Cotinus', 'Árbol del humo', 'Arbustos con inflorescencias plumosas que dan apariencia de humo.', 171),
(162, 'Crataegus', 'Espino', 'Arbustos espinosos con flores blancas y frutos pequeños comestibles.', 36),
(163, 'Cytisus', 'Retama', 'Arbustos leguminosos con flores amarillas llamativas.', 38),
(164, 'Eucalyptus', 'Eucalipto', 'Árboles aromáticos de rápido crecimiento originarios de Australia.', 172),
(165, 'Fagus', 'Haya', 'Árboles majestuosos de madera dura y follaje denso.', 168),
(166, 'Ilex', 'Acebo', 'Arbustos y árboles de hojas brillantes y frutos rojos.', 173),
(167, 'Liquidambar', 'Liquidámbar', 'Árboles con hojas lobuladas y colores otoñales intensos.', 174),
(168, 'Liriodendron', 'Tulípero', 'Árboles de grandes flores y hojas distintivas en forma de violín.', 175),
(169, 'Lithocarpus', 'Roble de piedra', 'Árboles siempreverdes similares a los robles pero con cúpulas más robustas.', 168),
(170, 'Magnolia', 'Magnolia', 'Árboles y arbustos con grandes flores aromáticas.', 175),
(171, 'Olea', 'Olivo', 'Árboles de hoja perenne famosos por producir aceitunas.', 176),
(172, 'Philadelphus', 'Celinda', 'Arbustos ornamentales fragantes conocidos como “falso jazmín”.', 177),
(173, 'Populus', 'Álamo', 'Árboles de rápido crecimiento comunes en zonas húmedas.', 178),
(174, 'Prunus', 'Cerezo/Ciruelo', 'Género diverso que incluye cerezos, ciruelos, almendros y durazneros.', 36),
(175, 'Pterocarya', 'Nogal alado', 'Árboles de follaje denso y frutos alados característicos.', 179),
(176, 'Quercus', 'Roble/Encina', 'Género de árboles emblemáticos productores de bellotas.', 168),
(177, 'Rhododendron', 'Rododendro', 'Arbustos de hojas perennes con flores vistosas y abundantes.', 180),
(178, 'Salix', 'Sauce', 'Árboles y arbustos de ramas flexibles adaptados a zonas húmedas.', 178),
(179, 'Sorbus', 'Serbal', 'Árboles y arbustos con frutos rojizos agrupados.', 36),
(180, 'Tilia', 'Tilo', 'Árboles aromáticos cuyas flores se utilizan para infusiones.', 168),
(181, 'Ulmus', 'Olmo', 'Árboles de madera resistente y hojas dentadas.', 181),
(182, 'Viburnum', 'Viburno', 'Arbustos ornamentales con inflorescencias en corimbo.', 182),
(183, 'Zelkova', 'Zelkova', 'Árboles ornamentales resistentes, cercanos a los olmos.', 181);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(11) NOT NULL,
  `nombre_cientifico` varchar(150) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `disposición_floral` enum('espiralada','verticilada','asimetrica','zigomorfa') DEFAULT NULL,
  `inflorescencia` enum('racimosas','cimosas','mixtas') DEFAULT NULL,
  `posicion_ovario` enum('supero','infero','semiinfero') DEFAULT NULL,
  `clase_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `nombre_cientifico`, `nombre`, `descripcion`, `disposición_floral`, `inflorescencia`, `posicion_ovario`, `clase_id`) VALUES
(1, 'Funariales', 'Funariales', 'Musgos de hábitats húmedos.', NULL, NULL, NULL, 1),
(2, 'Bryales', 'Bryales', 'Uno de los órdenes más grandes de musgos.', NULL, NULL, NULL, 1),
(3, 'Hypnales', 'Hypnales', 'Musgos pleurocárpicos comunes.', NULL, NULL, NULL, 1),
(4, 'Polytrichales', 'Polytrichales', 'Musgos robustos, con hojas con lamelas.', NULL, NULL, NULL, 2),
(5, 'Sphagnales', 'Sphagnales', 'Musgos de turbera con alta retención de agua.', NULL, NULL, NULL, 3),
(6, 'Marchantiales', 'Marchantiales', 'Hepáticas talosas complejas.', NULL, NULL, NULL, 4),
(7, 'Lunulariales', 'Lunulariales', 'Hepáticas talosas simples.', NULL, NULL, NULL, 4),
(8, 'Jungermanniales', 'Jungermanniales', 'Hepáticas foliosas muy diversas.', NULL, NULL, NULL, 5),
(9, 'Anthocerotales', 'Anthocerotales', 'Plantas con esporangios cilíndricos persistentes.', NULL, NULL, NULL, 6),
(10, 'Lycopodiales', 'Lycopodiales', 'Licopodios terrestres con microfilos.', NULL, NULL, NULL, 7),
(11, 'Isoetales', 'Isoetales', 'Plantas acuáticas con megasporas y microsporas.', NULL, NULL, NULL, 8),
(12, 'Selaginellales', 'Selaginellales', 'Selaginelas heterospóreas.', NULL, NULL, NULL, 9),
(13, 'Polypodiales', 'Helechos polipodioides', 'Helechos con frondes diversas.', NULL, NULL, NULL, 10),
(14, 'Cyatheales', 'Helechos arborescentes', 'Helechos grandes, algunos arbóreos.', NULL, NULL, NULL, 10),
(15, 'Equisetales', 'Colas de caballo', 'Plantas con tallos articulados y estróbilos.', NULL, NULL, NULL, 11),
(16, 'Marattiales', 'Marattiales', 'Helechos primitivos, frondes grandes.', NULL, NULL, NULL, 12),
(17, 'Cycadales', 'Cícadas', 'Gimnospermas primitivas, hojas pinnadas.', NULL, NULL, NULL, 13),
(18, 'Ginkgoales', 'Ginkgo', 'Solo contiene al Ginkgo biloba.', NULL, NULL, NULL, 14),
(19, 'Pinales', 'Coníferas', 'Conos masculinos y femeninos.', NULL, NULL, NULL, 15),
(20, 'Araucariales', 'Araucarias', 'Coníferas del hemisferio sur.', NULL, NULL, NULL, 15),
(21, 'Cupressales', 'Cipreses', 'Incluye Thuja, Juniperus y Cupressus.', NULL, NULL, NULL, 15),
(22, 'Gnetales', 'Gnetales', 'Gimnospermas con vasos en el xilema.', NULL, NULL, NULL, 16),
(23, 'Poales', 'Gramíneas y aliados', 'Incluye pastos y bambúes.', 'espiralada', 'racimosas', 'supero', 17),
(24, 'Arecales', 'Palmeras', 'Tallos leñosos no ramificados.', 'verticilada', 'cimosas', 'supero', 17),
(25, 'Asparagales', 'Asparagales', 'Incluye orquídeas.', 'espiralada', 'racimosas', 'infero', 17),
(26, 'Zingiberales', 'Jengibres', 'Plantas aromáticas tropicales.', 'asimetrica', 'cimosas', 'infero', 17),
(27, 'Rosales', 'Rosales', 'Incluye manzanos, rosas y fresas.', 'espiralada', 'racimosas', 'supero', 18),
(28, 'Fabales', 'Leguminosas', 'Frutos en vaina, fijan nitrógeno.', 'espiralada', 'racimosas', 'supero', 18),
(29, 'Lamiales', 'Labiadas', 'Tallos cuadrados, flores zigomorfas.', 'zigomorfa', 'cimosas', 'infero', 18),
(30, 'Asterales', 'Compuestas', 'Flores en capítulo.', 'espiralada', 'mixtas', 'infero', 18),
(31, 'Brassicales', 'Crucíferas', 'Plantas con glucosinolatos.', 'espiralada', 'racimosas', 'supero', 18),
(77, 'Sapindales', 'Sapindales', 'Orden de angiospermas dicotiledóneas que incluye árboles y arbustos, con hojas compuestas y frutos variados.', NULL, NULL, NULL, 18),
(78, 'Ericales', 'Ericales', 'Orden amplio con especies de hojas simples y flores generalmente actinomorfas o zigomorfas.', NULL, NULL, NULL, 18),
(79, 'Myrtales', 'Myrtales', 'Orden de plantas leñosas y hierbas con numerosos estambres y aceites esenciales.', NULL, NULL, NULL, 18),
(80, 'Malpighiales', 'Malpighiales', 'Uno de los órdenes más diversos de angiospermas, con variabilidad en formas, hábitats y morfología floral.', NULL, NULL, NULL, 18),
(81, 'Saxifragales', 'Saxifragales', 'Orden compuesto por hierbas y arbustos adaptados a climas templados, muchas veces en ambientes rocosos.', NULL, NULL, NULL, 18),
(82, 'Magnoliales', 'Magnoliales', 'Orden basal de angiospermas con flores grandes, aromáticas y disposición espiralada.', NULL, NULL, NULL, 18),
(83, 'Fagales', 'Fagales', 'Orden de angiospermas leñosas que incluye robles, hayas, abedules y avellanos; flores pequeñas y a menudo agrupadas.', NULL, NULL, NULL, 18),
(84, 'Cornales', 'Cornales', 'Orden que incluye Cornaceae y aliados; árboles y arbustos con inflorescencias distintas y frutos diversos.', NULL, NULL, NULL, 18),
(85, 'Malvales', 'Malvales', 'Orden que incluye Malvaceae; muchas especies con flores vistosas y estípulas presentes.', NULL, NULL, NULL, 18),
(86, 'Dipsacales', 'Dipsacales', 'Orden que incluye Adoxaceae y Dipsacaceae; arbustos y herbáceas con inflorescencias densas.', NULL, NULL, NULL, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades_quimicas`
--

CREATE TABLE `propiedades_quimicas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE `region` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `clima` enum('tropical','subtropical','templado','seco','humedo','frio','polar') DEFAULT NULL,
  `altitud` enum('0-500','500-1500','1500-3000','3000-5000','>5000','500-3000','0-1500','500-3000') DEFAULT NULL,
  `topografia` enum('llanura','valle','colina','montaña','meseta','altiplano','costa') DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`id`, `nombre`, `clima`, `altitud`, `topografia`, `descripcion`) VALUES
(1, 'Bosque templado caducifolio', 'templado', '500-1500', 'colina', 'Bosques con árboles que pierden sus hojas en otoño. Suelen encontrarse en zonas de clima templado con estaciones marcadas.'),
(2, 'Bosque templado de coníferas', 'templado', '500-3000', 'montaña', 'Bosques dominados por pinos y abetos. Comunes en regiones montañosas con clima frío y templado.'),
(3, 'Bosque mediterráneo', 'templado', '0-500', 'colina', 'Ecosistema caracterizado por veranos secos e inviernos suaves. Dominado por matorrales y encinas.'),
(4, 'Bosque boreal', 'frio', '500-1500', 'llanura', 'Amplias extensiones de coníferas en regiones frías del hemisferio norte. Suelo pobre y clima severo.'),
(5, 'Selva tropical húmeda', 'tropical', '0-500', 'llanura', 'Bosques con gran biodiversidad, altas precipitaciones y temperaturas elevadas durante todo el año.'),
(6, 'Selva subtropical', 'subtropical', '0-500', 'llanura', 'Bosques cálidos y húmedos, con estaciones menos marcadas que los tropicales.'),
(7, 'Sabana', 'tropical', '500-1500', 'llanura', 'Región de pastizales con árboles dispersos, clima tropical con estaciones seca y húmeda.'),
(8, 'Pradera templada', 'templado', '500-1500', 'llanura', 'Extensos pastizales ubicados en regiones de clima templado y precipitaciones moderadas.'),
(9, 'Matorral xerófilo', 'seco', '0-1500', 'colina', 'Vegetación de arbustos resistentes a la sequía. Típico de zonas áridas y semiáridas.'),
(10, 'Desierto cálido', 'seco', '0-500', 'llanura', 'Regiones extremadamente secas, con altas temperaturas y vegetación escasa.'),
(11, 'Desierto frío', 'frio', '500-3000', 'meseta', 'Zonas áridas con temperaturas muy bajas y vegetación mínima.'),
(12, 'Tundra alpina', 'frio', '3000-5000', 'montaña', 'Ecosistema en zonas de alta montaña, frío extremo, sin árboles y con vegetación baja.'),
(13, 'Tundra ártica', 'polar', '0-500', 'llanura', 'Región extremadamente fría del hemisferio norte, con permafrost y vegetación escasa.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reino`
--

CREATE TABLE `reino` (
  `id` int(11) NOT NULL,
  `nombre_cientifico` varchar(150) NOT NULL,
  `nombre` varchar(150) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reino`
--

INSERT INTO `reino` (`id`, `nombre_cientifico`, `nombre`, `descripcion`) VALUES
(1, 'Plantae', 'Plantae', 'Organismos autótrofos y producen su propio alimento utilizando la luz solar, agua y dióxido de carbono');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uso`
--

CREATE TABLE `uso` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uso_especie`
--

CREATE TABLE `uso_especie` (
  `especie_id` int(11) NOT NULL,
  `uso_id` int(11) NOT NULL,
  `comentario` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_cientifico` (`nombre_cientifico`),
  ADD KEY `division_id` (`division_id`);

--
-- Indices de la tabla `descubrimiento`
--
ALTER TABLE `descubrimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `division`
--
ALTER TABLE `division`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_cientifico` (`nombre_cientifico`),
  ADD KEY `reino_id` (`reino_id`);

--
-- Indices de la tabla `especie`
--
ALTER TABLE `especie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genero_id` (`genero_id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `descubrimiento_id` (`descubrimiento_id`);

--
-- Indices de la tabla `especie_propiedad_quimica`
--
ALTER TABLE `especie_propiedad_quimica`
  ADD PRIMARY KEY (`especie_id`,`propiedad_id`),
  ADD KEY `propiedad_id` (`propiedad_id`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_cientifico` (`nombre_cientifico`),
  ADD KEY `orden_id` (`orden_id`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_cientifico` (`nombre_cientifico`),
  ADD KEY `familia_id` (`familia_id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_cientifico` (`nombre_cientifico`),
  ADD KEY `clase_id` (`clase_id`);

--
-- Indices de la tabla `propiedades_quimicas`
--
ALTER TABLE `propiedades_quimicas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `region`
--
ALTER TABLE `region`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reino`
--
ALTER TABLE `reino`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre_cientifico` (`nombre_cientifico`);

--
-- Indices de la tabla `uso`
--
ALTER TABLE `uso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uso_especie`
--
ALTER TABLE `uso_especie`
  ADD PRIMARY KEY (`especie_id`,`uso_id`),
  ADD KEY `uso_id` (`uso_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `descubrimiento`
--
ALTER TABLE `descubrimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `division`
--
ALTER TABLE `division`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `especie`
--
ALTER TABLE `especie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `propiedades_quimicas`
--
ALTER TABLE `propiedades_quimicas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `region`
--
ALTER TABLE `region`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `reino`
--
ALTER TABLE `reino`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `uso`
--
ALTER TABLE `uso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `clase_ibfk_1` FOREIGN KEY (`division_id`) REFERENCES `division` (`id`);

--
-- Filtros para la tabla `division`
--
ALTER TABLE `division`
  ADD CONSTRAINT `division_ibfk_1` FOREIGN KEY (`reino_id`) REFERENCES `reino` (`id`);

--
-- Filtros para la tabla `especie`
--
ALTER TABLE `especie`
  ADD CONSTRAINT `especie_ibfk_1` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`),
  ADD CONSTRAINT `especie_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  ADD CONSTRAINT `especie_ibfk_3` FOREIGN KEY (`descubrimiento_id`) REFERENCES `descubrimiento` (`id`);

--
-- Filtros para la tabla `especie_propiedad_quimica`
--
ALTER TABLE `especie_propiedad_quimica`
  ADD CONSTRAINT `especie_propiedad_quimica_ibfk_1` FOREIGN KEY (`especie_id`) REFERENCES `especie` (`id`),
  ADD CONSTRAINT `especie_propiedad_quimica_ibfk_2` FOREIGN KEY (`propiedad_id`) REFERENCES `propiedades_quimicas` (`id`);

--
-- Filtros para la tabla `familia`
--
ALTER TABLE `familia`
  ADD CONSTRAINT `familia_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`);

--
-- Filtros para la tabla `genero`
--
ALTER TABLE `genero`
  ADD CONSTRAINT `genero_ibfk_1` FOREIGN KEY (`familia_id`) REFERENCES `familia` (`id`);

--
-- Filtros para la tabla `orden`
--
ALTER TABLE `orden`
  ADD CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`clase_id`) REFERENCES `clase` (`id`);

--
-- Filtros para la tabla `uso_especie`
--
ALTER TABLE `uso_especie`
  ADD CONSTRAINT `uso_especie_ibfk_1` FOREIGN KEY (`especie_id`) REFERENCES `especie` (`id`),
  ADD CONSTRAINT `uso_especie_ibfk_2` FOREIGN KEY (`uso_id`) REFERENCES `uso` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
