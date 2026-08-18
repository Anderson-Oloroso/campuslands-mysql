CREATE DATABASE IF NOT EXISTS ranking_battle_royale;

USE ranking_battle_royale;

DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    pais VARCHAR(50) NOT NULL,
    nivel INT UNSIGNED NOT NULL,
    puntos_ranking DECIMAL(8,2) NOT NULL,
    partidas_jugadas INT UNSIGNED NOT NULL,
    victorias INT UNSIGNED NOT NULL,
    fecha_registro DATE NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT chk_puntos_ranking
        CHECK (puntos_ranking >= 0),

    CONSTRAINT chk_victorias
        CHECK (victorias <= partidas_jugadas)
);