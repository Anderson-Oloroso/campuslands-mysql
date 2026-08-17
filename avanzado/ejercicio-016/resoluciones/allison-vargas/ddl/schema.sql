-- DDL: Estructura transaccional para restaurante de comida urbana
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS detalle_pedidos_urbano;
DROP TABLE IF EXISTS pedidos_urbano;
DROP TABLE IF EXISTS productos_urbano;

CREATE TABLE productos_urbano (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    categoria ENUM('hamburguesa', 'tacos', 'hot_dog', 'bebida', 'acompañamiento') NOT NULL,
    precio DECIMAL(6,2) NOT NULL CHECK (precio > 0.00),
    stock_disponible INT NOT NULL DEFAULT 0 CHECK (stock_disponible >= 0)
) ENGINE=InnoDB;

CREATE TABLE pedidos_urbano (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_nombre VARCHAR(100) NOT NULL,
    fecha_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    monto_total DECIMAL(8,2) DEFAULT 0.00 CHECK (monto_total >= 0.00),
    estado_pedido ENUM('pendiente', 'procesado', 'cancelado') DEFAULT 'pendiente'
) ENGINE=InnoDB;

CREATE TABLE detalle_pedidos_urbano (
    detalle_id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(6,2) NOT NULL CHECK (precio_unitario > 0.00),
    FOREIGN KEY (pedido_id) REFERENCES pedidos_urbano(pedido_id) ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES productos_urbano(producto_id)
) ENGINE=InnoDB;
