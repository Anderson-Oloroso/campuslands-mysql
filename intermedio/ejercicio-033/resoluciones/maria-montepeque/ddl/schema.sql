-- Campuslands MySQL - intermedio ejercicio 033
-- Resolucion: maria-montepeque
-- Tema: inventario de skins shooter
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS ventas_skins_intermedio;

CREATE TABLE ventas_skins_intermedio (
  id_venta INT AUTO_INCREMENT PRIMARY KEY,
  nombre_skin VARCHAR(120) NOT NULL,
  arma VARCHAR(60) NOT NULL,
  rareza ENUM('comun','poco_comun','raro','epico','legendario') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  comprador VARCHAR(80) NOT NULL,
  fecha_venta DATE NOT NULL,
  CONSTRAINT chk_ventas_skins_intermedio_precio CHECK (precio > 0)
);
