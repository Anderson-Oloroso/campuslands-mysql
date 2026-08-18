-- Campuslands MySQL - intermedio ejercicio-038
-- Tema: futbol sala (normalizacion 3FN)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_futsal;
DROP TABLE IF EXISTS equipos_futsal;

CREATE TABLE equipos_futsal (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    sede VARCHAR(50) NOT NULL,
    entrenador VARCHAR(60) NOT NULL,
    estado ENUM('Activo','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE jugadores_futsal (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    posicion ENUM('Portero','Cierre','Ala','Pivot') NOT NULL,
    id_equipo INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    tarjetas_amarillas INT NOT NULL DEFAULT 0,
    tarjetas_rojas INT NOT NULL DEFAULT 0,
    valoracion DECIMAL(4,2) NOT NULL DEFAULT 7.00,
    FOREIGN KEY (id_equipo) REFERENCES equipos_futsal(id_equipo) ON DELETE CASCADE
);
