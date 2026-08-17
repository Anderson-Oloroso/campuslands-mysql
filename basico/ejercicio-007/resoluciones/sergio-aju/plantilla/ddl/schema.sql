-- Creación de la base de datos para la liga de fútbol
DROP DATABASE IF EXISTS db_liga_futbol;
CREATE DATABASE db_liga_futbol CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_liga_futbol;

-- Creación de la tabla principal de equipos de la liga
CREATE TABLE equipos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(60) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    partidos_jugados INT UNSIGNED NOT NULL DEFAULT 0,
    puntos INT UNSIGNED NOT NULL DEFAULT 0,
    goles_favor INT UNSIGNED NOT NULL DEFAULT 0,
    goles_contra INT UNSIGNED NOT NULL DEFAULT 0,
    estado VARCHAR(20) NOT NULL DEFAULT 'Activo',
    CONSTRAINT chk_estado CHECK (estado IN ('Activo', 'Suspendido', 'Descendido')),
    CONSTRAINT chk_partidos CHECK (puntos <= (partidos_jugados * 3))
) ENGINE=InnoDB;