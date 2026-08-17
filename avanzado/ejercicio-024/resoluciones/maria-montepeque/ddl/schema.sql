-- Campuslands MySQL - avanzado ejercicio 024
-- Resolucion: maria-montepeque
-- Tema: soldadura
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS inventario_soldadura_avanzado;

CREATE TABLE inventario_soldadura_avanzado (
  id_material INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  unidad_medida VARCHAR(20) NOT NULL,
  stock DECIMAL(10,2) NOT NULL,
  stock_minimo DECIMAL(10,2) NOT NULL,
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT chk_inventario_soldadura_avanzado_stock CHECK (stock >= 0)
) ENGINE=InnoDB;
