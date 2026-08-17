-- Campuslands MySQL - avanzado ejercicio 031
-- Resolucion: maria-montepeque
-- Tema: torneo esports MOBA
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS pagos_equipos_avanzado;
DROP TABLE IF EXISTS premio_pool_avanzado;

CREATE TABLE premio_pool_avanzado (
  id_pool INT AUTO_INCREMENT PRIMARY KEY,
  torneo VARCHAR(120) NOT NULL UNIQUE,
  monto_total DECIMAL(12,2) NOT NULL,
  monto_disponible DECIMAL(12,2) NOT NULL,
  CONSTRAINT chk_premio_pool_avanzado_total CHECK (monto_total > 0),
  CONSTRAINT chk_premio_pool_avanzado_disponible CHECK (monto_disponible >= 0)
) ENGINE=InnoDB;

CREATE TABLE pagos_equipos_avanzado (
  id_pago INT AUTO_INCREMENT PRIMARY KEY,
  id_pool INT NOT NULL,
  equipo VARCHAR(120) NOT NULL,
  monto DECIMAL(12,2) NOT NULL,
  fase ENUM('grupos','cuartos','semifinal','final') NOT NULL,
  estado ENUM('confirmado','cancelado') NOT NULL DEFAULT 'confirmado',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_pagos_equipos_avanzado_pool FOREIGN KEY (id_pool) REFERENCES premio_pool_avanzado (id_pool),
  CONSTRAINT chk_pagos_equipos_avanzado_monto CHECK (monto > 0)
) ENGINE=InnoDB;
