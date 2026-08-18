-- Campuslands MySQL - intermedio ejercicio-037
-- Tema: liga de futbol (normalizacion 2FN)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS futbolistas;
DROP TABLE IF EXISTS clubes_futbol;

CREATE TABLE clubes_futbol (
    id_club INT AUTO_INCREMENT PRIMARY KEY,
    nombre_club VARCHAR(60) NOT NULL UNIQUE,
    ciudad VARCHAR(50) NOT NULL,
    estadio VARCHAR(60) NOT NULL,
    fundacion INT NOT NULL
);

CREATE TABLE futbolistas (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    posicion ENUM('Portero','Defensa','Centrocampista','Delantero') NOT NULL,
    numero_camiseta INT NOT NULL,
    id_club INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    asistencias INT NOT NULL DEFAULT 0,
    salario_mensual DECIMAL(10,2) NOT NULL,
    estado ENUM('Titular','Suplente','Lesionado') DEFAULT 'Titular',
    FOREIGN KEY (id_club) REFERENCES clubes_futbol(id_club) ON DELETE CASCADE
);
