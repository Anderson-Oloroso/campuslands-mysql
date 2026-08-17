-- Campuslands MySQL - basico ejercicio 017
-- Contexto: Modulo de datos para tienda de ropa (Tipos de datos).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_017_prendas;

CREATE TABLE basico_ejercicio_017_prendas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  codigo_barras CHAR(12) NOT NULL UNIQUE,
  nombre VARCHAR(100) NOT NULL,
  talla ENUM('XS', 'S', 'M', 'L', 'XL', 'XXL') NOT NULL,
  color VARCHAR(30) NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  stock SMALLINT NOT NULL DEFAULT 0,
  en_oferta BOOLEAN NOT NULL DEFAULT FALSE,
  fecha_ingreso DATE NOT NULL
);