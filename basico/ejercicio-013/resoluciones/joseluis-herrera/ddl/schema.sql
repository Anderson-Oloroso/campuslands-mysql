CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_miedo;

CREATE TABLE peliculas_miedo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    director VARCHAR(80) NOT NULL,
    anio YEAR NOT NULL,
    puntaje DECIMAL(3,1) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CHECK (puntaje >= 0 AND puntaje <= 10)
);