-- Campuslands MySQL - basico ejercicio 019
-- Contexto: Modulo de datos para paracaidismo (INSERT).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_019_saltos;

CREATE TABLE basico_ejercicio_019_saltos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  paracaidista VARCHAR(100) NOT NULL,
  tipo_salto ENUM('Tandem', 'Libre', 'Base', 'Formacion') NOT NULL,
  altitud_pies INT NOT NULL,
  exitoso BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_salto DATE NOT NULL
);