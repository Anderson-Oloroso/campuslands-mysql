DROP DATABASE IF EXISTS playlist_musical_window_db;
CREATE DATABASE playlist_musical_window_db;
USE playlist_musical_window_db;

-- Tabla transaccional para el control de pistas y reproducción en playlist musical
CREATE TABLE playlist_musical (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo_cancion VARCHAR(60) NOT NULL,
    artista VARCHAR(60) NOT NULL,
    genero_musical VARCHAR(30) NOT NULL,
    duracion_segundos INT NOT NULL DEFAULT 0,
    reproducciones INT NOT NULL DEFAULT 0,
    estado_cancion VARCHAR(20) NOT NULL,
    CONSTRAINT chk_duracion CHECK (duracion_segundos > 0),
    CONSTRAINT chk_reproducciones CHECK (reproducciones >= 0),
    CONSTRAINT chk_genero CHECK (genero_musical IN ('Rock', 'Pop', 'Electronic', 'Jazz', 'Hip Hop', 'Classical')),
    CONSTRAINT chk_estado_playlist CHECK (estado_cancion IN ('Activa', 'Pausada', 'archivada', 'Favorita'))
);
