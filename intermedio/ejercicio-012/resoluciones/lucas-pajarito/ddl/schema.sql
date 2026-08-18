-- Campuslands MySQL - intermedio ejercicio 012
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS playlist_musical;
USE playlist_musical;

DROP TABLE IF EXISTS playlist_cancion;
DROP TABLE IF EXISTS cancion;
DROP TABLE IF EXISTS artista;
DROP TABLE IF EXISTS playlist;

CREATE TABLE artista (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL
);

CREATE TABLE cancion (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    duracion_segundos INT NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
);

CREATE TABLE playlist (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200)
);

CREATE TABLE playlist_cancion (
    id_playlist INT NOT NULL,
    id_cancion INT NOT NULL,
    posicion INT NOT NULL,
    PRIMARY KEY (id_playlist, id_cancion),
    FOREIGN KEY (id_playlist) REFERENCES playlist(id_playlist),
    FOREIGN KEY (id_cancion) REFERENCES cancion(id_cancion)
);
