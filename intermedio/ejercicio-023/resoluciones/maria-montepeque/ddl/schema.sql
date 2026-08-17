-- Campuslands MySQL - intermedio ejercicio 023
-- Resolucion: maria-montepeque
-- Tema: arquitectura 3D
-- Ejecuta este archivo antes de inserts.sql.

-- ===================================================================
-- Diseño que violaria la Tercera Forma Normal (NO se crea, solo de
-- referencia):
--
-- CREATE TABLE proyectos_mal_disenados (
--   id_proyecto INT PRIMARY KEY,
--   nombre VARCHAR(120),
--   presupuesto DECIMAL(12,2),
--   id_cliente INT,
--   cliente_nombre VARCHAR(120),  -- depende de id_cliente, no de id_proyecto
--   cliente_ciudad VARCHAR(80)    -- depende de id_cliente, no de id_proyecto
-- );
--
-- cliente_nombre y cliente_ciudad dependen de un atributo NO llave
-- (id_cliente), no directamente de la llave primaria (id_proyecto):
-- eso es la dependencia transitiva que prohibe la 3FN. Ademas, si un
-- cliente tiene 5 proyectos, su nombre y ciudad quedarian repetidos 5
-- veces y desincronizados apenas alguien actualizara solo una fila.
-- ===================================================================

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS proyectos_arquitectura_intermedio;
DROP TABLE IF EXISTS clientes_arquitectura_intermedio;

CREATE TABLE clientes_arquitectura_intermedio (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  ciudad VARCHAR(80) NOT NULL
);

-- id_cliente depende de id_proyecto (cada proyecto es de un cliente),
-- pero cliente_nombre y cliente_ciudad ya NO estan aqui: viven en
-- clientes_arquitectura_intermedio y se consultan con JOIN. Asi cada
-- atributo depende directamente de la llave primaria, sin pasos
-- intermedios.
CREATE TABLE proyectos_arquitectura_intermedio (
  id_proyecto INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  presupuesto DECIMAL(12,2) NOT NULL,
  fecha_inicio DATE NOT NULL,
  CONSTRAINT fk_proyectos_arquitectura_intermedio_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_arquitectura_intermedio (id_cliente),
  CONSTRAINT chk_proyectos_arquitectura_intermedio_presupuesto CHECK (presupuesto > 0)
);
