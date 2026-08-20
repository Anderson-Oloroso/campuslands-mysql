CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

CREATE TABLE equipos_futbol (
    id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(60) NOT NULL,
    partidos_jugados TINYINT UNSIGNED NOT NULL,
    partidos_ganados TINYINT UNSIGNED NOT NULL,
    partidos_empatados TINYINT UNSIGNED NOT NULL,
    partidos_perdidos TINYINT UNSIGNED NOT NULL,
    goles_favor SMALLINT UNSIGNED NOT NULL,
    goles_contra SMALLINT UNSIGNED NOT NULL,
    puntos SMALLINT UNSIGNED NOT NULL,

    CONSTRAINT chk_partidos_jugados
        CHECK (partidos_jugados >= 0),

    CONSTRAINT chk_resultados
        CHECK (
            partidos_ganados +
            partidos_empatados +
            partidos_perdidos = partidos_jugados
        ),

    CONSTRAINT chk_goles
        CHECK (goles_favor >= 0 AND goles_contra >= 0),

    CONSTRAINT chk_puntos
        CHECK (puntos >= 0)
);