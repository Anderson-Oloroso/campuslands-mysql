-- Campuslands MySQL - intermedio ejercicio 026
-- Resolucion: maria-montepeque
-- Tema: videojuego RPG
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS items_intermedio;

CREATE TABLE items_intermedio (
  id_item INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  tipo ENUM('arma','armadura','pocion','accesorio') NOT NULL,
  nivel_requerido INT NOT NULL,
  precio INT NOT NULL,
  danio INT NULL,
  defensa INT NULL,
  curacion INT NULL,
  CONSTRAINT chk_items_intermedio_nivel CHECK (nivel_requerido BETWEEN 1 AND 100),
  CONSTRAINT chk_items_intermedio_precio CHECK (precio > 0),
  -- CHECK que cruza varias columnas: cada tipo de item solo puede
  -- llenar el atributo que le corresponde. Un arma jamas deberia tener
  -- "curacion", una pocion jamas deberia tener "danio", etc.
  CONSTRAINT chk_items_intermedio_stats_por_tipo CHECK (
    (tipo = 'arma'      AND danio IS NOT NULL AND defensa IS NULL AND curacion IS NULL) OR
    (tipo = 'armadura'  AND defensa IS NOT NULL AND danio IS NULL AND curacion IS NULL) OR
    (tipo = 'pocion'    AND curacion IS NOT NULL AND danio IS NULL AND defensa IS NULL) OR
    (tipo = 'accesorio' AND danio IS NULL AND defensa IS NULL AND curacion IS NULL)
  )
);
