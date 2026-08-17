-- Campuslands MySQL - intermedio ejercicio 014
-- Resolución por: Sergio Miranda Ajú
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ejercicio_014_personajes_saga;

CREATE TABLE ejercicio_014_personajes_saga (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  afiliacion VARCHAR(80) NOT NULL,
  poder_combate DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('vivo', 'fallecido', 'desaparecido', 'capturado') NOT NULL DEFAULT 'vivo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);