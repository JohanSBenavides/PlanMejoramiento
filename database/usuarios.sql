-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2025 a las 01:28:01
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notas_academicas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `idRol` int(10) UNSIGNED NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `password`, `idRol`, `createdAt`, `updatedAt`) VALUES
(1, 'Super Admin', 'admin@notas.com', '$2a$10$IZq5fQND3qjfNjyFA4/0FOU7y7uyUq1Fh9w3eXWgZWR7ZPFl9YZ8.', 1, '2025-12-11 00:26:53', '2025-12-11 00:26:53'),
(2, 'Profesor 1', 'prof1@notas.com', '$2a$10$PfhlBRm1mQR8drJJC2lcfO7lGz8JGld5qVYp2RXAECk9SgS6yNRoC', 2, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(3, 'Profesor 2', 'prof2@notas.com', '$2a$10$PfhlBRm1mQR8drJJC2lcfO7lGz8JGld5qVYp2RXAECk9SgS6yNRoC', 2, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(4, 'Profesor 3', 'prof3@notas.com', '$2a$10$PfhlBRm1mQR8drJJC2lcfO7lGz8JGld5qVYp2RXAECk9SgS6yNRoC', 2, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(5, 'Profesor 4', 'prof4@notas.com', '$2a$10$PfhlBRm1mQR8drJJC2lcfO7lGz8JGld5qVYp2RXAECk9SgS6yNRoC', 2, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(6, 'Profesor 5', 'prof5@notas.com', '$2a$10$PfhlBRm1mQR8drJJC2lcfO7lGz8JGld5qVYp2RXAECk9SgS6yNRoC', 2, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(7, 'Profesor 6', 'prof6@notas.com', '$2a$10$PfhlBRm1mQR8drJJC2lcfO7lGz8JGld5qVYp2RXAECk9SgS6yNRoC', 2, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(8, 'Estudiante 1', 'est1@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(9, 'Estudiante 2', 'est2@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(10, 'Estudiante 3', 'est3@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(11, 'Estudiante 4', 'est4@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(12, 'Estudiante 5', 'est5@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(13, 'Estudiante 6', 'est6@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(14, 'Estudiante 7', 'est7@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(15, 'Estudiante 8', 'est8@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(16, 'Estudiante 9', 'est9@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(17, 'Estudiante 10', 'est10@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(18, 'Estudiante 11', 'est11@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(19, 'Estudiante 12', 'est12@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(20, 'Estudiante 13', 'est13@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(21, 'Estudiante 14', 'est14@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(22, 'Estudiante 15', 'est15@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(23, 'Estudiante 16', 'est16@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(24, 'Estudiante 17', 'est17@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(25, 'Estudiante 18', 'est18@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(26, 'Estudiante 19', 'est19@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59'),
(27, 'Estudiante 20', 'est20@notas.com', '$2a$10$X6nuDWIfktg/MOBraNeux.ye9Q8FWFEtlaWCL4.LUpEBAJb61SIQS', 3, '2025-12-11 00:26:59', '2025-12-11 00:26:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `idRol` (`idRol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
