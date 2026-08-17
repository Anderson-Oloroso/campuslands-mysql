-- Campuslands MySQL - intermedio ejercicio 055
-- Resolucion: maria-montepeque
-- Tema: laboratorio de formulas quimicas
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS lotes_produccion_intermedio;
DROP TABLE IF EXISTS compuestos_lab_intermedio;

CREATE TABLE compuestos_lab_intermedio (
  id_compuesto INT AUTO_INCREMENT PRIMARY KEY,
  codigo_compuesto VARCHAR(20) NOT NULL UNIQUE,
  nombre_compuesto VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('acido','base','sal','oxido','organico') NOT NULL,
  estado_fisico ENUM('solido','liquido','gaseoso') NOT NULL
);

-- UNIQUE simple arriba: no puede haber dos compuestos con el mismo
-- codigo_compuesto ni dos con el mismo nombre_compuesto.
--
-- UNIQUE compuesta abajo: el mismo numero de lote puede repetirse
-- entre compuestos distintos (cada quimico numera sus lotes a su
-- manera), pero NO dos veces para el MISMO compuesto.
CREATE TABLE lotes_produccion_intermedio (
  id_lote INT AUTO_INCREMENT PRIMARY KEY,
  id_compuesto INT NOT NULL,
  numero_lote VARCHAR(30) NOT NULL,
  cantidad_producida DECIMAL(10,2) NOT NULL,
  fecha_produccion DATE NOT NULL,
  CONSTRAINT fk_lotes_produccion_intermedio_compuesto FOREIGN KEY (id_compuesto) REFERENCES compuestos_lab_intermedio (id_compuesto),
  CONSTRAINT uq_lotes_produccion_intermedio_lote UNIQUE (id_compuesto, numero_lote),
  CONSTRAINT chk_lotes_produccion_intermedio_cantidad CHECK (cantidad_producida > 0)
);
