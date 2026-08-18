CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS pelicula_genero;
DROP TABLE IF EXISTS generos;
DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id_pelicula INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(120) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    calificacion DECIMAL(3,1) NOT NULL,
    estado ENUM('disponible', 'retirada') NOT NULL DEFAULT 'disponible',

    CONSTRAINT chk_pelicula_duracion
        CHECK (duracion_minutos BETWEEN 60 AND 240),

    CONSTRAINT chk_pelicula_calificacion
        CHECK (calificacion BETWEEN 0.0 AND 10.0)
);

CREATE TABLE generos (
    id_genero INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE pelicula_genero (
    id_pelicula INT UNSIGNED NOT NULL,
    id_genero INT UNSIGNED NOT NULL,

    PRIMARY KEY (id_pelicula, id_genero),

    CONSTRAINT fk_pelicula_genero_pelicula
        FOREIGN KEY (id_pelicula)
        REFERENCES peliculas(id_pelicula)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_pelicula_genero_genero
        FOREIGN KEY (id_genero)
        REFERENCES generos(id_genero)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);