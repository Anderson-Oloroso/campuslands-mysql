-- Campuslands MySQL - Intermedio Ejercicio 013
-- Tema: Tablas puente

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS peliculas_generos;
DROP TABLE IF EXISTS generos;
DROP TABLE IF EXISTS peliculas;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE peliculas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    director VARCHAR(100) NOT NULL,
    estreno DATE NOT NULL,
    estado ENUM('Disponible','No disponible') NOT NULL DEFAULT 'Disponible'
);

CREATE TABLE generos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE peliculas_generos(
    pelicula_id INT NOT NULL,
    genero_id INT NOT NULL,

    PRIMARY KEY(pelicula_id,genero_id),

    FOREIGN KEY(pelicula_id)
        REFERENCES peliculas(id),

    FOREIGN KEY(genero_id)
        REFERENCES generos(id)
);