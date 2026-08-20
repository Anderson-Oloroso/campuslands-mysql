CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS saltos_paracaidismo;

-- Creación de la tabla principal definiendo una estructura profesional, restricciones y tipos adecuados
CREATE TABLE saltos_paracaidismo (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_salto VARCHAR(20) NOT NULL UNIQUE,
  nombre_paracaidista VARCHAR(100) NOT NULL,
  tipo_salto ENUM('tandem', 'afc', 'solo', 'instructor', 'acrobatico') NOT NULL,
  altura_pies INT NOT NULL,
  precio_usd DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  calificacion_experiencia DECIMAL(3,1) NOT NULL,
  fecha_salto DATE NOT NULL,
  estado_salto ENUM('programado', 'completado', 'cancelado_clima', 'reprogramado') NOT NULL DEFAULT 'programado',
  CONSTRAINT chk_altura CHECK (altura_pies >= 1000 AND altura_pies <= 20000),
  CONSTRAINT chk_precio_salto CHECK (precio_usd >= 0.00),
  CONSTRAINT chk_calif_salto CHECK (calificacion_experiencia >= 0.0 AND calificacion_experiencia <= 5.0)
);