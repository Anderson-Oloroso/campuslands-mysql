-- Campuslands MySQL - intermedio ejercicio 024
-- Resolucion: maria-montepeque
-- Tema: soldadura
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS trabajos_soldadura_intermedio;
DROP TABLE IF EXISTS clientes_soldadura_intermedio;
DROP TABLE IF EXISTS soldadores_intermedio;

CREATE TABLE soldadores_intermedio (
  id_soldador INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  certificacion ENUM('basica','intermedia','avanzada','maestro') NOT NULL
);

CREATE TABLE clientes_soldadura_intermedio (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  telefono VARCHAR(20) NOT NULL
);

-- Dos FOREIGN KEY con comportamiento distinto a proposito, para
-- comparar las opciones de MySQL ante un DELETE en la tabla padre:
--
-- id_soldador -> ON DELETE SET NULL: si el soldador se retira de la
-- empresa, el trabajo historico se conserva (no se pierde el registro
-- de facturacion), solo queda sin soldador asignado.
--
-- id_cliente -> ON DELETE RESTRICT: un cliente con trabajos
-- registrados NO se puede borrar mientras existan esos trabajos,
-- para no perder el historial de facturacion de ese cliente.
CREATE TABLE trabajos_soldadura_intermedio (
  id_trabajo INT AUTO_INCREMENT PRIMARY KEY,
  id_soldador INT NULL,
  id_cliente INT NOT NULL,
  tipo_soldadura ENUM('MIG','TIG','arco_electrico','oxiacetilenica','punto') NOT NULL,
  costo DECIMAL(10,2) NOT NULL,
  fecha_trabajo DATE NOT NULL,
  CONSTRAINT fk_trabajos_intermedio_soldador FOREIGN KEY (id_soldador) REFERENCES soldadores_intermedio (id_soldador) ON DELETE SET NULL,
  CONSTRAINT fk_trabajos_intermedio_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_soldadura_intermedio (id_cliente) ON DELETE RESTRICT,
  CONSTRAINT chk_trabajos_intermedio_costo CHECK (costo > 0)
);
