-- DDL: Estructura para gestión de Playlists y Canciones optimizada para Funciones de Ventana
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS canciones_playlist;
DROP TABLE IF EXISTS playlists;

CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_playlist VARCHAR(80) NOT NULL,
    usuario_propietario VARCHAR(80) NOT NULL,
    visibilidad ENUM('publica', 'privada') DEFAULT 'publica'
) ENGINE=InnoDB;

CREATE TABLE canciones_playlist (
    cancion_id INT AUTO_INCREMENT PRIMARY KEY,
    playlist_id INT NOT NULL,
    titulo_cancion VARCHAR(100) NOT NULL,
    artista VARCHAR(80) NOT NULL,
    genero VARCHAR(40) NOT NULL,
    duracion_segundos INT NOT NULL CHECK (duracion_segundos > 0),
    reproducciones INT NOT NULL DEFAULT 0 CHECK (reproducciones >= 0),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id) ON DELETE CASCADE
) ENGINE=InnoDB;
