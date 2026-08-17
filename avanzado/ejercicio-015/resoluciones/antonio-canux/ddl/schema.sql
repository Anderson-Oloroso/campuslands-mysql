-- Campuslands MySQL - avanzado ejercicio 015
-- Contexto: Modulo de datos para biblioteca gamer (Optimizacion).
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;
DROP TABLE IF EXISTS avanzado_ejercicio_015_juegos;

CREATE TABLE avanzado_ejercicio_015_juegos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  genero VARCHAR(50) NOT NULL,
  desarrollador VARCHAR(100) NOT NULL,
  descripcion TEXT,
  precio_usd DECIMAL(10,2) NOT NULL,
  anio_lanzamiento INT NOT NULL,
  -- Optimizacion 1: Indice B-Tree compuesto para busquedas y agrupaciones frecuentes
  INDEX idx_avanz_015_genero_anio (genero, anio_lanzamiento),
  -- Optimizacion 2: Indice Full-Text para busquedas difusas eficientes en textos largos
  FULLTEXT INDEX ft_avanz_015_titulo_desc (titulo, descripcion)
);