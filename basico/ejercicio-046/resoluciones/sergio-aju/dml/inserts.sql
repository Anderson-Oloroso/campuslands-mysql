CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS menu_comida_urbana;

-- Creación de la tabla principal con tipos estrictos, restricciones de unicidad y validaciones lógicas
CREATE TABLE menu_comida_urbana (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_producto VARCHAR(20) NOT NULL UNIQUE,
  nombre_producto VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  calificacion_promedio DECIMAL(3,1) NOT NULL,
  tiempo_preparacion_min INT NOT NULL,
  estado_disponibilidad ENUM('disponible', 'agotado', 'en_precurso', 'descontinuado') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_precio_urbano CHECK (precio >= 0.00),
  CONSTRAINT chk_calificacion_urbano CHECK (calificacion_promedio >= 0.0 AND calificacion_promedio <= 5.0),
  CONSTRAINT chk_tiempo_prep CHECK (tiempo_preparacion_min > 0)
);