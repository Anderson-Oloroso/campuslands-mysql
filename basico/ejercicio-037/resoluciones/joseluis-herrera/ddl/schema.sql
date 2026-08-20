CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS equipos_liga;

CREATE TABLE equipos_liga (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    ciudad VARCHAR(60) NOT NULL,
    partidos_jugados INT NOT NULL,
    partidos_ganados INT NOT NULL,
    partidos_empatados INT NOT NULL,
    partidos_perdidos INT NOT NULL,
    goles_favor INT NOT NULL,
    goles_contra INT NOT NULL,
    puntos INT NOT NULL,

    CONSTRAINT chk_partidos_jugados
        CHECK (partidos_jugados >= 0),

    CONSTRAINT chk_partidos_ganados
        CHECK (partidos_ganados >= 0),

    CONSTRAINT chk_partidos_empatados
        CHECK (partidos_empatados >= 0),

    CONSTRAINT chk_partidos_perdidos
        CHECK (partidos_perdidos >= 0),

    CONSTRAINT chk_goles_favor
        CHECK (goles_favor >= 0),

    CONSTRAINT chk_goles_contra
        CHECK (goles_contra >= 0),

    CONSTRAINT chk_puntos
        CHECK (puntos >= 0)
);