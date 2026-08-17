-- Campuslands MySQL - basico ejercicio 043
-- Resolucion: maria-montepeque
-- Tema: catalogo de peliculas de miedo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_basico;

CREATE TABLE peliculas_basico (
  id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  subgenero ENUM('slasher','sobrenatural','psicologico','zombis','found_footage') NOT NULL,
  estado ENUM('disponible','proximamente','retirada','en_revision') NOT NULL DEFAULT 'disponible',
  anio_estreno INT NOT NULL,
  calificacion_usuarios DECIMAL(3,1) NOT NULL DEFAULT 0,
  CONSTRAINT chk_peliculas_basico_calificacion CHECK (calificacion_usuarios BETWEEN 0 AND 10)
);
