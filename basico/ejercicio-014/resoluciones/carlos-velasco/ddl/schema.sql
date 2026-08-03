-- Campuslands MySQL - Básico Ejercicio 014
-- Tema: Fechas básicas

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS peliculas_ciencia_ficcion;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE peliculas_ciencia_ficcion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    director VARCHAR(100) NOT NULL,
    universo VARCHAR(100) NOT NULL,
    fecha_estreno DATE NOT NULL,
    fecha_registro DATETIME NOT NULL,
    duracion_minutos INT NOT NULL,
    estado ENUM('Disponible','No disponible') NOT NULL DEFAULT 'Disponible',

    CHECK (duracion_minutos > 0)
);