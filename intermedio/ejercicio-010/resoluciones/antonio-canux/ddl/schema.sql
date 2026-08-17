-- Campuslands MySQL - intermedio ejercicio 010
-- Contexto: Modulo de datos para carreras urbanas (Restriccion UNIQUE).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_010_vehiculos;
DROP TABLE IF EXISTS intermedio_ejercicio_010_corredores;

CREATE TABLE intermedio_ejercicio_010_corredores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  apodo VARCHAR(50) NOT NULL UNIQUE,
  nombre_real VARCHAR(100) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_010_vehiculos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  corredor_id INT NOT NULL,
  placa VARCHAR(15) NOT NULL UNIQUE,
  modelo VARCHAR(100) NOT NULL,
  notas_mecanicas VARCHAR(200) NOT NULL,
  FOREIGN KEY (corredor_id) REFERENCES intermedio_ejercicio_010_corredores(id)
);