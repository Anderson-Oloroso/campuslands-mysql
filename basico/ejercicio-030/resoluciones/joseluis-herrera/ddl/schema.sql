CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS equipos;
DROP TABLE IF EXISTS streamers;

CREATE TABLE streamers (
    id_streamer INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    id_streamer INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    estado ENUM('disponible', 'en_uso') NOT NULL DEFAULT 'disponible',

    CONSTRAINT fk_equipo_streamer
        FOREIGN KEY (id_streamer)
        REFERENCES streamers(id_streamer)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT chk_precio_positivo
        CHECK (precio > 0)
);