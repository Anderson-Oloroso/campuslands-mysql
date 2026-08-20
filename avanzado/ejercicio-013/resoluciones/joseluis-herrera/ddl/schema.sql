CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    anio YEAR NOT NULL,
    puntaje DECIMAL(3,1) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    detalles JSON NOT NULL,

    CONSTRAINT chk_pelicula_puntaje
        CHECK (puntaje >= 0 AND puntaje <= 10),

    CONSTRAINT chk_detalles_json
        CHECK (JSON_VALID(detalles))
);