CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores;

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    clase VARCHAR(30) NOT NULL,
    nivel TINYINT UNSIGNED NOT NULL,
    puntuacion INT UNSIGNED NOT NULL,
    monedas INT UNSIGNED NOT NULL,
    estado ENUM('activo','inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_nivel
        CHECK (nivel BETWEEN 1 AND 100),

    CONSTRAINT chk_puntuacion
        CHECK (puntuacion >= 0),

    CONSTRAINT chk_monedas
        CHECK (monedas >= 0)
);