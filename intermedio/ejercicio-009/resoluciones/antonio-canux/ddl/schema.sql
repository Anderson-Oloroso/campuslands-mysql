-- Campuslands MySQL - intermedio ejercicio 009
-- Contexto: Modulo de datos para kickboxing (Llaves Foraneas).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_009_peleadores;
DROP TABLE IF EXISTS intermedio_ejercicio_009_gimnasios;

CREATE TABLE intermedio_ejercicio_009_gimnasios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ubicacion VARCHAR(100) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_009_peleadores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  categoria_peso VARCHAR(50) NOT NULL,
  gimnasio_id INT NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (gimnasio_id) REFERENCES intermedio_ejercicio_009_gimnasios(id)
);