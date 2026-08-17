-- Campuslands MySQL - intermedio ejercicio 006
-- Contexto: Modulo de datos para autos hiperdeportivos (Normalizacion 1FN).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_006_colores;
DROP TABLE IF EXISTS intermedio_ejercicio_006_autos;

CREATE TABLE intermedio_ejercicio_006_autos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_006_colores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  auto_id INT NOT NULL,
  color VARCHAR(50) NOT NULL,
  FOREIGN KEY (auto_id) REFERENCES intermedio_ejercicio_006_autos(id)
);