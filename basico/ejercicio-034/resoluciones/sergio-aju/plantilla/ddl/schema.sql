CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS garaje_motos;

-- Creación de la tabla principal utilizando tipos de datos estrictos y restricciones profesionales
CREATE TABLE garaje_motos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(10) NOT NULL UNIQUE,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(60) NOT NULL,
  cilindrada_cc INT UNSIGNED NOT NULL,
  anio_fabricacion INT UNSIGNED NOT NULL,
  precio_comercial DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado_motos ENUM('disponible', 'en_mantenimiento', 'alquilada', 'reservada') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_cilindrada CHECK (cilindrada_cc > 0),
  CONSTRAINT chk_anio CHECK (anio_fabricacion >= 1950 AND anio_fabricacion <= 2026),
  CONSTRAINT chk_precio_moto CHECK (precio_comercial >= 0.00)
);