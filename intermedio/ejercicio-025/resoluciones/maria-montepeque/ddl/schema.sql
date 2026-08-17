-- Campuslands MySQL - intermedio ejercicio 025
-- Resolucion: maria-montepeque
-- Tema: laboratorio de formulas quimicas
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS lotes_formula_intermedio;
DROP TABLE IF EXISTS formulas_quimicas_intermedio;

CREATE TABLE formulas_quimicas_intermedio (
  id_formula INT AUTO_INCREMENT PRIMARY KEY,
  codigo_formula VARCHAR(20) NOT NULL UNIQUE,
  nombre_compuesto VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('acido','base','sal','oxido','organico') NOT NULL,
  estado_fisico ENUM('solido','liquido','gaseoso') NOT NULL
);

-- UNIQUE simple arriba: no puede haber dos formulas con el mismo
-- codigo_formula ni dos compuestos con el mismo nombre.
--
-- UNIQUE compuesta abajo: el mismo numero de lote puede repetirse
-- entre formulas distintas (cada quimico numera sus lotes a su manera),
-- pero NO dos veces para la MISMA formula.
CREATE TABLE lotes_formula_intermedio (
  id_lote INT AUTO_INCREMENT PRIMARY KEY,
  id_formula INT NOT NULL,
  numero_lote VARCHAR(30) NOT NULL,
  cantidad_producida DECIMAL(10,2) NOT NULL,
  fecha_produccion DATE NOT NULL,
  CONSTRAINT fk_lotes_formula_intermedio_formula FOREIGN KEY (id_formula) REFERENCES formulas_quimicas_intermedio (id_formula),
  CONSTRAINT uq_lotes_formula_intermedio_lote UNIQUE (id_formula, numero_lote),
  CONSTRAINT chk_lotes_formula_intermedio_cantidad CHECK (cantidad_producida > 0)
);
