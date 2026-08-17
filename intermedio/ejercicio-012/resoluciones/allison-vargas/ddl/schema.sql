-- DDL: Estructura relacional para generación de reportes analíticos de Playlists
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS detalle_playlist_canciones;
DROP TABLE IF EXISTS reportes_playlists;

CREATE TABLE reportes_playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_playlist VARCHAR(80) NOT NULL,
    creador VARCHAR(80) NOT NULL,
    tipo_acceso ENUM('publica', 'privada', 'compartida') DEFAULT 'publica',
    fecha_creacion DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE detalle_playlist_canciones (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_id INT NOT NULL,
    titulo_cancion VARCHAR(100) NOT NULL,
    artista VARCHAR(80) NOT NULL,
    genero VARCHAR(40) NOT NULL,
    duracion_segundos INT NOT NULL CHECK (duracion_segundos > 0),
    reproducciones INT NOT NULL DEFAULT 0 CHECK (reproducciones >= 0),
    FOREIGN KEY (playlist_id) REFERENCES reportes_playlists(playlist_id) ON DELETE CASCADE
) ENGINE=InnoDB;
