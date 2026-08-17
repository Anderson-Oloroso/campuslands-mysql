-- Campuslands MySQL - basico ejercicio 047
-- Resolucion: maria-montepeque
-- Tema: tienda de ropa
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS productos_ropa_basico;

-- Tipos de datos usados a proposito: ENUM, DECIMAL, SMALLINT UNSIGNED,
-- BOOLEAN, DATE, DATETIME y TEXT, cada uno elegido por lo que
-- realmente representa el dato.
CREATE TABLE productos_ropa_basico (
  id_producto INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('camisetas','pantalones','vestidos','chaquetas','calzado') NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  stock SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  en_oferta BOOLEAN NOT NULL DEFAULT FALSE,
  fecha_ingreso DATE NOT NULL,
  ultima_venta DATETIME NOT NULL,
  descripcion TEXT NULL,
  CONSTRAINT chk_productos_ropa_basico_precio CHECK (precio > 0)
);
