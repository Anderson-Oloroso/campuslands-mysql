CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pedidos_marketplace;

CREATE TABLE pedidos_marketplace (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_pedido VARCHAR(50) NOT NULL UNIQUE,
  cliente VARCHAR(100) NOT NULL,
  accesorio VARCHAR(100) NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  cantidad INT NOT NULL DEFAULT 1,
  fecha_pedido DATE NOT NULL,
  estado_pedido ENUM('pendiente', 'enviado', 'entregado', 'cancelado') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT chk_precio_positivo CHECK (precio_unitario > 0.00),
  CONSTRAINT chk_cantidad_positiva CHECK (cantidad > 0)
);