-- Campuslands MySQL - basico ejercicio 007
-- Contexto: Modulo de datos para liga de futbol.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_007;

CREATE TABLE basico_ejercicio_007 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  ciudad VARCHAR(50) NOT NULL,
  partidos_jugados INT NOT NULL DEFAULT 0,
  puntos INT NOT NULL DEFAULT 0,
  goles_a_favor INT NOT NULL DEFAULT 0,
  goles_en_contra INT NOT NULL DEFAULT 0,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);