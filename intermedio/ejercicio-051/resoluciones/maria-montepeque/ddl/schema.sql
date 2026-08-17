-- Campuslands MySQL - intermedio ejercicio 051
-- Resolucion: maria-montepeque
-- Tema: dibujo digital
-- Ejecuta este archivo antes de inserts.sql.

-- ===================================================================
-- Diseño que violaria la Primera Forma Normal (NO se crea, solo de
-- referencia): una sola columna con varias herramientas separadas por
-- coma no es atomica y complica filtrar, contar o unir por herramienta.
--
-- CREATE TABLE obras_mal_disenadas (
--   id_obra INT PRIMARY KEY,
--   titulo VARCHAR(120),
--   herramientas VARCHAR(255) -- ejemplo: 'Krita, Photoshop, Blender'
-- );
-- ===================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS materiales_obra_intermedio;
DROP TABLE IF EXISTS obras_intermedio;
DROP TABLE IF EXISTS ilustradores_intermedio;

CREATE TABLE ilustradores_intermedio (
  id_ilustrador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  especialidad ENUM('ilustracion','concept_art','pixel_art','animacion','comic') NOT NULL
);

CREATE TABLE obras_intermedio (
  id_obra INT AUTO_INCREMENT PRIMARY KEY,
  id_ilustrador INT NOT NULL,
  titulo VARCHAR(120) NOT NULL,
  software_principal VARCHAR(60) NOT NULL,
  fecha_entrega DATE NOT NULL,
  estado ENUM('en_progreso','revision','entregado') NOT NULL DEFAULT 'en_progreso',
  CONSTRAINT fk_obras_intermedio_ilustrador FOREIGN KEY (id_ilustrador) REFERENCES ilustradores_intermedio (id_ilustrador)
);

-- Cada fila guarda UNA sola herramienta por obra (valor atomico). Esto
-- es lo que cumple la Primera Forma Normal: en vez de una lista
-- separada por comas en una sola columna, cada valor vive en su propia
-- fila y se puede filtrar, contar o unir sin parsear texto.
CREATE TABLE materiales_obra_intermedio (
  id_material INT AUTO_INCREMENT PRIMARY KEY,
  id_obra INT NOT NULL,
  herramienta VARCHAR(80) NOT NULL,
  CONSTRAINT fk_materiales_obra_intermedio_obra FOREIGN KEY (id_obra) REFERENCES obras_intermedio (id_obra),
  CONSTRAINT uq_materiales_obra_intermedio UNIQUE (id_obra, herramienta)
);
