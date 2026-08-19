CREATE DATABASE IF NOT EXISTS restaurante_urbano_db;
USE restaurante_urbano_db;

CREATE TABLE categorias_menu (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nombre_categoria VARCHAR(50) NOT NULL UNIQUE,
    descripcion_categoria VARCHAR(150)
);

CREATE TABLE platos_urbanos (
    id_plato INT PRIMARY KEY AUTO_INCREMENT,
    codigo_plato VARCHAR(20) NOT NULL UNIQUE,
    nombre_plato VARCHAR(100) NOT NULL,
    id_categoria INT,
    precio DECIMAL(6,2) NOT NULL,
    calorias INT NOT NULL,
    estado_plato ENUM('disponible', 'agotado', 'nuevo', 'descontinuado') DEFAULT 'disponible',
    FOREIGN KEY (id_categoria) REFERENCES categorias_menu(id_categoria),
    CONSTRAINT chk_precio_plato CHECK (precio > 0.00),
    CONSTRAINT chk_calorias CHECK (calorias > 0)
);