-- Ejercicio 017 - tipos de datos para tienda de ropa
-- Ejecutar primero. Orden: schema.sql -> inserts.sql -> consultas.sql

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS basico_ejercicio_017;

CREATE TABLE basico_ejercicio_017 (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_producto VARCHAR(150) NOT NULL,
  talla ENUM('XS','S','M','L','XL') NOT NULL,
  color VARCHAR(40) NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  stock INT NOT NULL DEFAULT 0,
  disponible_online TINYINT(1) NOT NULL DEFAULT 1,
  fecha_ingreso DATE NOT NULL,
  descripcion TEXT,
  CONSTRAINT chk_017_precio_valido CHECK (precio > 0),
  CONSTRAINT chk_017_stock_valido CHECK (stock >= 0)
);
