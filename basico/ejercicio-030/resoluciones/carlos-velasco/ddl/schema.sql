CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS equipos_streaming;
DROP TABLE IF EXISTS streamers;

CREATE TABLE streamers (
    id_streamer INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    canal VARCHAR(100) NOT NULL UNIQUE,
    plataforma VARCHAR(50) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE equipos_streaming (
    id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_streamer INT UNSIGNED NOT NULL,
    nombre_equipo VARCHAR(100) NOT NULL,
    tipo_equipo VARCHAR(50) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    fecha_adquisicion DATE NOT NULL,

    CONSTRAINT fk_equipo_streamer
        FOREIGN KEY (id_streamer)
        REFERENCES streamers(id_streamer),

    CONSTRAINT chk_precio_equipo
        CHECK (precio >= 0)
);