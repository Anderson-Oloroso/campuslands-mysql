-- Campuslands MySQL - basico ejercicio 004
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS garage_motos;

CREATE TABLE garage_motos (
  id_moto INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(50) NOT NULL UNIQUE,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(50) NOT NULL,
  cilindrada_cc INT NOT NULL,
  servicio_requerido VARCHAR(150) NOT NULL,
  costo_estimado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado ENUM('en_espera','en_reparacion','listo', 'entregado') NOT NULL DEFAULT 'en_espera',
  fecha_ingreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
