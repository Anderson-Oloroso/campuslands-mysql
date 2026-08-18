CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_moba;

CREATE TABLE jugadores_moba (
    id_jugador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    equipo VARCHAR(80) NOT NULL,
    rol VARCHAR(30) NOT NULL,
    victorias INT UNSIGNED NOT NULL DEFAULT 0,
    derrotas INT UNSIGNED NOT NULL DEFAULT 0,
    estado ENUM('activo', 'inactivo') NOT NULL DEFAULT 'activo',

    CONSTRAINT chk_jugadores_rol
        CHECK (rol IN ('Top', 'Jungla', 'Mid', 'ADC', 'Support')),

    CONSTRAINT chk_jugadores_victorias
        CHECK (victorias >= 0),

    CONSTRAINT chk_jugadores_derrotas
        CHECK (derrotas >= 0)
);