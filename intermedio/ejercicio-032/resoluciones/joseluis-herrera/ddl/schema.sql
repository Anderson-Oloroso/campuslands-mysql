CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    rango VARCHAR(30) NOT NULL,
    puntaje DECIMAL(10,2) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_jugador_puntaje
        CHECK (puntaje >= 0)
);

CREATE TABLE partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    posicion_final INT NOT NULL,
    eliminaciones INT NOT NULL DEFAULT 0,
    fecha_partida DATE NOT NULL,

    CONSTRAINT fk_partida_jugador
        FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_posicion_final
        CHECK (posicion_final > 0),

    CONSTRAINT chk_eliminaciones
        CHECK (eliminaciones >= 0)
);