CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_024;

CREATE TABLE basico_ejercicio_024 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_proceso VARCHAR(120) NOT NULL,
  metodo VARCHAR(80) NOT NULL,
  stock_material_kg DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo','revision','obsoleto') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);