-- Campuslands MySQL - basico ejercicio 021
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS dibujo_digital;
USE dibujo_digital;
-- 1. Tabla de Ilustradores / Artistas
CREATE TABLE Artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);
