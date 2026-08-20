CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS proyectos_arquitectura_3d;

-- Creación de la tabla principal definiendo restricciones estrictas y tipos adecuados
CREATE TABLE proyectos_arquitectura_3d (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_proyecto VARCHAR(20) NOT NULL UNIQUE,
  nombre_proyecto VARCHAR(100) NOT NULL,
  tipo_inmueble ENUM('residencial', 'comercial', 'corporativo', 'industrial', 'paisajismo') NOT NULL,
  superficie_m2 DECIMAL(10,2) NOT NULL,
  honorarios_usd DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  calificacion_cliente DECIMAL(3,1) NOT NULL,
  estado_proyecto ENUM('borrador', 'en_render', 'revision_cliente', 'aprobado', 'entregado') NOT NULL DEFAULT 'borrador',
  CONSTRAINT chk_superficie CHECK (superficie_m2 > 0.0),
  CONSTRAINT chk_honorarios CHECK (honorarios_usd >= 0.00),
  CONSTRAINT chk_calif_arq CHECK (calificacion_cliente >= 0.0 AND calificacion_cliente <= 5.0)
);