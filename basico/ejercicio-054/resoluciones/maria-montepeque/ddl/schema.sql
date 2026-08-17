-- Campuslands MySQL - basico ejercicio 054
-- Resolucion: maria-montepeque
-- Tema: soldadura
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS registros_soldadura_basico;

CREATE TABLE registros_soldadura_basico (
  id_registro INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(120) NOT NULL,
  tipo_soldadura ENUM('MIG','TIG','arco_electrico','oxiacetilenica','punto') NOT NULL,
  material ENUM('acero','aluminio','acero_inoxidable','hierro_fundido') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  estado ENUM('pendiente','en_proceso','completado','cancelado') NOT NULL DEFAULT 'pendiente',
  fecha_registro DATE NOT NULL,
  CONSTRAINT chk_registros_soldadura_basico_costo CHECK (costo > 0)
);
