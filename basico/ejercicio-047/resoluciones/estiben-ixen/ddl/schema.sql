-- Campuslands MySQL - basico ejercicio-047
-- Tema: tienda de ropa (tipos de datos)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS prendas_vestir;

CREATE TABLE prendas_vestir (
    id_prenda INT AUTO_INCREMENT PRIMARY KEY,
    nombre_articulo VARCHAR(80) NOT NULL,
    id_marca INT NOT NULL,
    talla ENUM('XS','S','M','L','XL','XXL') NOT NULL,
    color VARCHAR(30) NOT NULL,
    genero ENUM('Hombre','Mujer','Unisex') NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    stock_disponible INT NOT NULL DEFAULT 0
);
