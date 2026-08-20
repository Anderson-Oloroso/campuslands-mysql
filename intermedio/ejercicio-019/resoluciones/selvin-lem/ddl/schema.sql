-- Campuslands MySQL - intermedio ejercicio 019
-- Tematica: paracaidismo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS saltos_paracaidismo;

CREATE TABLE saltos_paracaidismo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  instructor VARCHAR(100) NOT NULL,
  cliente VARCHAR(100) NOT NULL,
  altura_metros INT NOT NULL,
  duracion_caida_segundos INT NOT NULL,
  fecha_salto DATE NOT NULL
);
