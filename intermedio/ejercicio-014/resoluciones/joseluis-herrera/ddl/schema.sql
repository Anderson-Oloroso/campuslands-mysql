CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP VIEW IF EXISTS vista_top_peliculas;
DROP VIEW IF EXISTS vista_peliculas_activas;

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

CREATE VIEW vista_peliculas_activas AS
SELECT
    id,
    titulo,
    saga,
    fecha_estreno,
    puntaje
FROM peliculas
WHERE estado = 'activo';

CREATE VIEW vista_top_peliculas AS
SELECT
    id,
    titulo,
    saga,
    fecha_estreno,
    puntaje
FROM peliculas
WHERE estado = 'activo'
  AND puntaje >= 8.0;