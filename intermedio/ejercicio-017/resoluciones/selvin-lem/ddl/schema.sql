-- Campuslands MySQL - intermedio ejercicio 017
-- Tematica: tienda de ropa
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS compras_tienda;
DROP TABLE IF EXISTS clientes_tienda;

CREATE TABLE clientes_tienda (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  ciudad VARCHAR(80) NOT NULL
);

CREATE TABLE compras_tienda (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  prenda VARCHAR(100) NOT NULL,
  monto DECIMAL(10,2) NOT NULL,
  fecha_compra DATE NOT NULL,
  CONSTRAINT fk_compra_cliente FOREIGN KEY (cliente_id) REFERENCES clientes_tienda(id)
);
