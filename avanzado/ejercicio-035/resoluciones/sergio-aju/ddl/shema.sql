CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS taller_mecanico_indices;

-- 1. Creación de la tabla principal con restricciones de validación y tipos estrictos
CREATE TABLE taller_mecanico_indices (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_orden VARCHAR(20) NOT NULL,
  propietario VARCHAR(100) NOT NULL,
  marca_moto VARCHAR(50) NOT NULL,
  modelo_moto VARCHAR(60) NOT NULL,
  tipo_servicio VARCHAR(80) NOT NULL,
  costo_servicio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  fecha_ingreso DATE NOT NULL,
  estado_reparacion ENUM('pendiente', 'en_proceso', 'completado', 'entregado') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT chk_costo_indices CHECK (costo_servicio >= 0.00)
);

-- 2. Creación Estratégica de Índices para Optimización de Consultas

-- Índice Único (Unique Index): Garantiza la unicidad y acelera las búsquedas por folio de orden
CREATE UNIQUE INDEX idx_codigo_orden_unique ON taller_mecanico_indices(codigo_orden);

-- Índice Simple (Single-Column Index): Optimiza filtrados y ordenamientos frecuentes por marca de moto
CREATE INDEX idx_marca_moto ON taller_mecanico_indices(marca_moto);

-- Índice Compuesto (Composite Index): Acelera consultas que filtran simultáneamente por marca y estado de reparación
CREATE INDEX idx_marca_estado ON taller_mecanico_indices(marca_moto, estado_reparacion);

-- Índice por Fecha (Date Index): Optimiza reportes temporales por fecha de ingreso al taller
CREATE INDEX idx_fecha_ingreso ON taller_mecanico_indices(fecha_ingreso);