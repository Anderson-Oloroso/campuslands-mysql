CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS procesos_soldadura;

-- Tabla principal de procesos e inventario de soldadura
CREATE TABLE procesos_soldadura (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_proceso VARCHAR(120) NOT NULL,
  metodo ENUM('SMAW', 'GMAW', 'GTAW', 'FCAW') NOT NULL,
  stock_material_kg DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo', 'mantenimiento', 'suspendido') NOT NULL DEFAULT 'activo',
  actualizado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);