CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS participaciones;
DROP TABLE IF EXISTS equipos;
DROP TABLE IF EXISTS ligas;


CREATE TABLE ligas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    temporada VARCHAR(20) NOT NULL,
    pais VARCHAR(60) NOT NULL,

    CONSTRAINT uq_liga_temporada
        UNIQUE (nombre, temporada)
);


CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    ciudad VARCHAR(60) NOT NULL,

    CONSTRAINT uq_equipo_nombre
        UNIQUE (nombre)
);


CREATE TABLE participaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    liga_id INT NOT NULL,
    equipo_id INT NOT NULL,
    partidos_jugados INT NOT NULL DEFAULT 0,
    partidos_ganados INT NOT NULL DEFAULT 0,
    partidos_empatados INT NOT NULL DEFAULT 0,
    partidos_perdidos INT NOT NULL DEFAULT 0,
    goles_favor INT NOT NULL DEFAULT 0,
    goles_contra INT NOT NULL DEFAULT 0,
    puntos INT NOT NULL DEFAULT 0,

    CONSTRAINT uq_participacion
        UNIQUE (liga_id, equipo_id),

    CONSTRAINT fk_participacion_liga
        FOREIGN KEY (liga_id)
        REFERENCES ligas(id),

    CONSTRAINT fk_participacion_equipo
        FOREIGN KEY (equipo_id)
        REFERENCES equipos(id),

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