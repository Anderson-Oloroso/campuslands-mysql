-- Campuslands MySQL - basico ejercicio-051
-- Tema: dibujo digital (WHERE)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS obras_digitales;

CREATE TABLE obras_digitales (
    id_obra INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    id_ilustrador INT NOT NULL,
    estilo ENUM('Concept Art','Anime/Manga','Splash Art','Pixel Art','Retrato Semirrealista') NOT NULL,
    cantidad_capas INT NOT NULL,
    ancho_px INT NOT NULL,
    alto_px INT NOT NULL,
    precio_comision DECIMAL(7,2) NOT NULL,
    fecha_creacion DATE NOT NULL
);
