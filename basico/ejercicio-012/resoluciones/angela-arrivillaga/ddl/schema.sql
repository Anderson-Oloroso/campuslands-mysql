CREATE DATABASE IF NOT EXISTS playlist_musical_db;
USE playlist_musical_db;

CREATE TABLE playlists (
    id_playlist INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(80) NOT NULL,
    descripcion VARCHAR(200),
    creador VARCHAR(60) NOT NULL,
    estado ENUM('activa', 'archivada', 'publica') DEFAULT 'publica'
);

CREATE TABLE canciones (
    id_cancion INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(80) NOT NULL,
    album VARCHAR(80),
    duracion_segundos INT NOT NULL,
    CONSTRAINT chk_duracion CHECK (duracion_segundos > 0)
);

CREATE TABLE playlist_canciones (
    id_playlist_cancion INT PRIMARY KEY AUTO_INCREMENT,
    id_playlist INT,
    id_cancion INT,
    orden INT NOT NULL,
    fecha_agregada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_playlist) REFERENCES playlists(id_playlist),
    FOREIGN KEY (id_cancion) REFERENCES canciones(id_cancion),
    CONSTRAINT chk_orden CHECK (orden > 0)
);