
DROP DATABASE IF EXISTS ejercicio_12;
CREATE DATABASE ejercicio_12;
USE ejercicio_12;

CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    pais VARCHAR(50) NOT NULL,
    fecha_registro DATE NOT NULL
);

CREATE TABLE artistas (
    id_artista INT AUTO_INCREMENT PRIMARY KEY,
    nombre_artistico VARCHAR(80) NOT NULL UNIQUE,
    genero_musical VARCHAR(40) NOT NULL,
    pais_origen VARCHAR(50) NOT NULL
);

CREATE TABLE canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracion_segundos INT NOT NULL,
    album VARCHAR(100) NOT NULL,
    anio_lanzamiento YEAR NOT NULL,
    id_artista INT NOT NULL,
    FOREIGN KEY (id_artista) REFERENCES artistas(id_artista)
);

CREATE TABLE playlists (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    fecha_creacion DATE NOT NULL,
    publica BOOLEAN NOT NULL DEFAULT FALSE,
    id_usuario INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE playlist_canciones (
    id_playlist INT NOT NULL,
    id_cancion INT NOT NULL,
    posicion INT NOT NULL,
    fecha_agregada DATE NOT NULL,
    PRIMARY KEY (id_playlist, id_cancion),
    FOREIGN KEY (id_playlist) REFERENCES playlists(id_playlist),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion),
    UNIQUE (id_playlist, posicion)
);