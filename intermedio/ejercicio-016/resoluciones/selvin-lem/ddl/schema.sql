-- Campuslands MySQL - intermedio ejercicio 016
-- Tematica: restaurante de comida urbana
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pedidos_restaurante;
DROP TABLE IF EXISTS clientes_restaurante;

CREATE TABLE clientes_restaurante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL
);

CREATE TABLE pedidos_restaurante (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  platillo VARCHAR(100) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  fecha_pedido DATE NOT NULL,
  CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_id) REFERENCES clientes_restaurante(id)
);
