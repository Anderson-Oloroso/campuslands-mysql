-- Campuslands MySQL - intermedio ejercicio 017
-- Contexto: Modulo de datos para tienda de ropa (LEFT JOIN).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_017_ventas;
DROP TABLE IF EXISTS intermedio_ejercicio_017_prendas;

CREATE TABLE intermedio_ejercicio_017_prendas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  precio DECIMAL(8,2) NOT NULL
);

CREATE TABLE intermedio_ejercicio_017_ventas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  prenda_id INT NOT NULL,
  cantidad INT NOT NULL,
  fecha_venta DATE NOT NULL,
  FOREIGN KEY (prenda_id) REFERENCES intermedio_ejercicio_017_prendas(id) ON DELETE CASCADE
);