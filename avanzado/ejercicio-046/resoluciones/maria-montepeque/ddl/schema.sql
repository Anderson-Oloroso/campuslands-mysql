-- Campuslands MySQL - avanzado ejercicio 046
-- Resolucion: maria-montepeque
-- Tema: restaurante de comida urbana
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pagos_mesas_avanzado;
DROP TABLE IF EXISTS caja_avanzado;

CREATE TABLE caja_avanzado (
  id_caja INT AUTO_INCREMENT PRIMARY KEY,
  turno VARCHAR(120) NOT NULL UNIQUE,
  monto_inicial DECIMAL(12,2) NOT NULL,
  monto_actual DECIMAL(12,2) NOT NULL,
  CONSTRAINT chk_caja_avanzado_inicial CHECK (monto_inicial >= 0),
  CONSTRAINT chk_caja_avanzado_actual CHECK (monto_actual >= 0)
) ENGINE=InnoDB;

CREATE TABLE pagos_mesas_avanzado (
  id_pago INT AUTO_INCREMENT PRIMARY KEY,
  id_caja INT NOT NULL,
  mesa VARCHAR(60) NOT NULL,
  concepto VARCHAR(120) NOT NULL,
  monto DECIMAL(10,2) NOT NULL,
  estado ENUM('confirmado','cancelado') NOT NULL DEFAULT 'confirmado',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_pagos_mesas_avanzado_caja FOREIGN KEY (id_caja) REFERENCES caja_avanzado (id_caja),
  CONSTRAINT chk_pagos_mesas_avanzado_monto CHECK (monto > 0)
) ENGINE=InnoDB;
