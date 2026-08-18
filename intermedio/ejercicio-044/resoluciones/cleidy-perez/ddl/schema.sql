-- Campuslands MySQL - intermedio ejercicio 014
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE Sagas (
    saga_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_saga VARCHAR(100) NOT NULL UNIQUE,
    creador VARCHAR(100) NOT NULL,
    origen VARCHAR(50) NOT NULL
);

CREATE TABLE Peliculas (
    pelicula_id INT AUTO_INCREMENT PRIMARY KEY,
    saga_id INT NOT NULL,
    titulo VARCHAR(100) NOT NULL,
    anio_estreno INT NOT NULL CHECK (anio_estreno >= 1900),
    recaudacion_millones DECIMAL(8,2) NOT NULL CHECK (recaudacion_millones >= 0),
    FOREIGN KEY (saga_id) REFERENCES Sagas(saga_id) ON DELETE CASCADE
);
