-- Campuslands MySQL - intermedio ejercicio 011
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS jugadores;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(60) NOT NULL,
    edad TINYINT NOT NULL,
    ranking INT NOT NULL,
    victorias INT NOT NULL DEFAULT 0,
    derrotas INT NOT NULL DEFAULT 0,
    porcentaje_victorias DECIMAL(5,2) NOT NULL,
    estado ENUM('ACTIVO','INACTIVO') NOT NULL DEFAULT 'ACTIVO',

    UNIQUE (ranking),

    CHECK (edad BETWEEN 10 AND 60),
    CHECK (ranking > 0),
    CHECK (victorias >= 0),
    CHECK (derrotas >= 0),
    CHECK (porcentaje_victorias BETWEEN 0 AND 100)
);