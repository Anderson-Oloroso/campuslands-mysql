-- Campuslands MySQL - intermedio ejercicio 015
-- Tematica: biblioteca gamer
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS videojuegos_biblioteca;

CREATE TABLE videojuegos_biblioteca (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(120) NOT NULL,
  plataforma VARCHAR(40) NOT NULL,
  genero VARCHAR(60) NOT NULL,
  horas_jugadas DECIMAL(6,1) NOT NULL DEFAULT 0,
  fecha_compra DATE NOT NULL,
  completado BOOLEAN NOT NULL DEFAULT FALSE
);
