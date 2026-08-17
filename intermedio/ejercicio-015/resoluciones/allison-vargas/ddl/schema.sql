-- DDL: Estructura optimizada para carga masiva de inventario de videojuegos
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS carga_biblioteca_gamer;

CREATE TABLE carga_biblioteca_gamer (
    registro_id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_sku VARCHAR(30) NOT NULL UNIQUE,
    titulo VARCHAR(120) NOT NULL,
    plataforma VARCHAR(50) NOT NULL,
    formato ENUM('digital', 'fisico') DEFAULT 'digital',
    precio_tienda DECIMAL(8,2) NOT NULL CHECK (precio_tienda >= 0.00),
    descuento_porcentaje DECIMAL(4,2) DEFAULT 0.00 CHECK (descuento_porcentaje BETWEEN 0.00 AND 100.00),
    stock_disponible INT NOT NULL DEFAULT 0 CHECK (stock_disponible >= 0),
    fecha_carga TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
