-- Campuslands MySQL - avanzado ejercicio 012
-- Contexto: Modulo de datos para playlist musical (Window Functions).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_012_canciones;

CREATE TABLE avanzado_ejercicio_012_canciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  artista VARCHAR(150) NOT NULL,
  genero VARCHAR(50) NOT NULL,
  reproducciones INT NOT NULL DEFAULT 0,
  fecha_agregada DATE NOT NULL
);