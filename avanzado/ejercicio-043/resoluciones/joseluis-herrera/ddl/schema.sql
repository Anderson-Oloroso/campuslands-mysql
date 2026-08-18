CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_miedo;

CREATE TABLE peliculas_miedo (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_estreno YEAR NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',
    puntuacion DECIMAL(3,1) NOT NULL,
    detalles JSON NOT NULL,
    CONSTRAINT chk_pelicula_puntuacion
        CHECK (puntuacion BETWEEN 0.0 AND 10.0),
    CONSTRAINT chk_pelicula_detalles_json
        CHECK (JSON_TYPE(detalles) = 'OBJECT')
);