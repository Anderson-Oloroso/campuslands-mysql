-- Campuslands MySQL - avanzado ejercicio 016
-- Resolucion: maria-montepeque
-- Tema: restaurante de comida urbana
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS movimientos_inventario_avanzado;
DROP TABLE IF EXISTS pedidos_avanzado;
DROP TABLE IF EXISTS ingredientes_avanzado;

CREATE TABLE ingredientes_avanzado (
  id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  unidad_medida VARCHAR(20) NOT NULL,
  stock_actual DECIMAL(10,2) NOT NULL DEFAULT 0,
  stock_minimo DECIMAL(10,2) NOT NULL DEFAULT 0,
  CONSTRAINT chk_ingredientes_avanzado_stock CHECK (stock_actual >= 0)
) ENGINE=InnoDB;

CREATE TABLE pedidos_avanzado (
  id_pedido INT AUTO_INCREMENT PRIMARY KEY,
  cliente_nombre VARCHAR(120) NOT NULL,
  total DECIMAL(10,2) NOT NULL DEFAULT 0,
  estado ENUM('confirmado','cancelado') NOT NULL DEFAULT 'confirmado',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE movimientos_inventario_avanzado (
  id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
  id_ingrediente INT NOT NULL,
  id_pedido INT NULL,
  tipo ENUM('entrada','salida') NOT NULL,
  cantidad DECIMAL(10,2) NOT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_movimientos_avanzado_ingrediente FOREIGN KEY (id_ingrediente) REFERENCES ingredientes_avanzado (id_ingrediente),
  CONSTRAINT fk_movimientos_avanzado_pedido FOREIGN KEY (id_pedido) REFERENCES pedidos_avanzado (id_pedido),
  CONSTRAINT chk_movimientos_avanzado_cantidad CHECK (cantidad > 0)
) ENGINE=InnoDB;
