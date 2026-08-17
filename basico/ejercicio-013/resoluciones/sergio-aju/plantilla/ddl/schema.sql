CREATE DATABASE IF NOT EXISTS db_peliculas_miedo;
USE db_peliculas_miedo;

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    director VARCHAR(100) NOT NULL,
    subgenero VARCHAR(50) NOT NULL,
    anio_estreno INT NOT NULL,
    puntaje DECIMAL(3,1) NOT NULL CHECK (puntaje >= 0.0 AND puntaje <= 10.0),
    estado ENUM('Disponible', 'Proximamente', 'Archivada') DEFAULT 'Disponible'
);