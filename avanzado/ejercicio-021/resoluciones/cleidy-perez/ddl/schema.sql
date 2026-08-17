-- Campuslands MySQL - avanzado ejercicio 021
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS dibujo_digital;
USE dibujo_digital;
-- 1. Tabla de Ilustradores / Artistas
CREATE TABLE A rtistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Proyectos (
    proyecto_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    artista_id INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES Artistas(artista_id)
);

CREATE TABLE Proyecto_Software (
    proyecto_id INT NOT NULL,
    software_nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (proyecto_id, software_nombre),
    FOREIGN KEY (proyecto_id) REFERENCES Proyectos(proyecto_id)
);