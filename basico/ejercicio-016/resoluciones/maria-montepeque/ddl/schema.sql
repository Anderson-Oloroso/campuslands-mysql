-- Campuslands MySQL - basico ejercicio 016
-- Resolucion: maria-montepeque
-- Tema: restaurante de comida urbana
-- Ejecuta este archivo antes de inserts.sql.

CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS platillos_urbanos_basico;

CREATE TABLE platillos_urbanos_basico (
  id_platillo INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(120) NOT NULL UNIQUE,
  categoria ENUM('hamburguesa','taco','bebida','postre','acompanamiento') NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  estado ENUM('disponible','agotado','descontinuado') NOT NULL DEFAULT 'disponible',
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT chk_platillos_urbanos_basico_precio CHECK (precio > 0)
);
