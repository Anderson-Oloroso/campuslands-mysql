-- Ejercicio 013 - filtros por estado para catalogo de peliculas de miedo
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_013;

CREATE TABLE basico_ejercicio_013 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  subgenero ENUM('slasher','paranormal','psicologico','monstruos','found_footage') NOT NULL,
  anio_estreno YEAR NOT NULL,
  calificacion DECIMAL(3,1) NOT NULL DEFAULT 0,
  estado ENUM('disponible','proxima','retirada') NOT NULL DEFAULT 'disponible',
  agregada_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_calificacion_valida CHECK (calificacion BETWEEN 0 AND 10)
);
