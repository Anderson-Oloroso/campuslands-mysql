CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    saga VARCHAR(100) NOT NULL,
    fecha_estreno DATE NOT NULL,
    puntaje DECIMAL(3,1) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_pelicula_puntaje
        CHECK (puntaje >= 0 AND puntaje <= 10)
);