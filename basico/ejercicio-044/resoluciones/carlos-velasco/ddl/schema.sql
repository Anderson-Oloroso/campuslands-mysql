CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_ciencia_ficcion;

CREATE TABLE peliculas_ciencia_ficcion (
    id_pelicula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    episodio TINYINT UNSIGNED NOT NULL,
    director VARCHAR(120) NOT NULL,
    fecha_estreno DATE NOT NULL,
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    calificacion DECIMAL(3,1) NOT NULL,
    estado ENUM('disponible', 'retirada') NOT NULL DEFAULT 'disponible',

    CONSTRAINT uq_pelicula_episodio
        UNIQUE (episodio),

    CONSTRAINT chk_pelicula_episodio
        CHECK (episodio BETWEEN 1 AND 20),

    CONSTRAINT chk_pelicula_duracion
        CHECK (duracion_minutos BETWEEN 60 AND 300),

    CONSTRAINT chk_pelicula_calificacion
        CHECK (calificacion BETWEEN 0.0 AND 10.0)
);