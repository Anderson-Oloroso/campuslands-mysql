DROP DATABASE IF EXISTS ejercicio_13_int;

CREATE DATABASE ejercicio_13_int;

USE ejercicio_13_int;

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion_minutos INT NOT NULL,
    clasificacion VARCHAR(10) NOT NULL,
    CHECK (duracion_minutos > 0)
);

CREATE TABLE actores (
    id_actor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(60) NOT NULL
);

CREATE TABLE directores (
    id_director INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(60) NOT NULL
);

CREATE TABLE generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE pelicula_directores (
    id_pelicula INT NOT NULL,
    id_director INT NOT NULL,
    PRIMARY KEY (id_pelicula, id_director),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_director) REFERENCES directores(id_director)
);

CREATE TABLE pelicula_generos (
    id_pelicula INT NOT NULL,
    id_genero INT NOT NULL,
    PRIMARY KEY (id_pelicula, id_genero),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);

CREATE TABLE pelicula_actores (
    id_pelicula INT NOT NULL,
    id_actor INT NOT NULL,
    personaje VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_pelicula, id_actor),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_actor) REFERENCES actores(id_actor)
);