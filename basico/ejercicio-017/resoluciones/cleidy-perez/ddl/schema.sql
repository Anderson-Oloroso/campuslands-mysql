-- Campuslands MySQL - basico ejercicio 017
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE productos_ropa (
    id_producto INT AUTO_INCREMENT PRIMARY KEY, 
    nombre_prenda VARCHAR(100) NOT NULL,        
    categoria ENUM('Camisetas', 'Pantalones', 'Chaquetas', 'Calzado', 'Accesorios') NOT NULL, 
    talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL', 'Única') NOT NULL,                         
    color VARCHAR(30) NOT NULL,                 
    precio DECIMAL(8,2) NOT NULL CHECK (precio > 0.00), 
    stock_disponible INT NOT NULL DEFAULT 0 CHECK (stock_disponible >= 0) 
);

CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT NOT NULL,                 
    cantidad INT NOT NULL DEFAULT 1 CHECK (cantidad > 0), 
    metodo_pago ENUM('Efectivo', 'Tarjeta', 'Transferencia') NOT NULL, 
    fecha_venta DATETIME DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (id_producto) REFERENCES productos_ropa(id_producto) ON DELETE CASCADE
);