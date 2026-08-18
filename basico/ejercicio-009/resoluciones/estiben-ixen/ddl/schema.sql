-- Campuslands MySQL - basico ejercicio-009
-- Tema: kickboxing (DELETE controlado)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peleadores_kb;

CREATE TABLE peleadores_kb (
    id_peleador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apodo VARCHAR(40) NOT NULL,
    categoria_peso ENUM('Peso Mosca','Peso Pluma','Peso Ligero','Peso Welter','Peso Mediano','Peso Pesado') NOT NULL,
    id_gimnasio INT NOT NULL,
    victorias INT NOT NULL DEFAULT 0,
    nocauts INT NOT NULL DEFAULT 0,
    derrotas INT NOT NULL DEFAULT 0,
    estilo ENUM('Holandes','Muay Thai','Americano','K-1') NOT NULL
);
