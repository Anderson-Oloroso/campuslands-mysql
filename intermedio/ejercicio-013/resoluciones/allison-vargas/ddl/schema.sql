-- DDL: Modelado relacional N:M utilizando tabla puente entre Películas y Subgéneros
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pelicula_subgenero;
DROP TABLE IF EXISTS subgeneros_terror;
DROP TABLE IF EXISTS peliculas_catalogo;

CREATE TABLE peliculas_catalogo (
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    director VARCHAR(80) NOT NULL,
    anio_estreno INT NOT NULL CHECK (anio_estreno >= 1895),
    duracion_minutos INT NOT NULL CHECK (duracion_minutos > 0),
    calificacion_imdb DECIMAL(3,1) NOT NULL CHECK (calificacion_imdb BETWEEN 0.0 AND 10.0),
    estado ENUM('disponible', 'proximamente', 'archivada') DEFAULT 'disponible'
) ENGINE=InnoDB;

CREATE TABLE subgeneros_terror (
    subgenero_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_subgenero VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- Tabla puente para la relación N:M
CREATE TABLE pelicula_subgenero (
    pelicula_id INT NOT NULL,
    subgenero_id INT NOT NULL,
    PRIMARY KEY (pelicula_id, subgenero_id),
    FOREIGN KEY (pelicula_id) REFERENCES peliculas_catalogo(pelicula_id) ON DELETE CASCADE,
    FOREIGN KEY (subgenero_id) REFERENCES subgeneros_terror(subgenero_id) ON DELETE CASCADE
) ENGINE=InnoDB;
