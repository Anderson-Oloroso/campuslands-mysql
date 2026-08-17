-- Campuslands MySQL - intermedio ejercicio 053
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

DROP TABLE IF EXISTS encargos_arq_intermedio;
DROP TABLE IF EXISTS clientes_arq_intermedio;

CREATE TABLE clientes_arq_intermedio (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  ciudad VARCHAR(80) NOT NULL
);

-- id_cliente depende de id_encargo (cada encargo es de un cliente),
-- pero cliente_nombre y cliente_ciudad ya NO estan aqui: viven en
-- clientes_arq_intermedio y se consultan con JOIN. Asi cada
-- atributo depende directamente de la llave primaria, sin pasos
-- intermedios.
CREATE TABLE encargos_arq_intermedio (
  id_encargo INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  nombre VARCHAR(120) NOT NULL,
  presupuesto DECIMAL(12,2) NOT NULL,
  fecha_inicio DATE NOT NULL,
  CONSTRAINT fk_encargos_arq_intermedio_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_arq_intermedio (id_cliente),
  CONSTRAINT chk_encargos_arq_intermedio_presupuesto CHECK (presupuesto > 0)
);
