CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS formulas_quimicas;

-- Creación de la tabla principal definiendo restricciones de integridad para el laboratorio
CREATE TABLE formulas_quimicas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_formula VARCHAR(20) NOT NULL UNIQUE,
  nombre_compuesto VARCHAR(100) NOT NULL,
  categoria_quimica ENUM('reactivo', 'solvente', 'catalizador', 'base', 'acido') NOT NULL,
  cantidad_stock_gramos DECIMAL(10,2) NOT NULL,
  pureza_porcentaje DECIMAL(5,2) NOT NULL,
  costo_por_gramo_usd DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado_almacen ENUM('disponible', 'agotado', 'en_cuarentena', 'obsoleto') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_stock CHECK (cantidad_stock_gramos >= 0.0),
  CONSTRAINT chk_pureza CHECK (pureza_porcentaje > 0.0 AND pureza_porcentaje <= 100.0),
  CONSTRAINT chk_costo CHECK (costo_por_gramo_usd >= 0.00)
);