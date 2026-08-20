CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_023;

CREATE TABLE basico_ejercicio_023 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_proyecto VARCHAR(120) NOT NULL,
  categoria ENUM('Residencial', 'Comercial', 'Industrial', 'Paisajismo') NOT NULL,
  costo_estimado DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo','revision','inactivo','completado') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);