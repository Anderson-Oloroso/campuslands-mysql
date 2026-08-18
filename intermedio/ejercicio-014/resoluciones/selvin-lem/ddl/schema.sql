-- Campuslands MySQL - intermedio ejercicio 014
-- Tematica: saga de ciencia ficcion
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_saga;

CREATE TABLE peliculas_saga (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(120) NOT NULL,
  saga VARCHAR(80) NOT NULL,
  episodio INT NOT NULL,
  anio_estreno YEAR NOT NULL,
  calificacion DECIMAL(3,1) NOT NULL
);
