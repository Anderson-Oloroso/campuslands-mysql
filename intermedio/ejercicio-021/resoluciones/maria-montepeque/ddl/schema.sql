-- Campuslands MySQL - intermedio ejercicio 021
-- Resolucion: maria-montepeque
-- Tema: dibujo digital
-- Ejecuta este archivo antes de inserts.sql.

-- ===================================================================
-- Diseño que violaria la Primera Forma Normal (NO se crea, solo de
-- referencia): una sola columna con varias herramientas separadas por
-- coma no es atomica y complica filtrar, contar o unir por herramienta.
--
-- CREATE TABLE proyectos_mal_disenados (
--   id_proyecto INT PRIMARY KEY,
--   titulo VARCHAR(120),
--   herramientas VARCHAR(255) -- ejemplo: 'Photoshop, Procreate, Illustrator'
-- );
-- ===================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS herramientas_proyecto_intermedio;
DROP TABLE IF EXISTS proyectos_digital_intermedio;
DROP TABLE IF EXISTS artistas_digital_intermedio;

CREATE TABLE artistas_digital_intermedio (
  id_artista INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  especialidad ENUM('ilustracion','concept_art','pixel_art','animacion','comic') NOT NULL
);

CREATE TABLE proyectos_digital_intermedio (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  id_artista INT NOT NULL,
  titulo VARCHAR(120) NOT NULL,
  software_principal VARCHAR(60) NOT NULL,
  fecha_entrega DATE NOT NULL,
  estado ENUM('en_progreso','revision','entregado') NOT NULL DEFAULT 'en_progreso',
  CONSTRAINT fk_proyectos_digital_intermedio_artista FOREIGN KEY (id_artista) REFERENCES artistas_digital_intermedio (id_artista)
);

-- Cada fila guarda UNA sola herramienta por proyecto (valor atomico).
-- Esto es lo que cumple la Primera Forma Normal: en vez de una lista
-- separada por comas en una sola columna, cada valor vive en su propia
-- fila y se puede filtrar, contar o unir sin parsear texto.
CREATE TABLE herramientas_proyecto_intermedio (
  id_herramienta INT AUTO_INCREMENT PRIMARY KEY,
  id_proyecto INT NOT NULL,
  herramienta VARCHAR(80) NOT NULL,
  CONSTRAINT fk_herramientas_proyecto_intermedio_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyectos_digital_intermedio (id_proyecto),
  CONSTRAINT uq_herramientas_proyecto_intermedio UNIQUE (id_proyecto, herramienta)
);
