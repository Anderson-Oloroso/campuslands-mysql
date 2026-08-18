CREATE DATABASE IF NOT EXISTS playlist_musical;

USE playlist_musical;

CREATE TABLE playlists (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    cantidad_canciones INT NOT NULL DEFAULT 0,
    duracion_minutos DECIMAL(6,2) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'activa',
    fecha_creacion DATE NOT NULL,

    CONSTRAINT chk_cantidad_canciones
        CHECK (cantidad_canciones >= 0),

    CONSTRAINT chk_duracion
        CHECK (duracion_minutos > 0),

    CONSTRAINT chk_estado
        CHECK (estado IN ('activa', 'inactiva'))
);