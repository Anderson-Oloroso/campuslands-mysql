-- Campuslands MySQL - avanzado ejercicio 012
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS playlist_musical_01;

USE playlist_musical_01;

CREATE TABLE artistas_01 (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL
);

CREATE TABLE canciones_playlist_01 (
    id_cancion INT AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    id_artista INT NOT NULL,
    album VARCHAR(150),
    anio_lanzamiento YEAR NOT NULL,
    duracion_segundos INT NOT NULL,
    reproducciones INT DEFAULT 0,

    PRIMARY KEY (id_cancion, anio_lanzamiento),

    CONSTRAINT fk_cancion_artista_01
        FOREIGN KEY (id_artista)
        REFERENCES artistas_01(id_artista)
);