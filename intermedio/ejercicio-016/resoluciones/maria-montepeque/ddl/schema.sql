-- Campuslands MySQL - intermedio ejercicio 016
-- Resolucion: maria-montepeque
-- Tema: restaurante de comida urbana
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pedidos_intermedio;
DROP TABLE IF EXISTS platillos_intermedio;
DROP TABLE IF EXISTS clientes_intermedio;

CREATE TABLE clientes_intermedio (
  id_cliente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL,
  ciudad VARCHAR(80) NOT NULL,
  telefono VARCHAR(20) NOT NULL
);

CREATE TABLE platillos_intermedio (
  id_platillo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('hamburguesa','taco','bebida','postre','acompanamiento') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  CONSTRAINT chk_platillos_intermedio_precio CHECK (precio > 0)
);

CREATE TABLE pedidos_intermedio (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  id_cliente INT NOT NULL,
  id_platillo INT NOT NULL,
  cantidad INT NOT NULL DEFAULT 1,
  fecha_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  estado ENUM('pendiente','en_preparacion','entregado','cancelado') NOT NULL DEFAULT 'pendiente',
  CONSTRAINT fk_pedidos_intermedio_cliente FOREIGN KEY (id_cliente) REFERENCES clientes_intermedio (id_cliente),
  CONSTRAINT fk_pedidos_intermedio_platillo FOREIGN KEY (id_platillo) REFERENCES platillos_intermedio (id_platillo),
  CONSTRAINT chk_pedidos_intermedio_cantidad CHECK (cantidad > 0)
);
