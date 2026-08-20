CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS paquetes_turisticos;

-- Creación de la tabla principal definiendo una PRIMARY KEY robusta, tipos estrictos y validaciones
CREATE TABLE paquetes_turisticos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_paquete VARCHAR(20) NOT NULL UNIQUE,
  nombre_destino VARCHAR(100) NOT NULL,
  pais_destino VARCHAR(50) NOT NULL,
  duracion_dias INT NOT NULL,
  precio_por_persona DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  cupos_disponibles INT NOT NULL DEFAULT 0,
  calificacion_experiencia DECIMAL(3,1) NOT NULL,
  estado_paquete ENUM('disponible', 'agotado', 'proximamente', 'cancelado') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_precio_turismo CHECK (precio_por_persona >= 0.00),
  CONSTRAINT chk_duracion_dias CHECK (duracion_dias > 0),
  CONSTRAINT chk_cupos CHECK (cupos_disponibles >= 0),
  CONSTRAINT chk_calificacion_turismo CHECK (calificacion_experiencia >= 0.0 AND calificacion_experiencia <= 5.0)
);