CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP VIEW IF EXISTS vw_peliculas_ciencia_ficcion;

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    saga VARCHAR(100) NOT NULL,
    anio_estreno YEAR NOT NULL,
    director VARCHAR(100) NOT NULL,
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    puntuacion DECIMAL(3,1) NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',

    CONSTRAINT chk_puntuacion
        CHECK (puntuacion BETWEEN 0.0 AND 10.0),

    CONSTRAINT chk_duracion
        CHECK (duracion_minutos > 0)
);

CREATE VIEW vw_peliculas_ciencia_ficcion AS
SELECT
    id_pelicula,
    titulo,
    saga,
    anio_estreno,
    director,
    duracion_minutos,
    puntuacion,
    estado
FROM peliculas
WHERE estado = 'activa';