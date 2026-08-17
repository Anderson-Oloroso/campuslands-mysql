CREATE DATABASE IF NOT EXISTS academia_pingpong;

USE academia_pingpong;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(30) NOT NULL,
    edad INT NOT NULL,
    puntaje INT NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',
    fecha_registro DATE NOT NULL,

    CONSTRAINT chk_edad CHECK (edad >= 5),
    CONSTRAINT chk_puntaje CHECK (puntaje >= 0),
    CONSTRAINT chk_estado CHECK (estado IN ('activo', 'inactivo'))
);