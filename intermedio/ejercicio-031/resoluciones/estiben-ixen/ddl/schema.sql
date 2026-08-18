-- Campuslands MySQL - intermedio ejercicio-031
-- Tema: torneo esports MOBA (INNER JOIN)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_moba;
DROP TABLE IF EXISTS escuadras;

CREATE TABLE escuadras (
    id_escuadra INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL UNIQUE,
    region VARCHAR(40) NOT NULL,
    estado ENUM('Activo','Revision','Inactivo') DEFAULT 'Activo'
);

CREATE TABLE jugadores_moba (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    nickname VARCHAR(40) NOT NULL UNIQUE,
    rol ENUM('Top','Jungla','Mid','ADC','Support') NOT NULL,
    id_escuadra INT NOT NULL,
    puntaje DECIMAL(6,2) DEFAULT 0,
    estado ENUM('activo','inactivo') DEFAULT 'activo',
    fecha_registro DATE NOT NULL,
    FOREIGN KEY (id_escuadra) REFERENCES escuadras(id_escuadra) ON DELETE CASCADE
);
