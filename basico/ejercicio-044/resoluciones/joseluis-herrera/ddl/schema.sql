CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_ciencia_ficcion;

CREATE TABLE peliculas_ciencia_ficcion (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    fecha_estreno DATE NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    puntuacion DECIMAL(3,1) NOT NULL,
    CONSTRAINT chk_pelicula_duracion
        CHECK (duracion_minutos > 0),
    CONSTRAINT chk_pelicula_puntuacion
        CHECK (puntuacion BETWEEN 0.0 AND 10.0)
);