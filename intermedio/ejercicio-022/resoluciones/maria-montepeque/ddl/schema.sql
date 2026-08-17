-- Campuslands MySQL - intermedio ejercicio 022
-- Resolucion: maria-montepeque
-- Tema: animacion 3D
-- Ejecuta este archivo antes de inserts.sql.

-- ===================================================================
-- Diseño que violaria la Segunda Forma Normal (NO se crea, solo de
-- referencia). Con llave compuesta (id_proyecto, id_animador):
--
-- CREATE TABLE asignaciones_mal_disenadas (
--   id_proyecto INT,
--   id_animador INT,
--   proyecto_nombre VARCHAR(120),  -- depende solo de id_proyecto (dependencia parcial)
--   animador_nombre VARCHAR(120),  -- depende solo de id_animador (dependencia parcial)
--   rol_en_proyecto VARCHAR(60),   -- depende de la llave completa (correcto)
--   horas_asignadas DECIMAL(6,2),  -- depende de la llave completa (correcto)
--   PRIMARY KEY (id_proyecto, id_animador)
-- );
--
-- proyecto_nombre y animador_nombre NO dependen de toda la llave
-- compuesta, solo de una parte: eso es la dependencia parcial que
-- prohibe la 2FN.
-- ===================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS asignaciones_intermedio;
DROP TABLE IF EXISTS proyectos_3d_intermedio;
DROP TABLE IF EXISTS animadores_intermedio;

CREATE TABLE proyectos_3d_intermedio (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  motor_render ENUM('Blender Cycles','Arnold','V-Ray','Redshift','Octane') NOT NULL,
  fecha_entrega DATE NOT NULL
);

CREATE TABLE animadores_intermedio (
  id_animador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  especialidad ENUM('rigging','modelado','iluminacion','texturizado','animacion_personajes') NOT NULL
);

-- Solo quedan aqui los atributos que dependen de la llave COMPLETA
-- (proyecto + animador). El nombre del proyecto y el nombre del
-- animador ya viven en sus propias tablas: se consultan con JOIN.
CREATE TABLE asignaciones_intermedio (
  id_proyecto INT NOT NULL,
  id_animador INT NOT NULL,
  rol_en_proyecto VARCHAR(60) NOT NULL,
  horas_asignadas DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (id_proyecto, id_animador),
  CONSTRAINT fk_asignaciones_intermedio_proyecto FOREIGN KEY (id_proyecto) REFERENCES proyectos_3d_intermedio (id_proyecto),
  CONSTRAINT fk_asignaciones_intermedio_animador FOREIGN KEY (id_animador) REFERENCES animadores_intermedio (id_animador),
  CONSTRAINT chk_asignaciones_intermedio_horas CHECK (horas_asignadas > 0)
);
