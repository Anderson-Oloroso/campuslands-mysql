-- Campuslands MySQL - Básico Ejercicio 013
-- Tema: Filtros por estado

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS peliculas;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    anio_estreno YEAR NOT NULL,
    duracion_minutos INT NOT NULL,
    estado ENUM('Disponible','Alquilada','Retirada') NOT NULL DEFAULT 'Disponible',
    clasificacion ENUM('PG-13','R','NR') NOT NULL,

    CHECK (duracion_minutos > 0)
);