-- DDL: Estructura relacional orientada a análisis con LEFT JOIN
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS detalle_ventas_left;
DROP TABLE IF EXISTS productos_ropa_left;

CREATE TABLE productos_ropa_left (
    producto_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_sku VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('camisas', 'pantalones', 'chaquetas', 'vestidos', 'calzado', 'accesorios') NOT NULL,
    precio DECIMAL(8,2) NOT NULL CHECK (precio > 0.00),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0)
) ENGINE=InnoDB;

CREATE TABLE detalle_ventas_left (
    venta_id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    cliente_nombre VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (producto_id) REFERENCES productos_ropa_left(producto_id) ON DELETE CASCADE
) ENGINE=InnoDB;
