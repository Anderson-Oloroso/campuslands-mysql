CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS inventario_tienda_ropa;

-- Creación de la tabla aplicando tipos de datos precisos y restricciones de validación
CREATE TABLE inventario_tienda_ropa (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_sku VARCHAR(20) NOT NULL UNIQUE,
  nombre_prenda VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL', 'Unica') NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  stock_disponible INT NOT NULL DEFAULT 0,
  es_impermeable BOOLEAN NOT NULL DEFAULT 0,
  fecha_ingreso DATE NOT NULL,
  estado_prenda ENUM('disponible', 'agotado', 'en_oferta', 'descontinuado') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_precio_ropa CHECK (precio_unitario >= 0.00),
  CONSTRAINT chk_stock_ropa CHECK (stock_disponible >= 0)
);