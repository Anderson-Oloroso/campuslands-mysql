-- Campuslands MySQL - basico ejercicio-059
-- Tema: marketplace de accesorios (fechas basicas)
-- Ejecutar este archivo antes de inserts.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS productos_accesorios;

CREATE TABLE productos_accesorios (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR(80) NOT NULL,
    id_vendedor INT NOT NULL,
    categoria ENUM('Audio','Teclados y Mouses','Cables y Hubs','Soportes y Ergonomia','Iluminacion RGB','Mochilas y Fundas') NOT NULL,
    precio DECIMAL(7,2) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    es_envio_gratis ENUM('Si','No') DEFAULT 'Si',
    valoracion_promedio DECIMAL(3,2) NOT NULL DEFAULT 4.50
);
