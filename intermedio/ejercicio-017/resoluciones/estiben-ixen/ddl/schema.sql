-- Campuslands MySQL - intermedio ejercicio-017
-- Tema: tienda de ropa (LEFT JOIN)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS prendas_vestir;
DROP TABLE IF EXISTS marcas_ropa;

CREATE TABLE marcas_ropa (
    id_marca INT AUTO_INCREMENT PRIMARY KEY,
    nombre_marca VARCHAR(50) NOT NULL UNIQUE,
    pais_origen VARCHAR(40) NOT NULL,
    segmento ENUM('Streetwear','Lujo','Deportivo','Casual','Formal') NOT NULL
);

CREATE TABLE prendas_vestir (
    id_prenda INT AUTO_INCREMENT PRIMARY KEY,
    nombre_articulo VARCHAR(80) NOT NULL,
    id_marca INT NOT NULL,
    talla ENUM('XS','S','M','L','XL','XXL') NOT NULL,
    color VARCHAR(30) NOT NULL,
    genero ENUM('Hombre','Mujer','Unisex') NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    stock_disponible INT NOT NULL DEFAULT 0,
    FOREIGN KEY (id_marca) REFERENCES marcas_ropa(id_marca) ON DELETE CASCADE
);
