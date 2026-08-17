-- Campuslands MySQL - basico ejercicio 010
-- Contexto: Modulo de datos para carreras urbanas.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_010;

CREATE TABLE basico_ejercicio_010 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  corredor VARCHAR(100) NOT NULL,
  vehiculo VARCHAR(100) NOT NULL,
  carreras_ganadas INT NOT NULL DEFAULT 0,
  dinero_apostado DECIMAL(12,2) NOT NULL DEFAULT 0,
  estado ENUM('activo','arrestado','retirado') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);