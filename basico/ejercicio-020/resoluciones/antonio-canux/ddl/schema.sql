-- Campuslands MySQL - basico ejercicio 020
-- Contexto: Modulo de datos para estudio de tatuajes (SELECT).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_020_tatuajes;

CREATE TABLE basico_ejercicio_020_tatuajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(100) NOT NULL,
  artista VARCHAR(100) NOT NULL,
  estilo ENUM('Tradicional', 'Realismo', 'Blackwork', 'Acuarela', 'Minimalista', 'Japones') NOT NULL,
  zona_cuerpo VARCHAR(50) NOT NULL,
  precio DECIMAL(6,2) NOT NULL,
  fecha_sesion DATE NOT NULL
);