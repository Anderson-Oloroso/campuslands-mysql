CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pedidos_accesorios;

CREATE TABLE pedidos_accesorios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_nombre VARCHAR(100) NOT NULL,
  producto_accesorio VARCHAR(50) NOT NULL,
  fecha_pedido DATETIME NOT NULL,
  precio_usd DECIMAL(10,2) NOT NULL,
  estado_pedido ENUM('pendiente', 'enviado', 'entregado', 'cancelado') DEFAULT 'pendiente',
  
  -- Validación para asegurar que el precio sea positivo
  CONSTRAINT chk_precio_positivo CHECK (precio_usd > 0)
);