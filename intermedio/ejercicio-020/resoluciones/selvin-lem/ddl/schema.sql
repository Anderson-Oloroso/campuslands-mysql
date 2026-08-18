-- Campuslands MySQL - intermedio ejercicio 020
-- Tematica: estudio de tatuajes
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS citas_tatuajes;

CREATE TABLE citas_tatuajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(100) NOT NULL,
  artista VARCHAR(100) NOT NULL,
  estilo VARCHAR(60) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  estado ENUM('agendada','completada','cancelada') NOT NULL DEFAULT 'agendada',
  fecha_cita DATE NOT NULL
);
