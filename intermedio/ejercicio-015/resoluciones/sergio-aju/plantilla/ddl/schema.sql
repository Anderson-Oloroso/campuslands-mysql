-- Campuslands MySQL - intermedio ejercicio 015
-- Resolución por: Sergio Miranda Ajú
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ejercicio_015_biblioteca_gamer;

CREATE TABLE ejercicio_015_biblioteca_gamer (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  genero VARCHAR(80) NOT NULL,
  plataforma VARCHAR(50) NOT NULL,
  precio DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  horas_jugadas INT NOT NULL DEFAULT 0,
  estado ENUM('completado', 'jugando', 'pendiente', 'abandonado') NOT NULL DEFAULT 'pendiente',
  fecha_adquisicion DATE NOT NULL
);