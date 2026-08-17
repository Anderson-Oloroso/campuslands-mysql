-- Campuslands MySQL - intermedio ejercicio 008
-- Contexto: Modulo de datos para futbol sala (Normalizacion 3FN).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_008_equipos;
DROP TABLE IF EXISTS intermedio_ejercicio_008_categorias;

CREATE TABLE intermedio_ejercicio_008_categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nivel VARCHAR(50) NOT NULL,
  costo_inscripcion DECIMAL(10,2) NOT NULL,
  premio_campeon DECIMAL(12,2) NOT NULL
);

CREATE TABLE intermedio_ejercicio_008_equipos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  entrenador VARCHAR(100) NOT NULL,
  categoria_id INT NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (categoria_id) REFERENCES intermedio_ejercicio_008_categorias(id)
);