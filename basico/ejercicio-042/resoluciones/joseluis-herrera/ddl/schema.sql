CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS playlists;

CREATE TABLE playlists (
    id_playlist INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255),
    genero_principal VARCHAR(50) NOT NULL,
    cantidad_canciones INT UNSIGNED NOT NULL DEFAULT 0,
    duracion_minutos DECIMAL(6,2) NOT NULL,
    estado ENUM('activa', 'inactiva') NOT NULL DEFAULT 'activa',
    fecha_creacion DATE NOT NULL,
    CONSTRAINT chk_playlists_canciones CHECK (cantidad_canciones >= 0),
    CONSTRAINT chk_playlists_duracion CHECK (duracion_minutos >= 0),
    CONSTRAINT uq_playlists_nombre UNIQUE (nombre)
);