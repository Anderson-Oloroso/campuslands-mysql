-- Campuslands MySQL - avanzado ejercicio 016
-- Contexto: Modulo de datos para restaurante de comida urbana (Transacciones).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS avanzado_ejercicio_016_pedidos;
DROP TABLE IF EXISTS avanzado_ejercicio_016_clientes;

CREATE TABLE avanzado_ejercicio_016_clientes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  billetera_digital DECIMAL(8,2) NOT NULL DEFAULT 0.00,
  CONSTRAINT chk_avanz_016_saldo CHECK (billetera_digital >= 0)
);

CREATE TABLE avanzado_ejercicio_016_pedidos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT NOT NULL,
  descripcion_pedido VARCHAR(200) NOT NULL,
  total_pagar DECIMAL(8,2) NOT NULL,
  estado ENUM('Pendiente', 'Pagado', 'Cancelado') NOT NULL DEFAULT 'Pendiente',
  FOREIGN KEY (cliente_id) REFERENCES avanzado_ejercicio_016_clientes(id) ON DELETE CASCADE
);