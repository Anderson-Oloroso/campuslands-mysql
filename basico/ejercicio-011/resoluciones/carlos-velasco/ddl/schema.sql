-- Campuslands MySQL - Básico Ejercicio 011
-- Tema: Validaciones simples

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS jugadores;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT NOT NULL,
    categoria ENUM('Infantil','Juvenil','Mayor') NOT NULL,
    ranking INT NOT NULL,
    estado ENUM('Activo','Inactivo') NOT NULL DEFAULT 'Activo',

    CHECK (edad >= 8),
    CHECK (ranking > 0)
);