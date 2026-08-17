-- Campuslands MySQL - intermedio ejercicio 044
-- Resolucion: maria-montepeque
-- Tema: saga de ciencia ficcion
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vw_catalogo_flota_publico_intermedio;
DROP VIEW IF EXISTS vw_naves_destacadas_intermedio;
DROP VIEW IF EXISTS vw_naves_disponibles_intermedio;
DROP TABLE IF EXISTS naves_saga_intermedio;

CREATE TABLE naves_saga_intermedio (
  id_nave INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  clase ENUM('caza','crucero','portanaves','transporte','fragata') NOT NULL,
  precio DECIMAL(12,2) NOT NULL,
  unidades_disponibles INT NOT NULL DEFAULT 0,
  destacada BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT chk_naves_saga_intermedio_precio CHECK (precio > 0),
  CONSTRAINT chk_naves_saga_intermedio_unidades CHECK (unidades_disponibles >= 0)
);

-- Vistas simples: una sola tabla, sin JOIN ni agregacion. Cada una
-- resuelve un caso de uso concreto y reutilizable.

-- 1) Solo las naves que hoy se pueden desplegar (con unidades listas).
CREATE VIEW vw_naves_disponibles_intermedio AS
SELECT id_nave, nombre, clase, precio, unidades_disponibles
FROM naves_saga_intermedio
WHERE unidades_disponibles > 0;

-- 2) Las naves marcadas como destacadas de la flota.
CREATE VIEW vw_naves_destacadas_intermedio AS
SELECT id_nave, nombre, clase, precio
FROM naves_saga_intermedio
WHERE destacada = TRUE;

-- 3) Catalogo publico de la flota: oculta las unidades disponibles
-- internas, un aliado externo no necesita saber el inventario exacto.
CREATE VIEW vw_catalogo_flota_publico_intermedio AS
SELECT id_nave, nombre, clase, precio
FROM naves_saga_intermedio;
