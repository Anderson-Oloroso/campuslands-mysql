-- Campuslands MySQL - intermedio ejercicio 054
-- Resolucion: maria-montepeque
-- Tema: soldadura
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ordenes_soldadura_intermedio;
DROP TABLE IF EXISTS empresas_soldadura_intermedio;
DROP TABLE IF EXISTS tecnicos_soldadura_intermedio;

CREATE TABLE tecnicos_soldadura_intermedio (
  id_tecnico INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  certificacion ENUM('basica','intermedia','avanzada','maestro') NOT NULL
);

CREATE TABLE empresas_soldadura_intermedio (
  id_empresa INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  telefono VARCHAR(20) NOT NULL
);

-- Dos FOREIGN KEY con comportamiento distinto a proposito, para
-- comparar las opciones de MySQL ante un DELETE en la tabla padre:
--
-- id_tecnico -> ON DELETE SET NULL: si el tecnico se retira de la
-- empresa, la orden historica se conserva (no se pierde el registro
-- de facturacion), solo queda sin tecnico asignado.
--
-- id_empresa -> ON DELETE RESTRICT: una empresa con ordenes
-- registradas NO se puede borrar mientras existan esas ordenes, para
-- no perder el historial de facturacion de esa empresa.
CREATE TABLE ordenes_soldadura_intermedio (
  id_orden INT AUTO_INCREMENT PRIMARY KEY,
  id_tecnico INT NULL,
  id_empresa INT NOT NULL,
  tipo_soldadura ENUM('MIG','TIG','arco_electrico','oxiacetilenica','punto') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_orden DATE NOT NULL,
  CONSTRAINT fk_ordenes_intermedio_tecnico FOREIGN KEY (id_tecnico) REFERENCES tecnicos_soldadura_intermedio (id_tecnico) ON DELETE SET NULL,
  CONSTRAINT fk_ordenes_intermedio_empresa FOREIGN KEY (id_empresa) REFERENCES empresas_soldadura_intermedio (id_empresa) ON DELETE RESTRICT,
  CONSTRAINT chk_ordenes_intermedio_costo CHECK (costo > 0)
);
