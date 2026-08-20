CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_025;

CREATE TABLE basico_ejercicio_025 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_formula VARCHAR(120) NOT NULL,
  tipo_compuesto ENUM('Acido', 'Base', 'Sal', 'Organico') NOT NULL,
  volumen_ml DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo','revision','archivado') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);