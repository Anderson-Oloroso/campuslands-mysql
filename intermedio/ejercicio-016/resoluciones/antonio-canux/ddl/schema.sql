-- Campuslands MySQL - intermedio ejercicio 016
-- Contexto: Modulo de datos para restaurante de comida urbana (INNER JOIN).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS intermedio_ejercicio_016_pedido_detalles;
DROP TABLE IF EXISTS intermedio_ejercicio_016_pedidos;
DROP TABLE IF EXISTS intermedio_ejercicio_016_platos;

CREATE TABLE intermedio_ejercicio_016_platos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  categoria VARCHAR(50) NOT NULL,
  precio DECIMAL(6,2) NOT NULL
);

CREATE TABLE intermedio_ejercicio_016_pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente VARCHAR(100) NOT NULL,
  numero_mesa INT NOT NULL,
  fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE intermedio_ejercicio_016_pedido_detalles (
  pedido_id INT NOT NULL,
  plato_id INT NOT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (pedido_id, plato_id),
  FOREIGN KEY (pedido_id) REFERENCES intermedio_ejercicio_016_pedidos(id) ON DELETE CASCADE,
  FOREIGN KEY (plato_id) REFERENCES intermedio_ejercicio_016_platos(id) ON DELETE RESTRICT
);