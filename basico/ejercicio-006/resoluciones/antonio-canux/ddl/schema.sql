-- Campuslands MySQL - basico ejercicio 006
-- Contexto: Modulo de datos para autos hiperdeportivos.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_006;

CREATE TABLE basico_ejercicio_006 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(100) NOT NULL,
  caballos_fuerza INT NOT NULL,
  velocidad_maxima DECIMAL(6,2) NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  estado ENUM('produccion','descontinuado','concepto') NOT NULL DEFAULT 'produccion',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);