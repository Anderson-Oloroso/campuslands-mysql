-- Campuslands MySQL - intermedio ejercicio 020
-- Contexto: Modulo de datos para estudio de tatuajes (Subconsultas).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_020_tatuajes;
DROP TABLE IF EXISTS intermedio_ejercicio_020_artistas;

CREATE TABLE intermedio_ejercicio_020_artistas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  especialidad VARCHAR(50) NOT NULL
);

CREATE TABLE intermedio_ejercicio_020_tatuajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  artista_id INT NOT NULL,
  cliente VARCHAR(100) NOT NULL,
  estilo ENUM('Tradicional', 'Realismo', 'Blackwork', 'Acuarela', 'Minimalista', 'Japones') NOT NULL,
  precio DECIMAL(6,2) NOT NULL,
  fecha_sesion DATE NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES intermedio_ejercicio_020_artistas(id) ON DELETE CASCADE
);