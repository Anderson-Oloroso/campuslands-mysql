-- Campuslands MySQL - basico ejercicio 009
-- Contexto: Modulo de datos para kickboxing.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_009;

CREATE TABLE basico_ejercicio_009 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  peleador VARCHAR(100) NOT NULL,
  categoria_peso VARCHAR(50) NOT NULL,
  victorias INT NOT NULL DEFAULT 0,
  derrotas INT NOT NULL DEFAULT 0,
  estado ENUM('activo','retirado','suspendido') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);