CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_pingpong;

CREATE TABLE jugadores_pingpong (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(100) NOT NULL,
    documento VARCHAR(20) NOT NULL UNIQUE,
    categoria VARCHAR(30) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    ranking_actual INT UNSIGNED NOT NULL,
    victorias INT UNSIGNED NOT NULL DEFAULT 0,
    derrotas INT UNSIGNED NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_edad_jugador
        CHECK (edad >= 10),

    CONSTRAINT chk_ranking_jugador
        CHECK (ranking_actual > 0),

    CONSTRAINT chk_estado_jugador
        CHECK (estado IN ('activo', 'inactivo')),

    CONSTRAINT chk_resultados_jugador
        CHECK (victorias + derrotas >= 0)
);