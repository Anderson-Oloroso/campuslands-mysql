-- Campuslands MySQL - intermedio ejercicio 047
-- Resolucion: maria-montepeque
-- Tema: tienda de ropa
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ventas_intermedio;
DROP TABLE IF EXISTS productos_intermedio;

CREATE TABLE productos_intermedio (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('camisetas','pantalones','vestidos','chaquetas','calzado') NOT NULL
);

CREATE TABLE ventas_intermedio (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(8,2) NOT NULL,
  fecha DATETIME NOT NULL,
  CONSTRAINT fk_ventas_intermedio_producto FOREIGN KEY (id_producto) REFERENCES productos_intermedio (id_producto),
  CONSTRAINT chk_ventas_intermedio_cantidad CHECK (cantidad > 0),
  CONSTRAINT chk_ventas_intermedio_precio CHECK (precio_unitario > 0)
);
