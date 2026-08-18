-- Campuslands MySQL - intermedio ejercicio-011
-- Tema: pingpong (CHECK)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_pingpong;
DROP TABLE IF EXISTS clubes_pingpong;

CREATE TABLE clubes_pingpong (
    id_club INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL UNIQUE,
    pais VARCHAR(40) NOT NULL,
    categoria ENUM('Profesional','Semi-Pro','Amateur') DEFAULT 'Profesional'
);

CREATE TABLE jugadores_pingpong (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    mano_habil ENUM('Derecha','Izquierda') NOT NULL,
    estilo_agarre ENUM('Shakehand','Penhold') NOT NULL,
    id_club INT NOT NULL,
    ranking_puntos INT NOT NULL DEFAULT 1000,
    torneos_ganados INT NOT NULL DEFAULT 0,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo',
    FOREIGN KEY (id_club) REFERENCES clubes_pingpong(id_club) ON DELETE CASCADE
);
