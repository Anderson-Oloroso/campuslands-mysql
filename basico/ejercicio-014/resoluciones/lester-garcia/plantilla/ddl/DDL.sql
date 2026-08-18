DROP DATABASE IF EXISTS ejercicio_14;
CREATE DATABASE ejercicio_14;
USE ejercicio_14;

CREATE TABLE sagas (
    id_saga INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    creador VARCHAR(80) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE
);

CREATE TABLE peliculas (
    id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    fecha_estreno DATE NOT NULL,
    duracion_minutos SMALLINT UNSIGNED NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL,
    id_saga INT NOT NULL,
    FOREIGN KEY (id_saga) REFERENCES sagas(id_saga)
);

CREATE TABLE personajes (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    fecha_creacion DATE NOT NULL,
    id_saga INT NOT NULL,
    FOREIGN KEY (id_saga) REFERENCES sagas(id_saga)
);

CREATE TABLE lanzamientos (
    id_lanzamiento INT AUTO_INCREMENT PRIMARY KEY,
    id_pelicula INT NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    hora_lanzamiento TIME NOT NULL,
    FOREIGN KEY (id_pelicula) REFERENCES peliculas(id_pelicula)
);