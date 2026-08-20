-- Campuslands MySQL - intermedio ejercicio-059
-- Tema: marketplace de accesorios (vistas simples)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS productos_accesorios;
DROP TABLE IF EXISTS vendedores_marketplace;

CREATE TABLE vendedores_marketplace (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tienda VARCHAR(60) NOT NULL UNIQUE,
    reputacion_estrellas DECIMAL(3,2) NOT NULL DEFAULT 5.00,
    ventas_totales INT NOT NULL DEFAULT 0
);

CREATE TABLE productos_accesorios (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(80) NOT NULL,
    id_vendedor INT NOT NULL,
    categoria ENUM('Audio','Teclados y Mouses','Cables y Hubs','Soportes y Ergonomia','Iluminacion RGB','Mochilas y Fundas') NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    es_envio_gratis ENUM('Si','No') DEFAULT 'Si',
    valoracion_promedio DECIMAL(3,2) NOT NULL DEFAULT 4.50,
    FOREIGN KEY (id_vendedor) REFERENCES vendedores_marketplace(id_vendedor) ON DELETE CASCADE
);

-- Vista simple asociada al ejercicio
CREATE OR REPLACE VIEW vista_resumen_marketplace AS
SELECT 
    p.nombre_tienda AS entidad_principal,
    COUNT(s.id_producto) AS total_asociados,
    COALESCE(AVG(s.precio), 0) AS promedio_metrica
FROM vendedores_marketplace p
LEFT JOIN productos_accesorios s ON p.id_vendedor = s.id_vendedor
GROUP BY p.id_vendedor, p.nombre_tienda;
