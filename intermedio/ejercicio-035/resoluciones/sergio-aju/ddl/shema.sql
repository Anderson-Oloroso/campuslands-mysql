CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS taller_mecanico_subconsultas;

-- Creación de la tabla con tipos de datos estrictos y restricciones de validación
CREATE TABLE taller_mecanico_subconsultas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_orden VARCHAR(20) NOT NULL UNIQUE,
  propietario VARCHAR(100) NOT NULL,
  marca_moto VARCHAR(50) NOT NULL,
  modelo_moto VARCHAR(60) NOT NULL,
  tipo_servicio VARCHAR(80) NOT NULL,
  costo_servicio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  fecha_ingreso DATE NOT NULL,
  estado_reparacion ENUM('pendiente', 'en_proceso', 'completado', 'entregado') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT chk_costo_subc CHECK (costo_servicio >= 0.00)
);