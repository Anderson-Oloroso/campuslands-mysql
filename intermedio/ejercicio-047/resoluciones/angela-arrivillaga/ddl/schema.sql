-- Creación de base de datos para tienda de ropa
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Tabla de categorías de ropa
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE
);

-- Tabla de productos con estado y restricciones
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    categoria_id INT, -- Puede ser NULL para practicar LEFT JOIN
    nombre_producto VARCHAR(100) NOT NULL,
    precio_unidad DECIMAL(10, 2) NOT NULL,
    stock INT DEFAULT 0,
    estado_venta ENUM('disponible', 'descontinuado') DEFAULT 'disponible',
    CONSTRAINT fk_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE SET NULL,
    CONSTRAINT chk_precio CHECK (precio_unidad > 0),
    CONSTRAINT chk_stock CHECK (stock >= 0)
);