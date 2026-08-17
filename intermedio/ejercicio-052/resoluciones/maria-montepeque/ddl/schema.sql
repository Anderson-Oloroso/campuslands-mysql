-- Campuslands MySQL - intermedio ejercicio 052
-- Resolucion: maria-montepeque
-- Tema: animacion 3D
-- Ejecuta este archivo antes de inserts.sql.

-- ===================================================================
-- Diseño que violaria la Segunda Forma Normal (NO se crea, solo de
-- referencia). Con llave compuesta (id_produccion, id_artista):
--
-- CREATE TABLE participaciones_mal_disenadas (
--   id_produccion INT,
--   id_artista INT,
--   produccion_nombre VARCHAR(120),  -- depende solo de id_produccion (dependencia parcial)
--   artista_nombre VARCHAR(120),     -- depende solo de id_artista (dependencia parcial)
--   rol_en_produccion VARCHAR(60),   -- depende de la llave completa (correcto)
--   horas_asignadas DECIMAL(6,2),    -- depende de la llave completa (correcto)
--   PRIMARY KEY (id_produccion, id_artista)
-- );
--
-- produccion_nombre y artista_nombre NO dependen de toda la llave
-- compuesta, solo de una parte: eso es la dependencia parcial que
-- prohibe la 2FN.
-- ===================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS participaciones_intermedio;
DROP TABLE IF EXISTS producciones_3d_intermedio;
DROP TABLE IF EXISTS artistas_3d_intermedio;

CREATE TABLE producciones_3d_intermedio (
  id_produccion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  motor_render ENUM('Blender Cycles','Arnold','V-Ray','Redshift','Octane') NOT NULL,
  fecha_entrega DATE NOT NULL
);

CREATE TABLE artistas_3d_intermedio (
  id_artista INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  especialidad ENUM('rigging','modelado','iluminacion','texturizado','animacion_personajes') NOT NULL
);

-- Solo quedan aqui los atributos que dependen de la llave COMPLETA
-- (produccion + artista). El nombre de la produccion y el nombre del
-- artista ya viven en sus propias tablas: se consultan con JOIN.
CREATE TABLE participaciones_intermedio (
  id_produccion INT NOT NULL,
  id_artista INT NOT NULL,
  rol_en_produccion VARCHAR(60) NOT NULL,
  horas_asignadas DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (id_produccion, id_artista),
  CONSTRAINT fk_participaciones_intermedio_produccion FOREIGN KEY (id_produccion) REFERENCES producciones_3d_intermedio (id_produccion),
  CONSTRAINT fk_participaciones_intermedio_artista FOREIGN KEY (id_artista) REFERENCES artistas_3d_intermedio (id_artista),
  CONSTRAINT chk_participaciones_intermedio_horas CHECK (horas_asignadas > 0)
);
