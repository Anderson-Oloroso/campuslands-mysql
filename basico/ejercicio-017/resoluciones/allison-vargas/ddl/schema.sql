-- DDL: Estructura de tabla enfocada en tipos de datos precisos para prendas
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS inventario_ropa;

CREATE TABLE inventario_ropa (
    prenda_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_sku VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('camisas', 'pantalones', 'chaquetas', 'vestidos', 'calzado', 'accesorios') NOT NULL,
    talla ENUM('XS', 'S', 'M', 'L', 'XL') NOT NULL,
    color VARCHAR(30) NOT NULL,
    precio DECIMAL(8,2) NOT NULL CHECK (precio > 0.00),
    stock_disponible INT NOT NULL DEFAULT 0 CHECK (stock_disponible >= 0),
    en_oferta BOOLEAN NOT NULL DEFAULT FALSE,
    fecha_ingreso DATE NOT NULL
) ENGINE=InnoDB;
