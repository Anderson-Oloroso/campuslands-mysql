-- Ejercicio 016 - CREATE TABLE para restaurante de comida urbana
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_016;

CREATE TABLE basico_ejercicio_016 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_platillo VARCHAR(150) NOT NULL,
  categoria ENUM('hamburguesas','tacos','bebidas','postres','acompañamientos') NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  disponible ENUM('si','no') NOT NULL DEFAULT 'si',
  agregado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_precio_valido CHECK (precio > 0)
);
