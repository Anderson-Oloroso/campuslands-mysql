CREATE DATABASE IF NOT EXISTS tienda_ropa_db;
USE tienda_ropa_db;

CREATE TABLE categorias_ropa (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion_categoria VARCHAR(150)
);

CREATE TABLE productos_ropa (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_articulo VARCHAR(80) NOT NULL,
    id_categoria INT,
    talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL', 'Unica') NOT NULL,
    precio_unitario DECIMAL(8,2) NOT NULL,
    stock_actual INT NOT NULL,
    fecha_ingreso DATE NOT NULL,
    estado_disponibilidad ENUM('disponible', 'agotado', 'en_oferta', 'descontinuado') DEFAULT 'disponible',
    FOREIGN KEY (id_categoria) REFERENCES categorias_ropa(id_categoria),
    CONSTRAINT chk_precio_ropa CHECK (precio_unitario > 0.00),
    CONSTRAINT chk_stock_ropa CHECK (stock_actual >= 0)
);  