CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100) NOT NULL,
    subgenero VARCHAR(50) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion_minutos INT UNSIGNED NOT NULL,
    calificacion DECIMAL(3,1) NOT NULL,
    estado ENUM('disponible', 'no_disponible') NOT NULL DEFAULT 'disponible',
    CONSTRAINT uq_peliculas_titulo UNIQUE (titulo),
    CONSTRAINT chk_peliculas_duracion CHECK (duracion_minutos > 0),
    CONSTRAINT chk_peliculas_calificacion CHECK (calificacion BETWEEN 0 AND 10)
);