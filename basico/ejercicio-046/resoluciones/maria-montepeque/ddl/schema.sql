-- Campuslands MySQL - basico ejercicio 046
-- Resolucion: maria-montepeque
-- Tema: restaurante de comida urbana
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS platos_basico;

CREATE TABLE platos_basico (
  id_plato INT AUTO_INCREMENT PRIMARY KEY,
  nombre_plato VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('entrada','plato_fuerte','postre','bebida','acompanamiento') NOT NULL,
  precio DECIMAL(8,2) NOT NULL,
  calorias INT NOT NULL,
  disponible BOOLEAN NOT NULL DEFAULT TRUE,
  fecha_creacion DATE NOT NULL,
  CONSTRAINT chk_platos_basico_precio CHECK (precio > 0),
  CONSTRAINT chk_platos_basico_calorias CHECK (calorias > 0)
);
