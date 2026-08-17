-- Campuslands MySQL - basico ejercicio 035
-- Resolucion: maria-montepeque
-- Tema: taller mecanico de motos
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS repuestos_basico;

CREATE TABLE repuestos_basico (
  id_repuesto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('motor','frenos','suspension','electrico','carroceria') NOT NULL,
  marca_compatible VARCHAR(60) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  CONSTRAINT chk_repuestos_basico_precio CHECK (precio > 0)
);
