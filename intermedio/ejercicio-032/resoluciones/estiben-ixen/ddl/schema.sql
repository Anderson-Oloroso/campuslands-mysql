-- Campuslands MySQL - intermedio ejercicio-032
-- Tema: ranking battle royale (LEFT JOIN)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS partidas_br;
DROP TABLE IF EXISTS jugadores_br;

CREATE TABLE jugadores_br (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(40) NOT NULL UNIQUE,
    pais VARCHAR(40) NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    estado ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE partidas_br (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    id_jugador INT NOT NULL,
    mapa VARCHAR(40) NOT NULL,
    posicion INT NOT NULL,
    eliminaciones INT NOT NULL DEFAULT 0,
    puntos DECIMAL(8,2) NOT NULL DEFAULT 0,
    fecha_partida DATETIME NOT NULL,
    FOREIGN KEY (id_jugador) REFERENCES jugadores_br(id_jugador) ON DELETE CASCADE
);
