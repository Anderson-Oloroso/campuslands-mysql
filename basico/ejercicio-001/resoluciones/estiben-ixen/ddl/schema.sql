-- Campuslands MySQL - basico ejercicio-001
-- Tema: torneo esports MOBA (CREATE TABLE)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_moba;

CREATE TABLE jugadores_moba (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nickname VARCHAR(40) NOT NULL UNIQUE,
    rol ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL,
    id_escuadra INT NOT NULL,
    puntaje DECIMAL(6,2) DEFAULT 0,
    estado ENUM('activo','inactivo') DEFAULT 'activo',
    fecha_registro DATE NOT NULL
);
