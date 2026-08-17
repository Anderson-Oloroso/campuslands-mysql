-- Campuslands MySQL - intermedio ejercicio 043
-- Resolucion: maria-montepeque
-- Tema: catalogo de peliculas de miedo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS reparto_intermedio;
DROP TABLE IF EXISTS peliculas_intermedio;
DROP TABLE IF EXISTS actores_intermedio;

CREATE TABLE peliculas_intermedio (
  id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL UNIQUE,
  subgenero ENUM('slasher','sobrenatural','psicologico','zombis','found_footage') NOT NULL,
  duracion_min INT NOT NULL,
  CONSTRAINT chk_peliculas_intermedio_duracion CHECK (duracion_min > 0)
);

CREATE TABLE actores_intermedio (
  id_actor INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  nacionalidad VARCHAR(60) NOT NULL
);

-- Tabla puente: un actor puede aparecer en varias peliculas y una
-- pelicula puede tener varios actores (muchos a muchos). La llave
-- primaria compuesta identifica cada participacion y de paso impide
-- que el mismo actor quede registrado dos veces en la misma pelicula.
CREATE TABLE reparto_intermedio (
  id_pelicula INT NOT NULL,
  id_actor INT NOT NULL,
  personaje VARCHAR(120) NOT NULL,
  papel_principal BOOLEAN NOT NULL DEFAULT FALSE,
  PRIMARY KEY (id_pelicula, id_actor),
  CONSTRAINT fk_reparto_intermedio_pelicula FOREIGN KEY (id_pelicula) REFERENCES peliculas_intermedio (id_pelicula),
  CONSTRAINT fk_reparto_intermedio_actor FOREIGN KEY (id_actor) REFERENCES actores_intermedio (id_actor)
);
