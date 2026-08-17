-- Campuslands MySQL - avanzado ejercicio 043
-- Resolucion: maria-montepeque
-- Tema: catalogo de peliculas de miedo
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_avanzado;

CREATE TABLE peliculas_avanzado (
  id_pelicula INT AUTO_INCREMENT PRIMARY KEY,
  titulo VARCHAR(150) NOT NULL,
  subgenero ENUM('slasher','sobrenatural','psicologico','zombis','found_footage') NOT NULL,
  detalles JSON NOT NULL,
  -- Valida la forma minima esperada del JSON: debe tener "actores"
  -- (arreglo) y "taquilla" (objeto). MySQL puede validar estructura
  -- basica de un JSON directamente en un CHECK.
  CONSTRAINT chk_peliculas_avanzado_detalles CHECK (
    JSON_TYPE(JSON_EXTRACT(detalles, '$.actores')) = 'ARRAY'
    AND JSON_TYPE(JSON_EXTRACT(detalles, '$.taquilla')) = 'OBJECT'
  )
);
