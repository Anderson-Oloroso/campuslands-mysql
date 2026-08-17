-- Ejercicio 011 - validaciones simples para pingpong
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_pingpong;

CREATE TABLE jugadores_pingpong (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(120) NOT NULL,
    categoria ENUM('principiante','intermedio','avanzado') NOT NULL,
    puntaje DECIMAL(10,2) NOT NULL DEFAULT 0,
    estado ENUM('activo','lesionado','retirado') NOT NULL DEFAULT 'activo',
    fecha_registro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_puntaje_valido CHECK (puntaje >= 0 AND puntaje <= 100)
);