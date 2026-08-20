CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    edad INT NOT NULL,
    partidas_jugadas INT NOT NULL DEFAULT 0,
    victorias INT NOT NULL DEFAULT 0,
    eliminaciones INT NOT NULL DEFAULT 0,
    puntaje DECIMAL(10,2) NOT NULL,
    rango VARCHAR(30) NOT NULL,
    fecha_registro DATE NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_edad
        CHECK (edad >= 13),

    CONSTRAINT chk_partidas
        CHECK (partidas_jugadas >= 0),

    CONSTRAINT chk_victorias
        CHECK (victorias >= 0),

    CONSTRAINT chk_eliminaciones
        CHECK (eliminaciones >= 0),

    CONSTRAINT chk_puntaje
        CHECK (puntaje >= 0)
);