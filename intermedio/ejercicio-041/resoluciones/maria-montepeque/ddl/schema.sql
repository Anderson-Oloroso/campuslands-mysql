-- Campuslands MySQL - intermedio ejercicio 041
-- Resolucion: maria-montepeque
-- Tema: pingpong
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS equipamiento_pingpong_intermedio;

CREATE TABLE equipamiento_pingpong_intermedio (
  id_equipo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  tipo ENUM('raqueta','pelota','mesa','accesorio') NOT NULL,
  precio INT NOT NULL,
  velocidad INT NULL,
  rebote INT NULL,
  dimension_cm INT NULL,
  CONSTRAINT chk_equipamiento_intermedio_precio CHECK (precio > 0),
  -- CHECK que cruza varias columnas: cada tipo de equipo solo puede
  -- llenar el atributo que le corresponde. Una raqueta jamas deberia
  -- tener "rebote", una pelota jamas deberia tener "velocidad", etc.
  CONSTRAINT chk_equipamiento_intermedio_stats_por_tipo CHECK (
    (tipo = 'raqueta'   AND velocidad IS NOT NULL AND rebote IS NULL AND dimension_cm IS NULL) OR
    (tipo = 'pelota'    AND rebote IS NOT NULL AND velocidad IS NULL AND dimension_cm IS NULL) OR
    (tipo = 'mesa'      AND dimension_cm IS NOT NULL AND velocidad IS NULL AND rebote IS NULL) OR
    (tipo = 'accesorio' AND velocidad IS NULL AND rebote IS NULL AND dimension_cm IS NULL)
  )
);
