-- DDL: Estructura de tabla para práctica de ordenamientos ORDER BY en Liga de Fútbol
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS equipos_liga_basico;

CREATE TABLE equipos_liga_basico (
    equipo_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(50) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    puntos INT NOT NULL DEFAULT 0 CHECK (puntos >= 0),
    partidos_jugados INT NOT NULL DEFAULT 0 CHECK (partidos_jugados >= 0),
    goles_favor INT NOT NULL DEFAULT 0 CHECK (goles_favor >= 0),
    goles_contra INT NOT NULL DEFAULT 0 CHECK (goles_contra >= 0),
    estado ENUM('activo', 'sancionado', 'descendido') NOT NULL DEFAULT 'activo'
) ENGINE=InnoDB;
