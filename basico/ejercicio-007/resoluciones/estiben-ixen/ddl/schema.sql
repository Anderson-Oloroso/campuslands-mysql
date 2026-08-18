-- Campuslands MySQL - basico ejercicio-007
-- Tema: liga de futbol (ORDER BY)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS futbolistas;

CREATE TABLE futbolistas (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    posicion ENUM('Portero','Defensa','Centrocampista','Delantero') NOT NULL,
    numero_camiseta INT NOT NULL,
    id_club INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    asistencias INT NOT NULL DEFAULT 0,
    salario_mensual DECIMAL(10,2) NOT NULL,
    estado ENUM('Titular','Suplente','Lesionado') DEFAULT 'Titular'
);
