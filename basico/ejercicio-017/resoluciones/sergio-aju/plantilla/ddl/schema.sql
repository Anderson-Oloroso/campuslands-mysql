-- Campuslands MySQL - Basico Ejercicio 017
-- Tipos de datos para Tienda de Ropa
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_017;

CREATE TABLE basico_ejercicio_017 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    prenda VARCHAR(120) NOT NULL,
    categoria VARCHAR(80) NOT NULL,
    talla ENUM('XS', 'S', 'M', 'L', 'XL') NOT NULL DEFAULT 'M',
    color VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    stock INT NOT NULL DEFAULT 0,
    estado ENUM('activo', 'agotado', 'descontinuado') NOT NULL DEFAULT 'activo'
);
