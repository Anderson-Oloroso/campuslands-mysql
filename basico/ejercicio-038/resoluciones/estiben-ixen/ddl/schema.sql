-- Campuslands MySQL - basico ejercicio-038
-- Tema: futbol sala (UPDATE)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_futsal;

CREATE TABLE jugadores_futsal (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(70) NOT NULL,
    posicion ENUM('Portero','Cierre','Ala','Pivot') NOT NULL,
    id_equipo INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    tarjetas_amarillas INT NOT NULL DEFAULT 0,
    tarjetas_rojas INT NOT NULL DEFAULT 0,
    valoracion DECIMAL(4,2) NOT NULL DEFAULT 7.00
);
