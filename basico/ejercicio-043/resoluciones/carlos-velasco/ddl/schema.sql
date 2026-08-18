CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_miedo;

CREATE TABLE peliculas_miedo (
    id_pelicula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100) NOT NULL,
    subgenero VARCHAR(50) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    puntuacion DECIMAL(3,1) NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',

    CONSTRAINT chk_duracion_positiva
        CHECK (duracion_minutos > 0),

    CONSTRAINT chk_puntuacion_valida
        CHECK (puntuacion BETWEEN 0 AND 10),

    CONSTRAINT chk_anio_valido
        CHECK (anio_estreno BETWEEN 1900 AND 2100)
);