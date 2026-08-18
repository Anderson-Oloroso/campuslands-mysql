-- Campuslands MySQL - basico ejercicio-042
-- Tema: playlist musical (modelado de entidad)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist;

CREATE TABLE canciones_playlist (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    id_artista INT NOT NULL,
    genero ENUM('Rock','Pop','Electronica','Hip Hop','Reggaeton','Indie','Jazz') NOT NULL,
    duracion_segundos INT NOT NULL,
    reproducciones BIGINT NOT NULL DEFAULT 0,
    bpm INT NOT NULL DEFAULT 120,
    fecha_lanzamiento DATE NOT NULL
);
