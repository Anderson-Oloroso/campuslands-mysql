-- ============================================================
-- EJERCICIO 037 - VISTAS AVANZADAS PARA LIGA DE FUTBOL
-- DDL - Definicion de estructura
-- ============================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

-- ------------------------------------------------------------
-- Tabla: equipos
-- ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS equipos (
    equipo_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(80) NOT NULL,
    estadio VARCHAR(100) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_equipo_nombre
        CHECK (CHAR_LENGTH(nombre) >= 3)
);

-- ------------------------------------------------------------
-- Tabla: jugadores
-- ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS jugadores (
    jugador_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    equipo_id INT UNSIGNED NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    posicion ENUM('portero', 'defensa', 'mediocampista', 'delantero') NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    goles INT UNSIGNED NOT NULL DEFAULT 0,
    asistencias INT UNSIGNED NOT NULL DEFAULT 0,

    CONSTRAINT fk_jugador_equipo
        FOREIGN KEY (equipo_id)
        REFERENCES equipos(equipo_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_jugador_edad
        CHECK (edad BETWEEN 16 AND 45)
);

-- ------------------------------------------------------------
-- Tabla: partidos
-- ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS partidos (
    partido_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    equipo_local_id INT UNSIGNED NOT NULL,
    equipo_visitante_id INT UNSIGNED NOT NULL,
    fecha_partido DATE NOT NULL,
    goles_local TINYINT UNSIGNED NOT NULL DEFAULT 0,
    goles_visitante TINYINT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('programado', 'finalizado', 'cancelado')
        NOT NULL DEFAULT 'programado',

    CONSTRAINT fk_partido_local
        FOREIGN KEY (equipo_local_id)
        REFERENCES equipos(equipo_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_partido_visitante
        FOREIGN KEY (equipo_visitante_id)
        REFERENCES equipos(equipo_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_equipos_diferentes
        CHECK (equipo_local_id <> equipo_visitante_id)
);

-- ------------------------------------------------------------
-- Indices relacionados con las consultas de la liga
-- ------------------------------------------------------------

CREATE INDEX idx_jugadores_equipo
    ON jugadores(equipo_id);

CREATE INDEX idx_jugadores_goles
    ON jugadores(goles);

CREATE INDEX idx_partidos_fecha
    ON partidos(fecha_partido);

CREATE INDEX idx_partidos_local
    ON partidos(equipo_local_id);

CREATE INDEX idx_partidos_visitante
    ON partidos(equipo_visitante_id);

-- ------------------------------------------------------------
-- Vista avanzada: clasificacion de la liga
--
-- Se generan registros tanto para local como para visitante
-- y posteriormente se consolidan los resultados por equipo.
-- ------------------------------------------------------------

CREATE OR REPLACE VIEW vw_clasificacion_liga AS
SELECT
    equipo_id,
    nombre,
    ciudad,
    partidos_jugados,
    partidos_ganados,
    partidos_empatados,
    partidos_perdidos,
    goles_favor,
    goles_contra,
    (goles_favor - goles_contra) AS diferencia_goles,
    (partidos_ganados * 3 + partidos_empatados) AS puntos
FROM (
    SELECT
        e.equipo_id,
        e.nombre,
        e.ciudad,

        COUNT(p.partido_id) AS partidos_jugados,

        SUM(
            CASE
                WHEN p.goles_local > p.goles_visitante THEN 1
                ELSE 0
            END
        ) AS partidos_ganados,

        SUM(
            CASE
                WHEN p.goles_local = p.goles_visitante THEN 1
                ELSE 0
            END
        ) AS partidos_empatados,

        SUM(
            CASE
                WHEN p.goles_local < p.goles_visitante THEN 1
                ELSE 0
            END
        ) AS partidos_perdidos,

        SUM(p.goles_local) AS goles_favor,
        SUM(p.goles_visitante) AS goles_contra

    FROM equipos e
    INNER JOIN partidos p
        ON e.equipo_id = p.equipo_local_id
    WHERE p.estado = 'finalizado'
    GROUP BY
        e.equipo_id,
        e.nombre,
        e.ciudad

    UNION ALL

    SELECT
        e.equipo_id,
        e.nombre,
        e.ciudad,

        COUNT(p.partido_id) AS partidos_jugados,

        SUM(
            CASE
                WHEN p.goles_visitante > p.goles_local THEN 1
                ELSE 0
            END
        ) AS partidos_ganados,

        SUM(
            CASE
                WHEN p.goles_visitante = p.goles_local THEN 1
                ELSE 0
            END
        ) AS partidos_empatados,

        SUM(
            CASE
                WHEN p.goles_visitante < p.goles_local THEN 1
                ELSE 0
            END
        ) AS partidos_perdidos,

        SUM(p.goles_visitante) AS goles_favor,
        SUM(p.goles_local) AS goles_contra

    FROM equipos e
    INNER JOIN partidos p
        ON e.equipo_id = p.equipo_visitante_id
    WHERE p.estado = 'finalizado'
    GROUP BY
        e.equipo_id,
        e.nombre,
        e.ciudad
) AS resultados
GROUP BY
    equipo_id,
    nombre,
    ciudad,
    partidos_jugados,
    partidos_ganados,
    partidos_empatados,
    partidos_perdidos,
    goles_favor,
    goles_contra;

-- ------------------------------------------------------------
-- Vista avanzada: ranking de goleadores
-- ------------------------------------------------------------

CREATE OR REPLACE VIEW vw_ranking_goleadores AS
SELECT
    j.jugador_id,
    j.nombre AS jugador,
    e.nombre AS equipo,
    j.posicion,
    j.goles,
    j.asistencias,
    DENSE_RANK() OVER (
        ORDER BY j.goles DESC
    ) AS posicion_ranking
FROM jugadores j
INNER JOIN equipos e
    ON j.equipo_id = e.equipo_id
WHERE e.estado = 'activo';