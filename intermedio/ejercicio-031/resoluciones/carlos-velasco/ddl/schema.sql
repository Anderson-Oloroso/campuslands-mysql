CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS partidas;
DROP TABLE IF EXISTS jugadores;
DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
    id_equipo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(100) NOT NULL UNIQUE,
    region VARCHAR(50) NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo'
);

CREATE TABLE jugadores (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT UNSIGNED NOT NULL,
    nombre_jugador VARCHAR(100) NOT NULL,
    rol ENUM('Top', 'Jungla', 'Mid', 'ADC', 'Support') NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,

    CONSTRAINT fk_jugador_equipo
        FOREIGN KEY (id_equipo)
        REFERENCES equipos(id_equipo),

    CONSTRAINT chk_edad_jugador
        CHECK (edad >= 16 AND edad <= 45)
);

CREATE TABLE partidas (
    id_partida INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_equipo_local INT UNSIGNED NOT NULL,
    id_equipo_visitante INT UNSIGNED NOT NULL,
    fecha_partida DATE NOT NULL,
    ganador_id INT UNSIGNED NOT NULL,

    CONSTRAINT fk_partida_equipo_local
        FOREIGN KEY (id_equipo_local)
        REFERENCES equipos(id_equipo),

    CONSTRAINT fk_partida_equipo_visitante
        FOREIGN KEY (id_equipo_visitante)
        REFERENCES equipos(id_equipo),

    CONSTRAINT fk_partida_ganador
        FOREIGN KEY (ganador_id)
        REFERENCES equipos(id_equipo),

    CONSTRAINT chk_equipos_diferentes
        CHECK (id_equipo_local <> id_equipo_visitante)
);