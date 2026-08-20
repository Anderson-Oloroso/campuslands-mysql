CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS proyectos_animacion_3d;

-- Creación de la tabla principal definiendo restricciones rigurosas para probar ordenamientos complejos
CREATE TABLE proyectos_animacion_3d (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_proyecto VARCHAR(20) NOT NULL UNIQUE,
  nombre_secuencia VARCHAR(100) NOT NULL,
  software_empleado ENUM('Blender', 'Maya', 'Cinema 4D', 'Houdini', 'ZBrush') NOT NULL,
  fotogramas_totales INT NOT NULL,
  tiempo_render_horas DECIMAL(6,1) NOT NULL,
  presupuesto_usd DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  calificacion_calidad DECIMAL(3,1) NOT NULL,
  estado_proyecto ENUM('renderizado', 'en_produccion', 'en_composicion', 'pausado') NOT NULL DEFAULT 'en_produccion',
  CONSTRAINT chk_fotogramas CHECK (fotogramas_totales > 0),
  CONSTRAINT chk_tiempo_render CHECK (tiempo_render_horas > 0.0),
  CONSTRAINT chk_presupuesto_3d CHECK (presupuesto_usd >= 0.00),
  CONSTRAINT chk_calificacion_3d CHECK (calificacion_calidad >= 0.0 AND calificacion_calidad <= 5.0)
);