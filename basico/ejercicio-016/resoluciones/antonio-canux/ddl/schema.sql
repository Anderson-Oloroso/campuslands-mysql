-- Campuslands MySQL - basico ejercicio 016
-- Contexto: Modulo de datos para restaurante de comida urbana (CREATE TABLE).

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_016_menu;

CREATE TABLE basico_ejercicio_016_menu (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_plato VARCHAR(100) NOT NULL,
  categoria ENUM('Hamburguesas', 'Hot Dogs', 'Acompañamientos', 'Bebidas', 'Postres') NOT NULL,
  precio DECIMAL(6,2) NOT NULL,
  es_vegetariano BOOLEAN NOT NULL DEFAULT FALSE,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);