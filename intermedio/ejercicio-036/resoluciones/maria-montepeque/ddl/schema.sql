-- Campuslands MySQL - intermedio ejercicio 036
-- Resolucion: maria-montepeque
-- Tema: autos hiperdeportivos
-- Ejecuta este archivo antes de inserts.sql.

-- ===================================================================
-- Diseño que violaria la Primera Forma Normal (NO se crea, solo de
-- referencia): una sola columna con varias caracteristicas separadas
-- por coma no es atomica y complica filtrar, contar o unir por
-- caracteristica.
--
-- CREATE TABLE autos_mal_disenados (
--   id_auto INT PRIMARY KEY,
--   modelo VARCHAR(80),
--   caracteristicas VARCHAR(255) -- ejemplo: 'Fibra de carbono, Suspension activa, Alerón trasero'
-- );
-- ===================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS caracteristicas_auto_intermedio;
DROP TABLE IF EXISTS autos_intermedio;

CREATE TABLE autos_intermedio (
  id_auto INT AUTO_INCREMENT PRIMARY KEY,
  marca VARCHAR(60) NOT NULL,
  modelo VARCHAR(80) NOT NULL UNIQUE,
  precio DECIMAL(12,2) NOT NULL,
  CONSTRAINT chk_autos_intermedio_precio CHECK (precio > 0)
);

-- Cada fila guarda UNA sola caracteristica por auto (valor atomico).
-- Esto es lo que cumple la Primera Forma Normal: en vez de una lista
-- separada por comas en una sola columna, cada valor vive en su propia
-- fila y se puede filtrar, contar o unir sin parsear texto.
CREATE TABLE caracteristicas_auto_intermedio (
  id_caracteristica INT AUTO_INCREMENT PRIMARY KEY,
  id_auto INT NOT NULL,
  caracteristica VARCHAR(80) NOT NULL,
  CONSTRAINT fk_caracteristicas_auto_intermedio_auto FOREIGN KEY (id_auto) REFERENCES autos_intermedio (id_auto),
  CONSTRAINT uq_caracteristicas_auto_intermedio UNIQUE (id_auto, caracteristica)
);
