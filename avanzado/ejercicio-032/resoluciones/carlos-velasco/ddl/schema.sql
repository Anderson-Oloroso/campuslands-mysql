CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_battle_royale;

CREATE TABLE jugadores_battle_royale (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_jugador VARCHAR(100) NOT NULL,
    plataforma VARCHAR(30) NOT NULL,
    partidas_jugadas INT UNSIGNED NOT NULL DEFAULT 0,
    victorias INT UNSIGNED NOT NULL DEFAULT 0,
    eliminaciones INT UNSIGNED NOT NULL DEFAULT 0,
    puntos INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_victorias_validas
        CHECK (victorias <= partidas_jugadas),

    CONSTRAINT chk_puntos_validos
        CHECK (puntos >= 0),

    CONSTRAINT chk_eliminaciones_validas
        CHECK (eliminaciones >= 0),

    UNIQUE KEY uk_nombre_jugador (nombre_jugador),

    INDEX idx_puntos (puntos),
    INDEX idx_estado (estado),
    INDEX idx_plataforma (plataforma)
);