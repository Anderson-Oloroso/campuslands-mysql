-- Campuslands MySQL - intermedio ejercicio 019
-- Contexto: Modulo de datos para paracaidismo (HAVING).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_019_saltos;

CREATE TABLE intermedio_ejercicio_019_saltos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  instructor VARCHAR(100) NOT NULL,
  zona_salto VARCHAR(100) NOT NULL,
  modalidad ENUM('Tandem', 'Libre', 'Base', 'Formacion') NOT NULL,
  altitud_pies INT NOT NULL,
  exitoso BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_salto DATE NOT NULL
);