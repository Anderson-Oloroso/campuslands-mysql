CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS partidas_moba;

CREATE TABLE partidas_moba (
    id_partida INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    equipo_rojo VARCHAR(100) NOT NULL,
    equipo_azul VARCHAR(100) NOT NULL,
    ganador VARCHAR(100) NULL,
    mapa VARCHAR(50) NOT NULL,
    duracion_minutos INT UNSIGNED NOT NULL,
    fecha_partida DATETIME NOT NULL,
    estado ENUM('programada', 'en_curso', 'finalizada', 'cancelada')
        NOT NULL DEFAULT 'programada',

    CONSTRAINT chk_equipos_diferentes
        CHECK (equipo_rojo <> equipo_azul),

    CONSTRAINT chk_duracion
        CHECK (duracion_minutos > 0),

    CONSTRAINT chk_ganador_valido
        CHECK (
            ganador IS NULL
            OR ganador = equipo_rojo
            OR ganador = equipo_azul
        ),

    INDEX idx_estado (estado),
    INDEX idx_fecha_partida (fecha_partida),
    INDEX idx_ganador (ganador)
);