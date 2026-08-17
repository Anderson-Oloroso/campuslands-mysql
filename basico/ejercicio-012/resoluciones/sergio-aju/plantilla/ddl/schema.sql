CREATE DATABASE IF NOT EXISTS db_playlist_musical;
USE db_playlist_musical;

DROP TABLE IF EXISTS canciones;

CREATE TABLE canciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    duracion_segundos INT NOT NULL CHECK (duracion_segundos > 0),
    reproducciones INT DEFAULT 0,
    estado ENUM('activo', 'inactivo') DEFAULT 'activo',
    fecha_agregada DATE NOT NULL
);