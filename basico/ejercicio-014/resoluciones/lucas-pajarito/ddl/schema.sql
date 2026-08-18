-- Campuslands MySQL - basico ejercicio 014
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_014;

CREATE TABLE basico_ejercicio_014 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  categoria VARCHAR(80) NOT NULL,
  puntaje INT NOT NULL DEFAULT 0,
  creado_en DATE NOT NULL
);
