CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS pelicula_actor;
DROP TABLE IF EXISTS actores;
DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100) NOT NULL,
    subgenero VARCHAR(50) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion_minutos INT UNSIGNED NOT NULL,
    calificacion DECIMAL(3,1) NOT NULL,
    estado ENUM('disponible', 'no_disponible') NOT NULL DEFAULT 'disponible',
    CONSTRAINT uq_peliculas_titulo UNIQUE (titulo),
    CONSTRAINT chk_peliculas_duracion CHECK (duracion_minutos > 0),
    CONSTRAINT chk_peliculas_calificacion CHECK (calificacion BETWEEN 0 AND 10)
);

CREATE TABLE actores (
    id_actor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(60) NOT NULL,
    CONSTRAINT uq_actores_nombre UNIQUE (nombre)
);

CREATE TABLE pelicula_actor (
    id_pelicula INT NOT NULL,
    id_actor INT NOT NULL,
    personaje VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_pelicula, id_actor),
    CONSTRAINT fk_pelicula_actor_pelicula
        FOREIGN KEY (id_pelicula)
        REFERENCES peliculas(id_pelicula),
    CONSTRAINT fk_pelicula_actor_actor
        FOREIGN KEY (id_actor)
        REFERENCES actores(id_actor)
);