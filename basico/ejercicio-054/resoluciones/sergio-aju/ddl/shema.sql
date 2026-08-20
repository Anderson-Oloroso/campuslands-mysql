CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS inspecciones_soldadura;

-- Creación de la tabla principal definiendo restricciones rigurosas para probar eliminaciones controladas
CREATE TABLE inspecciones_soldadura (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_inspeccion VARCHAR(20) NOT NULL UNIQUE,
  nombre_soldador VARCHAR(100) NOT NULL,
  proceso_soldadura ENUM('SMAW', 'GMAW', 'GTAW', 'FCAW', 'SAW') NOT NULL,
  material_base ENUM('Acero al Carbono', 'Acero Inoxidable', 'Aluminio', 'Aleacion de Niquel') NOT NULL,
  longitud_cordon_cm DECIMAL(8,2) NOT NULL,
  resistencia_traccion_mpa DECIMAL(8,2) NOT NULL,
  resultado_inspeccion ENUM('aprobado', 'rechazado', 'reproceso_pendiente', 'cancelado') NOT NULL DEFAULT 'reproceso_pendiente',
  CONSTRAINT chk_longitud_cordon CHECK (longitud_cordon_cm > 0.0),
  CONSTRAINT chk_resistencia_mpa CHECK (resistencia_traccion_mpa > 0.0)
);