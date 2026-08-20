-- Campuslands MySQL - intermedio ejercicio 012
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS canciones;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE canciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    album VARCHAR(120) NOT NULL,
    genero ENUM(
        'Pop',
        'Rock',
        'Rap',
        'Electronica',
        'Reggaeton',
        'Indie',
        'Metal',
        'Jazz'
    ) NOT NULL,
    duracion_segundos SMALLINT NOT NULL,
    reproducciones INT NOT NULL DEFAULT 0,
    calificacion DECIMAL(3,1) NOT NULL DEFAULT 0.0,
    estado ENUM('ACTIVA','INACTIVA') NOT NULL DEFAULT 'ACTIVA',

    UNIQUE(titulo, artista),

    CHECK (duracion_segundos >= 60),
    CHECK (reproducciones >= 0),
    CHECK (calificacion >= 0 AND calificacion <= 10)
);