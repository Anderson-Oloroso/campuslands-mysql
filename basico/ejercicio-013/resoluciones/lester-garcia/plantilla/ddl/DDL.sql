DROP DATABASE IF EXISTS ejercicio_13;
CREATE DATABASE IF NOT EXISTS ejercicio_13;
USE ejercicio_13;

CREATE TABLE directores (
    id_director INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL
);

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL UNIQUE,
    anio_lanzamiento YEAR NOT NULL,
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    clasificacion VARCHAR(10) NOT NULL,
    estado ENUM('Disponible', 'No disponible', 'Proximamente') NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    id_director INT NOT NULL,
    FOREIGN KEY (id_director) REFERENCES directores(id_director)
);

CREATE TABLE generos (
    id_genero INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE pelicula_genero (
    id_pelicula INT NOT NULL,
    id_genero INT NOT NULL,
    PRIMARY KEY (id_pelicula, id_genero),
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula),
    FOREIGN KEY (id_genero) REFERENCES generos(id_genero)
);


