-- Campuslands MySQL - basico ejercicio 026
-- Resolucion: maria-montepeque
-- Tema: videojuego RPG
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS personajes_basico;

CREATE TABLE personajes_basico (
  id_personaje INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL UNIQUE,
  clase ENUM('guerrero','mago','arquero','picaro','clerigo') NOT NULL,
  nivel INT NOT NULL DEFAULT 1,
  vida_maxima INT NOT NULL,
  oro INT NOT NULL DEFAULT 0,
  estado ENUM('activo','retirado') NOT NULL DEFAULT 'activo',
  CONSTRAINT chk_personajes_basico_nivel CHECK (nivel BETWEEN 1 AND 100),
  CONSTRAINT chk_personajes_basico_vida CHECK (vida_maxima > 0),
  CONSTRAINT chk_personajes_basico_oro CHECK (oro >= 0)
);
