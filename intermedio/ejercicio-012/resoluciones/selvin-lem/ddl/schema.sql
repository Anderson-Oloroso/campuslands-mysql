-- Campuslands MySQL - intermedio ejercicio 012
-- Tematica: playlist musical
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist;

CREATE TABLE canciones_playlist (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(120) NOT NULL,
  artista VARCHAR(100) NOT NULL,
  genero VARCHAR(60) NOT NULL,
  duracion_segundos INT NOT NULL,
  reproducciones INT NOT NULL DEFAULT 0,
  fecha_agregada DATE NOT NULL
);
