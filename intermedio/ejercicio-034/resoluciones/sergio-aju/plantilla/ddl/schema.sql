CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

-- Eliminar tabla previa para garantizar una ejecución limpia desde cero
DROP TABLE IF EXISTS garaje_motos_having;

-- Creación de la tabla con tipos de datos estrictos y restricciones de validación
CREATE TABLE garaje_motos_having (
  id INT AUTO_INCREMENT PRIMARY KEY,
  placa VARCHAR(10) NOT NULL UNIQUE,
  marca VARCHAR(50) NOT NULL,
  modelo VARCHAR(60) NOT NULL,
  cilindrada_cc INT UNSIGNED NOT NULL,
  anio_fabricacion INT UNSIGNED NOT NULL,
  precio_comercial DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  estado_motos ENUM('disponible', 'en_mantenimiento', 'alquilada', 'reservada') NOT NULL DEFAULT 'disponible',
  CONSTRAINT chk_cilindrada_having CHECK (cilindrada_cc > 0),
  CONSTRAINT chk_anio_having CHECK (anio_fabricacion >= 1950 AND anio_fabricacion <= 2026),
  CONSTRAINT chk_precio_having CHECK (precio_comercial >= 0.00)
);