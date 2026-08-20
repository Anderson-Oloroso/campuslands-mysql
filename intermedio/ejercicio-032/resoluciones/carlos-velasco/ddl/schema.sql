CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(100) NOT NULL UNIQUE,
    plataforma VARCHAR(50) NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_nivel_jugador
        CHECK (nivel BETWEEN 1 AND 100)
);

CREATE TABLE partidas (
    id_partida INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT UNSIGNED NOT NULL,
    posicion_final TINYINT UNSIGNED NOT NULL,
    eliminaciones TINYINT UNSIGNED NOT NULL DEFAULT 0,
    puntos INT UNSIGNED NOT NULL DEFAULT 0,
    fecha_partida DATE NOT NULL,

    CONSTRAINT fk_partida_jugador
        FOREIGN KEY (id_jugador)
        REFERENCES jugadores(id_jugador),

    CONSTRAINT chk_posicion_final
        CHECK (posicion_final BETWEEN 1 AND 100)
);