CREATE DATABASE IF NOT EXISTS mi_playlist;
USE mi_playlist;

CREATE TABLE canciones (
    id_cancion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    duracion_segundos INT NOT NULL,
    reproducciones INT DEFAULT 0,
    
    -- Validamos que una canción tenga una duración lógica
    CONSTRAINT chk_duracion CHECK (duracion_segundos > 0)
);