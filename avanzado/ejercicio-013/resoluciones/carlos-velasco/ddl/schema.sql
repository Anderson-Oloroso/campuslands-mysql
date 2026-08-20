CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas;


CREATE TABLE peliculas (
    id_pelicula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_estreno YEAR NOT NULL,
    genero VARCHAR(50) NOT NULL,
    estado ENUM('disponible', 'retirada') NOT NULL DEFAULT 'disponible',
    detalles_json JSON NOT NULL,

    CONSTRAINT uq_peliculas_titulo_anio
        UNIQUE (titulo, anio_estreno),

    CONSTRAINT chk_peliculas_titulo
        CHECK (CHAR_LENGTH(TRIM(titulo)) >= 2),

    CONSTRAINT chk_peliculas_json
        CHECK (JSON_VALID(detalles_json))
);