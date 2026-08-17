-- Campuslands MySQL - intermedio ejercicio 017
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
  categoria ENUM('camisa','pantalon','vestido','chaqueta','accesorio') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  CONSTRAINT chk_productos_intermedio_precio CHECK (precio > 0)
);

CREATE TABLE ventas_intermedio (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  id_producto INT NOT NULL,
  cliente_nombre VARCHAR(120) NOT NULL,
  cantidad INT NOT NULL DEFAULT 1,
  fecha_venta DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_ventas_intermedio_producto FOREIGN KEY (id_producto) REFERENCES productos_intermedio (id_producto),
  CONSTRAINT chk_ventas_intermedio_cantidad CHECK (cantidad > 0)
);
