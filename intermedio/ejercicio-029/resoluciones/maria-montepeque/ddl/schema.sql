-- Campuslands MySQL - intermedio ejercicio 029
-- Resolucion: maria-montepeque
-- Tema: marketplace de accesorios
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP VIEW IF EXISTS vw_catalogo_publico_intermedio;
DROP VIEW IF EXISTS vw_productos_destacados_intermedio;
DROP VIEW IF EXISTS vw_productos_disponibles_intermedio;
DROP TABLE IF EXISTS productos_intermedio;

CREATE TABLE productos_intermedio (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('collares','pulseras','aretes','anillos','bolsos') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL DEFAULT 0,
  destacado BOOLEAN NOT NULL DEFAULT FALSE,
  CONSTRAINT chk_productos_intermedio_precio CHECK (precio > 0),
  CONSTRAINT chk_productos_intermedio_stock CHECK (stock >= 0)
);

-- Vistas simples: una sola tabla, sin JOIN ni agregacion. Cada una
-- resuelve un caso de uso concreto y reutilizable.

-- 1) Solo los productos que hoy se pueden vender (con stock).
CREATE VIEW vw_productos_disponibles_intermedio AS
SELECT id_producto, nombre, categoria, precio, stock
FROM productos_intermedio
WHERE stock > 0;

-- 2) Los productos marcados para la vitrina principal.
CREATE VIEW vw_productos_destacados_intermedio AS
SELECT id_producto, nombre, categoria, precio
FROM productos_intermedio
WHERE destacado = TRUE;

-- 3) Catalogo publico: oculta el stock interno, un cliente no
-- necesita saber cuantas unidades exactas quedan.
CREATE VIEW vw_catalogo_publico_intermedio AS
SELECT id_producto, nombre, categoria, precio
FROM productos_intermedio;
