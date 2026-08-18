-- Campuslands MySQL - intermedio ejercicio 013
-- Tematica: catalogo de peliculas de miedo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pelicula_genero;
DROP TABLE IF EXISTS peliculas_miedo;
DROP TABLE IF EXISTS generos_miedo;

CREATE TABLE peliculas_miedo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(120) NOT NULL,
  anio_estreno YEAR NOT NULL,
  duracion_min INT NOT NULL
);

CREATE TABLE generos_miedo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL UNIQUE
);

-- Tabla puente: relacion muchos a muchos entre peliculas y generos
CREATE TABLE pelicula_genero (
  pelicula_id INT NOT NULL,
  genero_id INT NOT NULL,
  PRIMARY KEY (pelicula_id, genero_id),
  CONSTRAINT fk_pg_pelicula FOREIGN KEY (pelicula_id) REFERENCES peliculas_miedo(id),
  CONSTRAINT fk_pg_genero FOREIGN KEY (genero_id) REFERENCES generos_miedo(id)
);
