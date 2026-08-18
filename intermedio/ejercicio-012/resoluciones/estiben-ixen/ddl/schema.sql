-- Campuslands MySQL - intermedio ejercicio-012
-- Tema: playlist musical (consultas de reportes)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist;
DROP TABLE IF EXISTS artistas_musicales;

CREATE TABLE artistas_musicales (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artistico VARCHAR(70) NOT NULL UNIQUE,
    pais_origen VARCHAR(40) NOT NULL,
    oyentes_mensuales BIGINT NOT NULL DEFAULT 0,
    estado ENUM('Activo','Pausa','Retirado') DEFAULT 'Activo'
);

CREATE TABLE canciones_playlist (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(80) NOT NULL,
    id_artista INT NOT NULL,
    genero ENUM('Rock','Pop','Electronica','Hip Hop','Reggaeton','Indie','Jazz') NOT NULL,
    duracion_segundos INT NOT NULL,
    reproducciones BIGINT NOT NULL DEFAULT 0,
    bpm INT NOT NULL DEFAULT 120,
    fecha_lanzamiento DATE NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artistas_musicales(id_artista) ON DELETE CASCADE
);
