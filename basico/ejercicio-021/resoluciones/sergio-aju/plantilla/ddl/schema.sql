CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS obras_digitales;

CREATE TABLE obras_digitales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(120) NOT NULL,
  estilo VARCHAR(80) NOT NULL, -- Categoria del dibujo (ej. Ilustracion, Pixel Art)
  puntaje_calidad DECIMAL(5,2) NOT NULL DEFAULT 0, -- Puntaje asignado por profesores
  estado ENUM('activo', 'revision', 'inactivo') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);