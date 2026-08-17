-- Campuslands MySQL - basico ejercicio 017
-- Resolucion: maria-montepeque
-- Tema: tienda de ropa
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS prendas_basico;

CREATE TABLE prendas_basico (
  id_prenda INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  talla ENUM('XS','S','M','L','XL','XXL') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  stock SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  es_temporada_alta BOOLEAN NOT NULL DEFAULT FALSE,
  fecha_ingreso DATE NOT NULL,
  descripcion TEXT NULL,
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_prendas_basico_precio CHECK (precio > 0)
);
