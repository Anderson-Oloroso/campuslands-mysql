CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

CREATE TABLE productos_ropa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria ENUM('camisa', 'pantalon', 'chaqueta', 'calzado', 'accesorio') NOT NULL,
    talla ENUM('xs', 's', 'm', 'l', 'xl', 'xxl') NOT NULL,
    precio DECIMAL(8, 2) NOT NULL,
    stock INT NOT NULL,
    estado ENUM('disponible', 'agotado', 'en_oferta') DEFAULT 'disponible',
    CONSTRAINT chk_precio_ropa CHECK (precio > 0),
    CONSTRAINT chk_stock_ropa CHECK (stock >= 0)
);