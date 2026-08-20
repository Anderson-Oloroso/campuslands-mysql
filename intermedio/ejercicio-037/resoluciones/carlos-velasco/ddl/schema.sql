CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS estadisticas_partido;
DROP TABLE IF EXISTS partidos;
DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
    id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    ciudad VARCHAR(80) NOT NULL,
    estadio VARCHAR(100) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'activo',

    CONSTRAINT uq_equipo_nombre UNIQUE (nombre),

    CONSTRAINT chk_equipo_estado
        CHECK (estado IN ('activo', 'inactivo'))
);

CREATE TABLE jugadores (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    posicion VARCHAR(30) NOT NULL,
    numero_camiseta TINYINT UNSIGNED NOT NULL,

    CONSTRAINT fk_jugador_equipo
        FOREIGN KEY (id_equipo)
        REFERENCES equipos(id_equipo),

    CONSTRAINT chk_jugador_posicion
        CHECK (posicion IN ('portero', 'defensa', 'mediocampista', 'delantero')),

    CONSTRAINT chk_numero_camiseta
        CHECK (numero_camiseta BETWEEN 1 AND 99),

    CONSTRAINT uq_equipo_numero
        UNIQUE (id_equipo, numero_camiseta)
);

CREATE TABLE partidos (
    id_partido INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    equipo_local_id INT UNSIGNED NOT NULL,
    equipo_visitante_id INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    goles_local TINYINT UNSIGNED NOT NULL DEFAULT 0,
    goles_visitante TINYINT UNSIGNED NOT NULL DEFAULT 0,

    CONSTRAINT fk_partido_local
        FOREIGN KEY (equipo_local_id)
        REFERENCES equipos(id_equipo),

    CONSTRAINT fk_partido_visitante
        FOREIGN KEY (equipo_visitante_id)
        REFERENCES equipos(id_equipo),

    CONSTRAINT chk_equipos_diferentes
        CHECK (equipo_local_id <> equipo_visitante_id),

    CONSTRAINT chk_goles_local
        CHECK (goles_local >= 0),

    CONSTRAINT chk_goles_visitante
        CHECK (goles_visitante >= 0)
);

CREATE TABLE estadisticas_partido (
    partido_id INT UNSIGNED NOT NULL,
    jugador_id INT UNSIGNED NOT NULL,
    minutos_jugados TINYINT UNSIGNED NOT NULL DEFAULT 0,
    goles TINYINT UNSIGNED NOT NULL DEFAULT 0,
    asistencias TINYINT UNSIGNED NOT NULL DEFAULT 0,
    tarjetas_amarillas TINYINT UNSIGNED NOT NULL DEFAULT 0,

    PRIMARY KEY (partido_id, jugador_id),

    CONSTRAINT fk_estadistica_partido
        FOREIGN KEY (partido_id)
        REFERENCES partidos(id_partido),

    CONSTRAINT fk_estadistica_jugador
        FOREIGN KEY (jugador_id)
        REFERENCES jugadores(id_jugador),

    CONSTRAINT chk_minutos
        CHECK (minutos_jugados BETWEEN 0 AND 120),

    CONSTRAINT chk_goles
        CHECK (goles >= 0),

    CONSTRAINT chk_asistencias
        CHECK (asistencias >= 0),

    CONSTRAINT chk_tarjetas
        CHECK (tarjetas_amarillas >= 0)
);