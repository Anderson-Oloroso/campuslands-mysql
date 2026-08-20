CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS formulas_quimicas;

CREATE TABLE formulas_quimicas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_formula VARCHAR(120) NOT NULL,
  codigo_referencia VARCHAR(30) NOT NULL UNIQUE, -- Restricción UNIQUE para evitar códigos duplicados
  tipo_compuesto ENUM('Acido', 'Base', 'Sal', 'Organico') NOT NULL,
  volumen_ml DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('activo','revision','archivado') NOT NULL DEFAULT 'activo',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);