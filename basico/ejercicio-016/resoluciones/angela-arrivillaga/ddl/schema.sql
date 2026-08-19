CREATE DATABASE IF NOT EXISTS restaurante_urbano_db;
USE restaurante_urbano_db;

CREATE TABLE categorias_menu (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion VARCHAR(150)
);

CREATE TABLE productos_urbana (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR(80) NOT NULL,
    id_categoria INT,
    precio DECIMAL(6,2) NOT NULL,
    calorias INT NOT NULL,
    estado_disponibilidad ENUM('disponible', 'agotado', 'proximamente', 'descontinuado') DEFAULT 'disponible',
    FOREIGN KEY (id_categoria) REFERENCES categorias_menu(id_categoria),
    CONSTRAINT chk_precio_producto CHECK (precio > 0.00),
    CONSTRAINT chk_calorias CHECK (calorias > 0)
);