CREATE DATABASE IF NOT EXISTS playlist_musical_db;
USE playlist_musical_db;

CREATE TABLE generos_musicales (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nombre_genero VARCHAR(50) NOT NULL UNIQUE,
    descripcion_genero VARCHAR(150)
);

CREATE TABLE canciones_playlist (
    id_cancion INT PRIMARY KEY AUTO_INCREMENT,
    codigo_cancion VARCHAR(20) NOT NULL UNIQUE,
    titulo_cancion VARCHAR(100) NOT NULL,
    artista VARCHAR(80) NOT NULL,
    id_genero INT,
    duracion_segundos INT NOT NULL,
    reproducciones INT NOT NULL DEFAULT 0,
    estado_cancion ENUM('activa', 'paausada', 'eliminada', 'favorita') DEFAULT 'activa',
    FOREIGN KEY (id_genero) REFERENCES generos_musicales(id_genero),
    CONSTRAINT chk_duracion_seg CHECK (duracion_segundos > 0),
    CONSTRAINT chk_reproducciones CHECK (reproducciones >= 0)
);