-- Campuslands MySQL - avanzado ejercicio 020
-- Contexto: Modulo de datos para estudio de tatuajes (Indices).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_020_citas;

CREATE TABLE avanzado_ejercicio_020_citas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_cita VARCHAR(15) NOT NULL UNIQUE,
  cliente VARCHAR(100) NOT NULL,
  artista VARCHAR(100) NOT NULL,
  estilo VARCHAR(50) NOT NULL,
  descripcion TEXT,
  precio DECIMAL(6,2) NOT NULL,
  fecha_sesion DATE NOT NULL,
  

  INDEX idx_avanz_020_artista_fecha (artista, fecha_sesion),
  
  
  FULLTEXT INDEX ft_avanz_020_descripcion (descripcion)
);