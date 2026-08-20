CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad TINYINT UNSIGNED NOT NULL,
    ranking INT UNSIGNED NOT NULL,
    nivel ENUM('principiante', 'intermedio', 'avanzado') NOT NULL,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_edad_jugador
        CHECK (edad BETWEEN 8 AND 80),

    CONSTRAINT chk_ranking_jugador
        CHECK (ranking >= 1)
);