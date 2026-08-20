CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso para evitar conflictos de llaves foráneas
DROP TABLE IF EXISTS transacciones_streaming_avanzado;
DROP TABLE IF EXISTS inventario_streaming_avanzado;

-- 1. Tabla Principal de Inventario optimizada con índices específicos para búsquedas frecuentes
CREATE TABLE inventario_streaming_avanzado (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_serial VARCHAR(60) NOT NULL UNIQUE,
  nombre_equipo VARCHAR(120) NOT NULL,
  categoria VARCHAR(60) NOT NULL,
  precio_venta DECIMAL(10,2) NOT NULL,
  stock_actual INT NOT NULL DEFAULT 0,
  estado ENUM('disponible', 'agotado', 'revision') NOT NULL DEFAULT 'disponible',
  -- Creación de índices compuestos para optimizar consultas con filtros combinados (categoria + estado)
  INDEX idx_categoria_estado (categoria, estado),
  INDEX idx_precio (precio_venta),
  CONSTRAINT chk_precio_opt CHECK (precio_venta > 0.00),
  CONSTRAINT chk_stock_opt CHECK (stock_actual >= 0)
);

-- 2. Tabla Transaccional para análisis de rendimiento y reportes masivos
CREATE TABLE transacciones_streaming_avanzado (
  id INT AUTO_INCREMENT PRIMARY KEY,
  equipo_id INT NOT NULL,
  cantidad_vendida INT NOT NULL,
  monto_total DECIMAL(10,2) NOT NULL,
  fecha_transaccion DATE NOT NULL,
  INDEX idx_fecha (fecha_transaccion),
  CONSTRAINT fk_transaccion_equipo FOREIGN KEY (equipo_id) REFERENCES inventario_streaming_avanzado(id) ON DELETE CASCADE,
  CONSTRAINT chk_cant_vendida CHECK (cantidad_vendida > 0)
);