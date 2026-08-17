DROP DATABASE IF EXISTS playlist_musical_basico_db;
CREATE DATABASE playlist_musical_basico_db;
USE playlist_musical_basico_db;

CREATE TABLE playlist_musical (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo_cancion VARCHAR(60) NOT NULL,
    artista VARCHAR(60) NOT NULL,
    genero_musical VARCHAR(30) NOT NULL,
    duracion_segundos INT NOT NULL DEFAULT 0,
    reproducciones INT NOT NULL DEFAULT 0,
    estado_cancion VARCHAR(20) NOT NULL,
    CONSTRAINT chk_duracion_basico CHECK (duracion_segundos > 0),
    CONSTRAINT chk_reproducciones_basico CHECK (reproducciones >= 0),
    CONSTRAINT chk_genero_basico CHECK (genero_musical IN ('Rock', 'Pop', 'Electronic', 'Jazz', 'Hip Hop', 'Classical')),
    CONSTRAINT chk_estado_basico CHECK (estado_cancion IN ('Activa', 'Pausada', 'Archivada', 'Favorita'))
);
