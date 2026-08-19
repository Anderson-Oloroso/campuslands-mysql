CREATE DATABASE IF NOT EXISTS tienda_ropa_db;
USE tienda_ropa_db;

CREATE TABLE categorias_ropa (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion_categoria VARCHAR(150)
);

CREATE TABLE prendas_tienda (
    id_prenda INT PRIMARY KEY AUTO_INCREMENT,
    codigo_prenda VARCHAR(20) NOT NULL UNIQUE,
    nombre_prenda VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(8,2) NOT NULL,
    stock INT NOT NULL,
    estado_prenda ENUM('disponible', 'agotado', 'oferta', 'descontinuado') DEFAULT 'disponible',
    FOREIGN KEY (id_categoria) REFERENCES categorias_ropa(id_categoria),
    CONSTRAINT chk_precio_prenda CHECK (precio > 0.00),
    CONSTRAINT chk_stock_prenda CHECK (stock >= 0)
);