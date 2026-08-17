-- Campuslands MySQL - avanzado ejercicio 033
-- Resolucion: maria-montepeque
-- Tema: inventario de skins shooter
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS mercado_skins_avanzado;

CREATE TABLE mercado_skins_avanzado (
  id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
  nombre_skin VARCHAR(120) NOT NULL,
  comprador_email VARCHAR(160) NOT NULL,
  precio_compra DECIMAL(10,2) NOT NULL,
  precio_venta DECIMAL(10,2) NOT NULL,
  fecha_compra DATE NOT NULL,
  fecha_venta DATE NOT NULL,
  CONSTRAINT chk_mercado_skins_avanzado_precios CHECK (precio_compra > 0 AND precio_venta > 0),
  CONSTRAINT chk_mercado_skins_avanzado_fechas CHECK (fecha_venta >= fecha_compra)
);
