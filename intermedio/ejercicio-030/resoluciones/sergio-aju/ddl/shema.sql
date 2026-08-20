CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tablas en orden inverso para evitar conflictos de llaves foráneas
DROP TABLE IF EXISTS inventario_streaming;
DROP TABLE IF EXISTS bodegas_streaming;

-- 1. Tabla de Ubicaciones / Bodegas (Entidad de soporte para la carga y distribución)
CREATE TABLE bodegas_streaming (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_bodega VARCHAR(100) NOT NULL UNIQUE,
  ciudad VARCHAR(60) NOT NULL,
  capacidad_maxima INT NOT NULL,
  CONSTRAINT chk_capacidad_bodega CHECK (capacidad_maxima > 0)
);

-- 2. Tabla Principal de Inventario de Equipos de Streaming (Optimizada para inserción masiva)
CREATE TABLE inventario_streaming (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_serial VARCHAR(60) NOT NULL UNIQUE,
  nombre_equipo VARCHAR(120) NOT NULL,
  categoria ENUM('Microfono', 'Camara', 'Iluminacion', 'Capturadora', 'Stream Deck', 'Audio Interface') NOT NULL,
  precio_compra DECIMAL(10,2) NOT NULL,
  precio_venta DECIMAL(10,2) NOT NULL,
  stock_actual INT NOT NULL DEFAULT 0,
  bodega_id INT NOT NULL,
  estado_inventario ENUM('activo', 'en_transito', 'descargado', 'revision') NOT NULL DEFAULT 'activo',
  fecha_ingreso DATE NOT NULL,
  CONSTRAINT fk_inventario_bodega FOREIGN KEY (bodega_id) REFERENCES bodegas_streaming(id) ON DELETE RESTRICT,
  CONSTRAINT chk_precio_compra CHECK (precio_compra > 0.00),
  CONSTRAINT chk_precio_venta CHECK (precio_venta > 0.00),
  CONSTRAINT chk_stock_inventario CHECK (stock_actual >= 0)
);