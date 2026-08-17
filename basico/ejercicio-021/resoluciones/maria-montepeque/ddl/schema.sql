-- Campuslands MySQL - basico ejercicio 021
-- Resolucion: maria-montepeque
-- Tema: dibujo digital
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_basico;

CREATE TABLE proyectos_basico (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(120) NOT NULL UNIQUE,
  artista VARCHAR(120) NOT NULL,
  tipo_arte ENUM('ilustracion','concept_art','pixel_art','animacion','comic') NOT NULL,
  software_principal VARCHAR(60) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  estado ENUM('en_progreso','revision','entregado') NOT NULL DEFAULT 'en_progreso',
  fecha_entrega DATE NOT NULL,
  CONSTRAINT chk_proyectos_basico_precio CHECK (precio > 0)
);
