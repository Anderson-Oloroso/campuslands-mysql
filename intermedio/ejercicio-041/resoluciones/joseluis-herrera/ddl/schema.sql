CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    categoria ENUM('juvenil', 'adulto', 'senior') NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    ranking INT UNSIGNED NOT NULL,
    partidos_ganados INT UNSIGNED NOT NULL DEFAULT 0,
    partidos_perdidos INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',
    CONSTRAINT uq_jugadores_ranking UNIQUE (ranking),
    CONSTRAINT chk_jugadores_edad CHECK (edad BETWEEN 10 AND 70),
    CONSTRAINT chk_jugadores_ganados CHECK (partidos_ganados >= 0),
    CONSTRAINT chk_jugadores_perdidos CHECK (partidos_perdidos >= 0),
    CONSTRAINT chk_jugadores_partidos CHECK (
        partidos_ganados + partidos_perdidos >= 0
    )
);