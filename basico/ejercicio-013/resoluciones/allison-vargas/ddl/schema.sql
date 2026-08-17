-- DDL: Estructura del catálogo de películas de miedo con gestión de estados
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_miedo;

CREATE TABLE peliculas_miedo (
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(80) NOT NULL,
    subgenero VARCHAR(50) NOT NULL,
    duracion_minutos INT NOT NULL CHECK (duracion_minutos > 0),
    calificacion_imdb DECIMAL(3,1) NOT NULL CHECK (calificacion_imdb BETWEEN 0.0 AND 10.0),
    estado ENUM('disponible', 'proximamente', 'archivada', 'restringida') DEFAULT 'disponible',
    fecha_adicion DATE NOT NULL
) ENGINE=InnoDB;
