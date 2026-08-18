DROP DATABASE IF EXISTS ejercicio_14_int;
CREATE DATABASE ejercicio_14_int;
USE ejercicio_14_int;

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    episodio INT NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion_minutos INT NOT NULL,
    CHECK (episodio > 0),
    CHECK (duracion_minutos > 0)
);

CREATE TABLE personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especie VARCHAR(60) NOT NULL,
    rol VARCHAR(50) NOT NULL
);

CREATE TABLE planetas (
    id_planeta INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    sistema VARCHAR(100) NOT NULL,
    poblacion BIGINT NOT NULL,
    CHECK (poblacion >= 0)
);

CREATE TABLE pelicula_personajes (
    id_pelicula INT NOT NULL,
    id_personaje INT NOT NULL,
    PRIMARY KEY (id_pelicula, id_personaje),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_personaje) REFERENCES personajes(id_personaje)
);

CREATE TABLE pelicula_planetas (
    id_pelicula INT NOT NULL,
    id_planeta INT NOT NULL,
    PRIMARY KEY (id_pelicula, id_planeta),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_planeta) REFERENCES planetas(id_planeta)
);