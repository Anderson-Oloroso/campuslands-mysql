CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    region VARCHAR(50) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    rol VARCHAR(30) NOT NULL,
    edad INT NOT NULL,

    CONSTRAINT fk_jugador_equipo
        FOREIGN KEY (id_equipo)
        REFERENCES equipos(id_equipo)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT chk_edad_jugador
        CHECK (edad >= 16),

    CONSTRAINT chk_rol_jugador
        CHECK (rol IN ('Top', 'Jungla', 'Mid', 'ADC', 'Support'))
);