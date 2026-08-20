CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS citas_tatuajes;

-- Creación de la tabla principal definiendo una estructura estricta, restricciones y tipos adecuados
CREATE TABLE citas_tatuajes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_cita VARCHAR(20) NOT NULL UNIQUE,
  nombre_cliente VARCHAR(100) NOT NULL,
  nombre_artista VARCHAR(100) NOT NULL,
  estilo_tatuaje ENUM('realismo', 'tradicional', 'neotradicional', 'minimalista', 'japones', 'blackwork') NOT NULL,
  tiempo_estimado_horas DECIMAL(4,1) NOT NULL,
  costo_usd DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  calificacion_satisfaccion DECIMAL(3,1) NOT NULL,
  fecha_cita DATE NOT NULL,
  estado_cita ENUM('programada', 'completada', 'cancelada', 'en_proceso') NOT NULL DEFAULT 'programada',
  CONSTRAINT chk_tiempo_horas CHECK (tiempo_estimado_horas > 0.0),
  CONSTRAINT chk_costo_tatuaje CHECK (costo_usd >= 0.00),
  CONSTRAINT chk_calif_tatuaje CHECK (calificacion_satisfaccion >= 0.0 AND calificacion_satisfaccion <= 5.0)
);